# GPT OSS

* https://docs.vllm.ai/projects/recipes/en/stable/OpenAI/GPT-OSS.html

## gpt-oss vLLM Usage Guide

`gpt-oss-20b` and `gpt-oss-120b` are powerful reasoning models open-sourced by OpenAI. In vLLM, you can run it on NVIDIA H100, H200, B200 as well as MI300x, MI325x, MI355x and Radeon AI PRO R9700. We are actively working on ensuring this model can work on Ampere, Ada Lovelace, and RTX 5090. Specifically, vLLM optimizes for `gpt-oss` family of models with
`gpt-oss-20b` 和 `gpt-oss-120b` 是 OpenAI 开源的强大推理模型. 在 vLLM 中, 您可以在 NVIDIA H100、H200、B200 以及 MI300x、MI325x、MI355x 和 Radeon AI PRO R9700 上运行它们. 我们正在积极努力确保该模型也能在 Ampere、Ada Lovelace 和 RTX 5090 上运行. 具体来说, vLLM 针对 `gpt-oss` 系列模型进行了优化.

- Flexible parallelism options: the model can be sharded across 2, 4, 8 GPUs, scaling throughput.
  灵活的并行选项: 该模型可以分片到 2、4、8 个 GPU 上, 从而扩展吞吐量.

- High performance attention and MoE kernels: attention kernel is specifically optimized for the attention sinks mechanism and sliding window shapes.
  高性能注意力和 MoE 核: 注意力核专门针对注意力汇聚机制和滑动窗口形状进行了优化.

- Asynchronous scheduling: optimizing for maximum utilization and high throughput by overlapping CPU operations with GPU operations.
  异步调度: 通过将 CPU 操作与 GPU 操作重叠, 优化以实现最大利用率和高吞吐量.

This is a living document and we welcome contributions, corrections, and creation of new recipes!
这是一份不断更新的文件, 我们欢迎大家提供建议、更正错误以及创建新的食谱!

## Quickstart

### Installation vLLM

Create a new virtual environment and install the official release:
创建一个新的虚拟环境并安装官方版本:

```bash
uv venv
source .venv/bin/activate
uv pip install vllm --torch-backend=auto
```

We also provide a docker container with all the dependencies built in
我们还提供了一个内置所有依赖项的 Docker 容器.

```bash
docker run --gpus all \
    -p 8000:8000 \
    --ipc=host \
    vllm/vllm-openai \
    --model openai/gpt-oss-20b
```

### A100

GPT-OSS works on Ampere devices by default, using the `TRITON_ATTN` attention backend and Marlin MXFP4 MoE:
GPT-OSS 默认在 Ampere 设备上工作, 使用 `TRITON_ATTN` 注意力后端和 Marlin MXFP4 MoE:

```bash
# openai/gpt-oss-20b should run on a single A100
vllm serve openai/gpt-oss-20b

# gpt-oss-120b will fit on a single A100 (80GB), but scaling it to higher TP sizes can help with throughput
vllm serve openai/gpt-oss-120b
vllm serve openai/gpt-oss-120b --tensor-parallel-size 2
vllm serve openai/gpt-oss-120b --tensor-parallel-size 4
```

### H100 & H200

Please refer to the [Recipe for NVIDIA Blackwell & Hopper Hardware](https://docs.vllm.ai/projects/recipes/en/stable/OpenAI/GPT-OSS.html#recipe-for-nvidia-blackwell-hopper-hardware) section.
请参阅 [NVIDIA Blackwell 和 Hopper 硬件配方]() 部分.

## AMD

### Installation from pre-built wheels (For AMD ROCm: MI300x/MI325x/MI355x)

We recommend using the official image for AMD GPUs (MI300x/MI325x/MI355x).
我们建议使用 AMD GPU 的官方镜像(MI300x/MI325x/MI355x).

```bash
uv pip install vllm --extra-index-url https://wheels.vllm.ai/rocm
```

> ⚠️ The vLLM wheel for ROCm is compatible with Python 3.12, ROCm 7.0, and glibc >= 2.35. If your environment is incompatible, please use docker flow in [vLLM](https://vllm.ai/)
> ⚠️ vLLM 的 ROCm 版本仅兼容 Python 3.12、ROCm 7.0 和 glibc 2.35. 如果您的环境不兼容, 请在 [vLLM]() 中使用 Docker 工作流.
>

### MI300x/MI325x(gfx942)

You can launch GPT-OSS model serving with vLLM using:
您可以使用 vLLM 启动 GPT-OSS 模型服务:

```bash
vllm serve openai/gpt-oss-120b
```

However, for optimal performance, applying the configuration below can deliver additional speedups and efficiency gains. These configurations were validated on the [vLLM 0.17.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.17.0).
然而, 为了获得最佳性能, 应用以下配置可以进一步提高速度和效率. 这些配置已在 [vLLM 0.17.0 版本]()上验证过.

```bash
export HSA_NO_SCRATCH_RECLAIM=1
export AMDGCN_USE_BUFFER_OPS=0
export VLLM_ROCM_USE_AITER=1
export VLLM_ROCM_QUICK_REDUCE_QUANTIZATION=INT4

vllm serve openai/gpt-oss-120b \
--tensor-parallel-size=8 \
--attention-backend ROCM_AITER_UNIFIED_ATTN \
-cc.pass_config.fuse_rope_kvcache=True \
-cc.use_inductor_graph_partition=True \
--gpu-memory-utilization 0.95 \
--block-size=64
```

- `export HSA_NO_SCRATCH_RECLAIM=1` is only needed on the server with old GPU firmware. If the GPU firmware version is less than 177 by the following command, you need to set `export HSA_NO_SCRATCH_RECLAIM=1` for better performance.
  仅在运行旧版 GPU 固件的服务器上才需要设置 `export HSA_NO_SCRATCH_RECLAIM=1`. 如果通过以下命令测得的 GPU 固件版本低于 177, 则需要设置 `export HSA_NO_SCRATCH_RECLAIM=1` 以获得更好的性能.

```bash
# GPU firmware version check
rocm-smi --showfw | grep MEC | head -n 1 |  awk '{print $NF}'
```

- `export VLLM_ROCM_QUICK_REDUCE_QUANTIZATION=INT4` is to enhance All-Reduce performance by inline compression. For more details, see the [AMD ROCm QuickReduce blog post](https://rocm.blogs.amd.com/artificial-intelligence/quick-reduce/README.html).
  `export VLLM_ROCM_QUICK_REDUCE_QUANTIZATION=INT4` 用于通过内联压缩提升 All-Reduce 的性能. 更多详情, 请参阅 [AMD ROCm QuickReduce 博客文章]().

### MI355x(gfx950)

```bash
export HSA_NO_SCRATCH_RECLAIM=1
export AMDGCN_USE_BUFFER_OPS=0
export VLLM_ROCM_USE_AITER=1
export VLLM_ROCM_QUICK_REDUCE_QUANTIZATION=INT4

vllm serve amd/gpt-oss-120b-w-mxfp4-a-fp8 \
--tensor-parallel-size=8 \
--attention-backend ROCM_AITER_UNIFIED_ATTN \
-cc.pass_config.fuse_rope_kvcache=True \
-cc.use_inductor_graph_partition=True \
--gpu-memory-utilization 0.95 \
--block-size=64
```

- [`amd/gpt-oss-120b-w-mxfp4-a-fp8`](https://huggingface.co/amd/gpt-oss-120b-w-mxfp4-a-fp8) is a Quark-quantized version of openai/gpt-oss-120b with support for fp8-quantized activations with static scales.
  [`amd/gpt-oss-120b-w-mxfp4-a-fp8`]() 是 openai/gpt-oss-120b 的夸克量子化版本, 支持具有静态尺度的 fp8 量子化激活.

#### Known Issues
已知问题

- When you encounter this error `The link interface of target "torch::nvtoolsext" contains: CUDA::nvToolsExt but the target was not found.` Please double check your pytorch version has suffix `+cu128`.
  当您遇到以下错误时 `The link interface of target "torch::nvtoolsext" contains: CUDA::nvToolsExt but the target was not found.` 请仔细检查您的 PyTorch 版本是否带有后缀 `+cu128`.

- If the output you see is garbage, that might be because you haven't properly set `CUDA_HOME`. The CUDA version needs to be greater than or equal to 12.8 and must be the same for installation and serving.
  如果您看到输出乱码, 可能是因为您没有正确设置 `CUDA_HOME` 版本必须大于或等于 12.8, 并且安装和运行环境的 CUDA 版本必须相同.

## Usage

Once the `vllm serve` runs and `INFO: Application startup complete` has been displayed, you can send requests using HTTP request or OpenAI SDK to the following endpoints:
`vllm serve` 运行完毕并显示 `INFO: Application startup complete` 后, 您可以使用 HTTP 请求或 OpenAI SDK 向以下端点发送请求:

- `/v1/responses` endpoint can perform tool use (browsing, python, mcp) in between chain-of-thought and deliver a final response. This endpoint leverages the `openai-harmony` library for input rendering and output parsing. Stateful operation and full streaming API are work in progress. Responses API is recommended by OpenAI as the way to interact with this model.
  `/v1/responses` 端点可以在逻辑链中执行工具操作(浏览、Python、MCP), 并返回最终响应. 该端点利用 `openai-harmony` 库进行输入渲染和输出解析. 状态操作和完整的流式 API 正在开发中. OpenAI 推荐使用 Responses API 与此模型交互.

- `/v1/chat/completions` endpoint offers a familiar interface to this model. No tool will be invoked but reasoning and final text output will be returned structurally. You can also set the parameter `include_reasoning: false` in request parameter to skip CoT being part of the output.
  `/v1/chat/completions` 端点为该模型提供了一个熟悉的接口. 不会调用任何工具, 但会以结构化的方式返回推理过程和最终文本输出. 您还可以将请求参数中的 `include_reasoning: false` 以排除 CoT 包含在输出中.

- `/v1/completions` endpoint is the endpoint for a simple input output interface without any sorts of template rendering.
  `/v1/completions` 端点是一个简单的输入输出界面的端点, 没有任何模板渲染功能.

All endpoints accept `stream: true` as part of the operations to enable incremental token streaming. Please note that vLLM currently does not cover the full scope of responses API, for more detail, please see Limitation section below.
所有端点都接受 `stream: true` 作为操作的一部分, 以启用增量令牌流. 请注意, vLLM 目前尚未涵盖响应 API 的全部功能, 更多详情请参见下方的"限制"部分.

### Tool Use

One premier feature of gpt-oss is the ability to call tools directly, called "built-in tools". In vLLM, we offer several options:
gpt-oss 的一项主要特性是能够直接调用工具, 称为"内置工具". 在 vLLM 中, 我们提供了以下几种选择:

- By default, we integrate with the reference library's browser (with `ExaBackend`) and demo Python interpreter via docker container. In order to use the search backend, you need to get access to [exa.ai](http://exa.ai/) and put `EXA_API_KEY=` as an environment variable. For Python, either have docker available, or set `PYTHON_EXECUTION_BACKEND=dangerously_use_uv` to dangerously allow execution of model generated code snippets to be executed on the same machine. Please note that `PYTHON_EXECUTION_BACKEND=dangerously_use_uv` needs `gpt-oss>=0.0.5`.
  默认情况下, 我们集成了参考库的浏览器(使用 `ExaBackend`)和演示 Python 解释器, 并通过 Docker 容器运行. 要使用搜索后端, 您需要访问 [exa.ai](http://exa.ai/) 并将 `EXA_API_KEY=` 设置为环境变量. 对于 Python, 您需要确保 Docker 可用, 或者设置 `PYTHON_EXECUTION_BACKEND=dangerously_use_uv` 以允许在同一台机器上执行模型生成的代码片段. 请注意,  `PYTHON_EXECUTION_BACKEND=dangerously_use_uv` 需要 `gpt-oss>=0.0.5`.

```bash
uv pip install gpt-oss

vllm serve ... --tool-server demo
```

- Please note that the default options are simply for demo purposes. For production usage, vLLM itself can act as MCP client to multiple services. Here is an [example tool server](https://github.com/openai/gpt-oss/tree/main/gpt-oss-mcp-server) that vLLM can work with, they wrap the demo tools:
  请注意, 默认选项仅用于演示目的. 在生产环境中, vLLM 本身可以作为 MCP 客户端连接到多个服务. 以下是一个 vLLM 可以配合使用的[示例工具服务器]() , 它们封装了演示工具:

```bash
mcp run -t sse browser_server.py:mcp
mcp run -t sse python_server.py:mcp

vllm serve ... --tool-server ip-1:port-1,ip-2:port-2
```

The URLs are expected to be MCP SSE servers that implement `instructions` in server info and well documented tools. The tools will be injected into the system prompt for the model to enable them.
这些 URL 应指向 MCP SSE 服务器, 这些服务器会执行服务器信息中的 `instructions` 并提供完善的文档工具. 这些工具将被注入到模型的系统提示符中以启用它们.

### Function calling

vLLM also supports calling user-defined functions. Make sure to run your gpt-oss models with the following arguments.
vLLM 还支持调用用户自定义函数. 请确保使用以下参数运行您的 gpt-oss 模型.

```bash
vllm serve ... --tool-call-parser openai --enable-auto-tool-choice
```

## Accuracy Evaluation Panels
准确性评估小组

OpenAI recommends using the gpt-oss reference library to perform evaluation.
OpenAI 建议使用 gpt-oss 参考库进行评估.

First, deploy the model with vLLM:
首先, 使用 vLLM 部署模型:

```bash
# Example deployment on 8xH100
vllm serve openai/gpt-oss-120b \
  --tensor_parallel_size 8 \
  --max-model-len 131072 \
  --max-num-batched-tokens 10240 \
  --max-num-seqs 128 \
  --gpu-memory-utilization 0.85 \
  --no-enable-prefix-caching
```

Then, run the evaluation with gpt-oss. The following command will run all the 3 reasoning effort levels.
然后, 使用 gpt-oss 运行评估. 以下命令将运行所有 3 个推理难度级别.

```bash
mkdir -p /tmp/gpqa_openai
OPENAI_API_KEY=empty python -m gpt_oss.evals --model openai/gpt-oss-120b --eval gpqa --n-threads 128
```

To eval on AIME2025, change `gpqa` to `aime25`.
要使用 AIME2025 进行评估, 请将 `gpqa` 更改为 `aime25`.

Here is the score we were able to reproduce without tool use, and we encourage you to try reproducing it as well! We’ve observed that the numbers may vary slightly across runs, so feel free to run the evaluation multiple times to get a sense of the variance. For a quick correctness check, we recommend starting with the low reasoning effort setting (`--reasoning-effort low`), which should complete within minutes.
以下是我们无需借助任何工具即可复现的分数, 我们也鼓励您尝试复现! 我们观察到, 不同运行结果可能会略有差异, 因此您可以多次运行评估以了解其波动情况. 为了快速检查正确性, 我们建议您从较低的推理难度设置( `--reasoning-effort low` )开始, 该设置应该只需几分钟即可完成.

Model: 120B

| Reasoning Effort | GPQA | AIME25 |
| ---------------- | ---- | ------ |
| Low              | 65.3 | 51.2   |
| Mid              | 72.4 | 79.6   |
| High             | 79.4 | 93.0   |

Model: 20B

| Reasoning Effort | GPQA | AIME25 |
| ---------------- | ---- | ------ |
| Low              | 56.8 | 38.8   |
| Mid              | 67.5 | 75.0   |
| High             | 70.9 | 85.8   |

## Recipe for NVIDIA Blackwell & Hopper Hardware
NVIDIA Blackwell 和 Hopper 硬件配方

This chapter includes more instructions about running gpt-oss-120b and gpt-oss-20b on NVIDIA Blackwell & Hopper hardware to get the additional performance optimizations compared to the Quickstart chapter above.
本章包含有关在 NVIDIA Blackwell 和 Hopper 硬件上运行 gpt-oss-120b 和 gpt-oss-20b 的更多说明, 以便获得与上述快速入门章节相比的额外性能优化.

### Pull Docker Image

Pull the vLLM release docker image.

`pull_image.sh`

```bash
# On x86_64 systems:
docker pull --platform linux/amd64 vllm/vllm-openai
# On aarch64 systems:
# docker pull --platform linux/aarch64 vllm/vllm-openai

docker tag vllm/vllm-openai vllm/vllm-openai:deploy
```

### Run Docker Container

Run the docker container using the docker image `vllm/vllm-openai:deploy`.
使用 docker 镜像 `vllm/vllm-openai:deploy` 运行 docker 容器.

`run_container.sh`

```bash
docker run \
-e HF_TOKEN="$HF_TOKEN" \
-e HF_HOME="$HF_HOME" \
--ipc=host \
--gpus all \
--entrypoint "/bin/bash" \
--rm -it \
vllm/vllm-openai:deploy
```

Note: You can mount additional directories and paths using the `-v <local_path>:<path>` flag if needed, such as mounting the downloaded weight paths.
注意: 如果需要, 您可以使用 `-v <local_path>:<path>` 标志挂载其他目录和路径, 例如挂载下载的权重路径.

The `-e HF_TOKEN="$HF_TOKEN" -e HF_HOME="$HF_HOME"` flags are added so that the models are downloaded using your HuggingFace token and the downloaded models can be cached in $HF_HOME. Refer to [HuggingFace documentation](https://huggingface.co/docs/huggingface_hub/en/package_reference/environment_variables#hfhome) for more information about these environment variables and refer to [HuggingFace Quickstart guide](https://huggingface.co/docs/huggingface_hub/en/quick-start#authentication) about steps to generate your HuggingFace access token.
添加 `-e HF_TOKEN="$HF_TOKEN" -e HF_HOME="$HF_HOME"` 参数, 以便使用您的 HuggingFace 令牌下载模型, 并将下载的模型缓存到 `$HF_HOME` 目录中. 有关这些环境变量的更多信息, 请参阅 [HuggingFace 文档](); 有关生成 HuggingFace 访问令牌的步骤, 请参阅 [HuggingFace 快速入门指南]().

### Prepare the Config File

Prepare the config YAML file to configure vLLM. Below shows the recommended config files for Blackwell and Hopper architectures, respectively. These config files have also been uploaded to the [vLLM recipe repository](https://github.com/vllm-project/recipes/tree/main/OpenAI). The explanation of each config is shown in the "Configs and Parameters" section.
准备用于配置 vLLM 的 YAML 配置文件. 以下分别列出了 Blackwell 和 Hopper 架构的推荐配置文件. 这些配置文件也已上传至 [vLLM 配方库](). 每个配置的说明请参见"配置和参数"部分.

`GPT-OSS_Blackwell.yaml`

```yaml
kv-cache-dtype: fp8
no-enable-prefix-caching: true
max-cudagraph-capture-size: 2048
max-num-batched-tokens: 8192
stream-interval: 20
```

`GPT-OSS_Hopper.yaml`

```yaml
no-enable-prefix-caching: true
max-cudagraph-capture-size: 2048
max-num-batched-tokens: 8192
stream-interval: 20
```

Below are the config YAML files to enable EAGLE3 speculative decoding:
以下是启用 EAGLE3 推测性解码的 YAML 配置文件:

`GPT-OSS_EAGLE3_Blackwell.yaml`

```yaml
kv-cache-dtype: fp8
no-enable-prefix-caching: true
max-cudagraph-capture-size: 2048
max-num-batched-tokens: 8192
stream-interval: 20
speculative-config: '{"model":"nvidia/gpt-oss-120b-Eagle3-v2","num_speculative_tokens":3,"method":"eagle3","draft_tensor_parallel_size":1}'
```

`GPT-OSS_EAGLE3_Hopper.yaml`

```yaml
no-enable-prefix-caching: true
max-cudagraph-capture-size: 2048
max-num-batched-tokens: 8192
stream-interval: 20
speculative-config: '{"model":"nvidia/gpt-oss-120b-Eagle3-v2","num_speculative_tokens":3,"method":"eagle3","draft_tensor_parallel_size":1}'
```

### Launch the vLLM Server

Below is an example command to launch the vLLM server with openai/gpt-oss-120b model. The instruction is the same for GPT-OSS-20b with the model name replaced with `openai/gpt-oss-20b`.
以下是使用 openai/gpt-oss-120b 模型启动 vLLM 服务器的示例命令. 对于 GPT-OSS-20b, 只需将模型名称替换为 `openai/gpt-oss-20b` 即可.

`launch_server.sh`

```bash
# Set up a few environment variables for better performance for Blackwell architecture.
# They will be removed when the performance optimizations have been verified and enabled by default.
COMPUTE_CAPABILITY=$(nvidia-smi -i 0 --query-gpu=compute_cap --format=csv,noheader)
if [ "$COMPUTE_CAPABILITY" = "10.0" ]; then
    # Use FlashInfer MXFP4+MXFP8 MoE
    export VLLM_USE_FLASHINFER_MOE_MXFP4_MXFP8=1
    # Select the config file for Blackwell architecture.
    YAML_CONFIG="GPT-OSS_Blackwell.yaml"
else
    # Select the config file for Hopper architecture.
    YAML_CONFIG="GPT-OSS_Hopper.yaml"
    # vLLM v0.12.0 has a performance regression on Hopper GPUs for small concurrency
    # (see: https://github.com/vllm-project/vllm/issues/28894 ). Enable this environment
    # variable to fix the regression. This has been fixed in https://github.com/vllm-project/vllm/pull/30528
    # and the env var will no longer be needed in the next vLLM version.
    # export VLLM_MXFP4_USE_MARLIN=1
fi

# Launch the vLLM server
vllm serve openai/gpt-oss-120b \
  --config ${YAML_CONFIG} \
  --tensor-parallel-size 1 &
```

After the server is set up, the client can now send prompt requests to the server and receive results.
服务器设置完成后, 客户端即可向服务器发送提示请求并接收结果.

### Configs and Parameters

You can specify the IP address and the port that you would like to run the server with using these flags/configs:
您可以使用以下标志/配置指定运行服务器的 IP 地址和端口:

- `host`: IP address of the server. By default, it uses 127.0.0.1.
  `host`: 服务器的 IP 地址. 默认值为 127.0.0.1.

- `port`: The port to listen to by the server. By default, it uses port 8000.
  `port`: 服务器监听的端口. 默认情况下, 使用端口 8000.

Below are the config flags that we do not recommend changing or tuning with:
以下是我们不建议更改或调整的配置标志:

- `no-enable-prefix-caching`: Disable prefix caching. We recommend always adding this flag if running with synthetic dataset for consistent performance measurement.
  `no-enable-prefix-caching`: 禁用前缀缓存. 如果使用合成数据集, 为了获得一致的性能测量结果, 我们建议始终添加此标志.

- `max-cudagraph-capture-size`: Specify the max size for cuda graphs. We recommend setting this to 2048 to leverage the benefit of cuda graphs while not using too much GPU memory.
  `max-cudagraph-capture-size`: 指定 CUDA 图的最大大小. 我们建议将其设置为 2048, 以便在充分利用 CUDA 图优势的同时, 避免占用过多 GPU 内存.

- `stream-interval`: The interval between output token streaming responses. We recommend setting this to `20` to maximize the throughput.
  `stream-interval`: 输出令牌流响应之间的间隔. 建议将其设置为 `20` 以最大化吞吐量.

Below are a few tunable parameters you can modify based on your serving requirements:
以下是一些您可以根据服务需求进行调整的可调参数:

- `tensor-parallel-size`: Tensor parallelism size. Increasing this will increase the number of GPUs that are used for inference.
  `tensor-parallel-size`: 张量并行大小. 增加此值将增加用于推理的 GPU 数量.

  Set this to `1` to achieve the best throughput per GPU, and set this to `2`, `4`, or `8` to achieve better per-user latencies.
  将此值设置为 `1` 可实现每个 GPU `4` `2` `8` 可实现更好的每个用户延迟.

- `max-num-batched-tokens`: Maximum number of tokens per batch.
  `max-num-batched-tokens`: 每批次的最大令牌数.

  We recommend setting this to `8192`. Increasing this value may have slight performance improvements if the sequences have long input sequence lengths.
  我们建议将此值设置为 `8192` 如果输入序列长度较长, 增加此值可能会略微提高性能.

- `max-num-seqs`: Maximum number of sequences per batch.
  `max-num-seqs`: 每个批次的最大序列数.

  By default, this is set to a large number like `1024` on GPUs with large memory sizes.
  默认情况下, 对于具有大内存容量的 GPU, 此值设置为较大的数字, 例如 `1024`.

  If the actual concurrency is smaller, setting this to a smaller number matching the max concurrency may improve the performance and improve the per-user latencies.
  如果实际并发数较小, 将其设置为与最大并发数相匹配的较小数值可能会提高性能并改善每个用户的延迟.

- `max-model-len`: Maximum number of total tokens, including the input tokens and output tokens, for each request.
  `max-model-len`: 每个请求的最大令牌总数, 包括输入令牌和输出令牌.

  By default, this is set to the maximum sequence length supported by the model.
  默认情况下, 此值设置为模型支持的最大序列长度.

  If the actual input+output sequence length is shorter than the default, setting this to a smaller number may improve the performance.
  如果实际输入+输出序列长度比默认值短, 则将其设置为较小的数字可能会提高性能.

  For example, if the maximum input sequence length is 1024 tokens and maximum output sequence length is 1024, then this can be set to 2048 for better performance.
  例如, 如果最大输入序列长度为 1024 个标记, 最大输出序列长度为 1024, 则可以将其设置为 2048 以获得更好的性能.

Refer to the "Balancing between Throughput and Latencies" about how to adjust these tunable parameters to meet your deployment requirements.
请参阅"吞吐量和延迟之间的平衡"了解如何调整这些可调参数以满足您的部署要求.

### Benchmarking Performance

To benchmark the performance, you can use the `vllm bench serve` command.
要对性能进行基准测试, 可以使用 `vllm bench serve` 命令.

`run_performance.sh`

```bash
vllm bench serve \
  --host 0.0.0.0 \
  --port 8000 \
  --model openai/gpt-oss-120b \
  --trust-remote-code \
  --dataset-name random \
  --random-input-len 1024 \
  --random-output-len 1024 \
  --ignore-eos \
  --max-concurrency 1024 \
  --num-prompts 5120 \
  --save-result --result-filename vllm_benchmark_serving_results.json
```

Explanations for the flags:

- `--dataset-name`: Which dataset to use for benchmarking. We use a `random` dataset here.
  `--dataset-name`: 用于基准测试的数据集. 这里我们使用 `random` 数据集.

- `--random-input-len`: Specifies the average input sequence length.
  `--random-input-len`: 指定平均输入序列长度.

- `--random-output-len`: Specifies the average output sequence length.
  `--random-output-len`: 指定平均输出序列长度.

- `--ignore-eos`: Disables early returning when eos (end-of-sentence) token is generated. This ensures that the output sequence lengths match our expected range.
  `--ignore-eos`: 禁用在生成 eos(句子结束符)标记时提前返回. 这可以确保输出序列长度符合预期范围.

- `--max-concurrency`: Maximum number of in-flight requests. We recommend matching this with the `--max-num-seqs` flag used to launch the server.
  `--max-concurrency`: 同时处理的最大请求数. 建议将其与启动服务器时使用的 `--max-num-seqs` 标志保持一致.

- `--num-prompts`: Total number of prompts used for performance benchmarking. We recommend setting it to at least five times of the `--max-concurrency` to measure the steady state performance.
  `--num-prompts`: 用于性能基准测试的提示符总数. 我们建议将其设置为至少为 `--max-concurrency` 的五倍, 以便测量稳定状态下的性能.

- `--save-result --result-filename`: Output location for the performance benchmarking result.
  `--save-result --result-filename`: 性能基准测试结果的输出位置.

### Interpreting Performance Benchmarking Output
解读绩效基准输出

Sample output by the `vllm bench serve` command:
`vllm bench serve` 命令的示例输出:

```
============ Serving Benchmark Result ============
Successful requests:                     xxxxxx
Benchmark duration (s):                  xxx.xx
Total input tokens:                      xxxxxx
Total generated tokens:                  xxxxxx
Request throughput (req/s):              xxx.xx
Output token throughput (tok/s):         xxx.xx
Total Token throughput (tok/s):          xxx.xx
---------------Time to First Token----------------
Mean TTFT (ms):                          xxx.xx
Median TTFT (ms):                        xxx.xx
P99 TTFT (ms):                           xxx.xx
-----Time per Output Token (excl. 1st token)------
Mean TPOT (ms):                          xxx.xx
Median TPOT (ms):                        xxx.xx
P99 TPOT (ms):                           xxx.xx
---------------Inter-token Latency----------------
Mean ITL (ms):                           xxx.xx
Median ITL (ms):                         xxx.xx
P99 ITL (ms):                            xxx.xx
----------------End-to-end Latency----------------
Mean E2EL (ms):                          xxx.xx
Median E2EL (ms):                        xxx.xx
P99 E2EL (ms):                           xxx.xx
==================================================
```

Explanations for key metrics:

- `Median Time to First Token (TTFT)`: The typical time elapsed from when a request is sent until the first output token is generated.
  `Median Time to First Token (TTFT)`: 从发送请求到生成第一个输出令牌所经过的典型时间.

- `Median Time Per Output Token (TPOT)`: The typical time required to generate each token after the first one.
  `Median Time Per Output Token (TPOT)`: 生成第一个令牌之后, 生成每个令牌所需的典型时间.

- `Median Inter-Token Latency (ITL)`: The typical time delay between a response for the completion of one output token (or output tokens) and the next response for the completion of token(s).
  `Median Inter-Token Latency (ITL)`: 完成一个输出令牌(或多个输出令牌)的响应与完成下一个令牌的响应之间的典型时间延迟.

- If the `--stream-interval 20` flag is added in the server command, the ITL will be the completion time for every 20 output tokens.
  如果在服务器命令中添加 `--stream-interval 20` 标志, 则 ITL 将是每 20 个输出标记的完成时间.

- `Median End-to-End Latency (E2EL)`: The typical total time from when a request is submitted until the final token of the response is received.
  `Median End-to-End Latency (E2EL)`: 从提交请求到收到响应的最终令牌的典型总时间.

- `Output token throughput`: The rate at which the system generates the output (generated) tokens.
  `Output token throughput`: 系统生成输出(已生成)令牌的速率.

- `Total Token Throughput`: The combined rate at which the system processes both input (prompt) tokens and output (generated) tokens.
  `Total Token Throughput`: 系统处理输入(提示)令牌和输出(生成)令牌的综合速率.

### Balancing between Throughput and Latencies
平衡吞吐量和延迟

In LLM inference, the "throughput" can be defined as the number of generated tokens per second (the `Output token throughput` metric above) or the number of processed tokens per second (the `Total Token Throughput` metric above). These two throughput metrics are highly correlated. We usually divide the throughput by the number of GPUs used to get the "per-GPU throughput" when comparing across different parallelism configurations. The higher per-GPU throughput is, the fewer GPUs are needed to serve the same amount of the incoming requests.
在 LLM 推理中, "吞吐量"可以定义为每秒生成的 token 数量(即上文中的 `Output token throughput` 指标)或每秒处理的 token 数量(即上文中的 `Total Token Throughput` 指标). 这两个吞吐量指标高度相关. 在比较不同并行配置时, 我们通常将吞吐量除以使用的 GPU 数量, 得到"单 GPU 吞吐量". 单 GPU 吞吐量越高, 处理相同数量的传入请求所需的 GPU 就越少.

On the other hand, the "latency" can be defined as the latency from when a request is sent until the first output token is generated (the `TTFT` metric), the latency between two generated tokens after the first one has been generated (the `TPOT` metric), or the end-to-end latency from when a request is sent to when the final token is generated (the `E2EL` metric). The TTFT affects the E2EL more when the input (prompt) sequence lengths are much longer than the output (generated) sequence lengths, while the TPOT affects the E2EL more in the opposite cases.
另一方面, "延迟"可以定义为从发送请求到生成第一个输出令牌的延迟( `TTFT` 指标)、第一个令牌生成后两个生成令牌之间的延迟(TPOT 指标), 或者从发送请求到生成最后一个令牌的端到端延迟( `TPOT` 指标). 当输入(提示)序列长度远大于输出( `E2EL` )序列长度时, TTFT 对 E2EL 的影响更大; 而当输入(提示)序列长度远大于输出(生成)序列长度时, TPOT 对 E2EL 的影响更大.

To achieve higher throughput, tokens from multiple requests must be batched and processed together, but that increases the latencies. Therefore, a balance must be made between throughput and latencies depending on the deployment requirements.
为了提高吞吐量, 必须将来自多个请求的令牌批量处理, 但这会增加延迟. 因此, 必须根据部署需求在吞吐量和延迟之间取得平衡.

The two main tunable configs for GPT-OSS are the `--tensor-parallel-size` (TP) and `--max-num-seqs` (BS). How they affect the throughput and latencies can be summarized as the following:
GPT-OSS 的两个主要可调配置项是 ` `--tensor-parallel-size` (TP) 和 `--max-num-seqs` (BS). 它们对吞吐量和延迟的影响可以概括如下:

- At the same BS, higher TP typically results in lower latencies but also lower throughput.
  在相同的基站下, 较高的吞吐量通常会导致较低的延迟, 但也会导致较低的吞吐量.

- At the same TP size, higher BS typically results in higher throughput but worse latencies, but the maximum BS is limited by the amount of available GPU memory for the kv-cache after the weights are loaded.
  在相同的 TP 大小下, 更高的 BS 通常会导致更高的吞吐量, 但延迟会更严重, 但最大 BS 受限于加载权重后 kv 缓存可用的 GPU 内存量.

- Therefore, increasing TP (which would lower the throughput at the same BS) may allow higher BS to run (which would increase the throughput), and the net throughput gain/loss depends on models and configurations.
  因此, 增加 TP(这将降低同一基站的吞吐量)可能允许运行更高的基站(这将增加吞吐量), 而净吞吐量的增加/减少取决于型号和配置.

Note that the statements above assume that the concurrency setting on the client side, like the `--max-concurrency` flag in the performance benchmarking command, matches the `--max-num-seqs` (BS) setting on the server side.
请注意, 以上声明假设客户端的并发设置(如性能基准测试命令中的 `--max-concurrency` 标志)与服务器端的 `--max-num-seqs` (BS) 设置相匹配.

Below are the recommended configs for different throughput-latency scenarios on B200 GPUs:
以下是针对 B200 GPU 不同吞吐量-延迟场景的推荐配置:

- Max Throughput: Set TP to 1, and increase BS to the maximum possible value without exceeding KV cache capacity.
  最大吞吐量: 将 TP 设置为 1, 并将 BS 增加到最大可能值, 但不要超过 KV 缓存容量.

- Min Latency: Set TP to 4 or 8, and set BS to a small value (like `8`) that meets the latency requirements.
  最小延迟: 将 TP 设置为 4 或 8, 并将 BS 设置为满足延迟要求的较小值(例如 `8` ).

- Balanced: Set TP to 2 and set BS to 128.
  平衡: 将 TP 设置为 2, 将 BS 设置为 128.

Finally, another minor tunable config is the `--max-num-batched-tokens` flag which controls how many tokens can be batched together within a forward iteration. We recommend setting this to `8192` which works well for most cases. Increasing it to `16384` may result in slightly higher throughput and lower TTFT latencies, with a more uneven distribution of the TPOT latencies since some output tokens may be generated with more prefill-stage tokens in the same batches.
最后, 还有一个较小的可调配置项是 `--max-num-batched-tokens` 标志, 它控制在一次前向迭代中可以同时处理多少个标记. 我们建议将其设置为 `8192` , 这在大多数情况下都能很好地工作. 将其增加到 `16384` 可能会略微提高吞吐量并降低 TTFT 延迟, 但会导致 TPOT 延迟分布更加不均匀, 因为某些输出标记可能在同一批次中使用了更多的预填充阶段标记.

## Known Limitations

- On H100 using tensor parallel size 1, default gpu memory utilization, and batched token will cause CUDA Out-of-memory. When running tp1, please increase your gpu memory utilization or lower batched token
  在 H100 上使用张量并行大小 1、默认 GPU 内存利用率和批量令牌会导致 CUDA 内存溢出. 运行 tp1 时, 请提高 GPU 内存利用率或降低批量令牌大小.

```bash
vllm serve openai/gpt-oss-120b --gpu-memory-utilization 0.95 --max-num-batched-tokens 1024
```

- When running TP2 on H100, set your gpu memory utilization below 0.95 as that will also cause OOM
  在 H100 上运行 TP2 时, 请将 GPU 内存使用率设置为低于 0.95, 否则也会导致内存溢出 (OOM).

- Responses API has several limitations at the current moment; we strongly welcome contribution and maintenance of this service in vLLM
  目前响​​应 API 存在一些限制; 我们非常欢迎大家为 vLLM 贡献力量并维护这项服务.

- Usage accounting is currently broken and only returns all zeros.
  目前使用量统计功能存在故障, 只会返回全零值.

- Annotations (citing URLs from search results) are not supported.
  不支持注释(引用搜索结果中的 URL).

- Truncation by `max_tokens` might not be able to preserve partial chunks.
  使用 `max_tokens` 进行截断可能无法保留部分数据块.

- Streaming is fairly barebone at the moment, for example:
  例如, 目前的流媒体服务还相当简陋:

- Item id and indexing needs more work
  物品 ID 和索引还需要进一步完善.

- Tool invocation and output are not properly streamed, rather batched.
  工具调用和输出没有正确流式传输, 而是批量处理.

- Proper error handling is missing.
  缺少适当的错误处理机制.

## Troubleshooting

- Attention sink dtype error on Blackwell:
  Blackwell 上的注意力接收器 dtype 错误:

```bash
  ERROR 08-05 07:31:10 [multiproc_executor.py:559]     assert sinks.dtype == torch.float32, "Sinks must be of type float32"
  **(VllmWorker TP0 pid=174579)** ERROR 08-05 07:31:10 [multiproc_executor.py:559]            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  **(VllmWorker TP0 pid=174579)** ERROR 08-05 07:31:10 [multiproc_executor.py:559] AssertionError: Sinks must be of type float32
```

Solution: Please refer to Blackwell section to check if related environment variables are added.
解决方法: 请参考 Blackwell 部分, 检查是否添加了相关的环境变量.

- Triton issue related to `tl.language` not defined:
  Triton 问题与 `tl.language` 未定义有关:

Solution: Make sure there's no other triton installed in your environment (pytorch-triton, etc).
解决方法: 确保您的环境中没有安装其他 triton(pytorch-triton 等).

- Run into `openai_harmony.HarmonyError: error downloading or loading vocab file: failed to download or load vocab` error
  运行 `openai_harmony.HarmonyError: error downloading or loading vocab file: failed to download or load vocab`

Solution: This is caused by a bug in openai_harmony code. This can be worked around by downloading the tiktoken encoding files in advance and setting the TIKTOKEN_ENCODINGS_BASE environment variable. See [this GitHub issue](https://github.com/openai/harmony/pull/41) for more information.
解决方案: 这是 openai_harmony 代码中的一个 bug 导致的. 可以通过提前下载 tiktoken 编码文件并设置 TIKTOKEN_ENCODINGS_BASE 环境变量来解决此问题. 更多信息请参阅[此 GitHub issue]().

```bash
mkdir -p tiktoken_encodings
wget -O tiktoken_encodings/o200k_base.tiktoken "https://openaipublic.blob.core.windows.net/encodings/o200k_base.tiktoken"
wget -O tiktoken_encodings/cl100k_base.tiktoken "https://openaipublic.blob.core.windows.net/encodings/cl100k_base.tiktoken"
export TIKTOKEN_ENCODINGS_BASE=${PWD}/tiktoken_encodings
```

## Harmony Format Support

Below is the support matrix for Harmony format.
以下是 Harmony 格式的支持矩阵.

Meaning:

- ✅ = Full compatibility
  ✅ = 完全兼容

- ❌ = No compatibility
  ❌ = 不兼容

| API Type | Basic Text Generation | Structured Output | Builtin Tools with demo Tool Server | Builtin Tools with MCP | Function Calling |
| --- | --- | --- | --- | --- | --- |
| Response API | ✅ | ✅ | ✅ | ✅ | ✅ |
| Response API with Background Mode | ✅ | ✅ | ✅ | ✅ | ✅ |
| Response API with Streaming | ✅ | ✅ | ✅ | ✅ | ❌ |
| Chat Completion API | ✅ | ✅ | ❌ | ❌ | ✅ |
| Chat Completion API with Streaming | ✅ | ✅ | ❌ | ❌ | ✅ |

If you want to use offline inference, you can treat vLLM as a token-in-token-out service and pass in tokens that are already formatted with Harmony.
如果要使用离线推理, 可以将 vLLM 视为 token-in-token-out 服务, 并传入已经用 Harmony 格式化的 token.

For function calling, only tool_choice="auto" is supported.
对于函数调用, 仅支持 tool_choice="auto".
