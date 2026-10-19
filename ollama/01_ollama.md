# ollama

* https://docs.ollama.com/linux#manual-install
* https://github.com/ollama/ollama/releases

```bash
$ mkdir ollama
$ tar x -C ./ollama/ -f ollama-linux-amd64.tar.zst

$ ./ollama serve --help
Start Ollama

Usage:
  ollama serve [flags]

Aliases:
  serve, start

Flags:
  -h, --help   help for serve

Environment Variables:
      OLLAMA_DEBUG                  Show additional debug information (e.g. OLLAMA_DEBUG=1)
      OLLAMA_HOST                   IP Address for the ollama server (default 127.0.0.1:11434)
      OLLAMA_CONTEXT_LENGTH         Context length to use unless otherwise specified (default: 4k/32k/256k based on VRAM)
      OLLAMA_KEEP_ALIVE             The duration that models stay loaded in memory (default "5m")
      OLLAMA_MAX_LOADED_MODELS      Maximum number of loaded models per GPU
      OLLAMA_MAX_TRANSFER_STREAMS   Maximum parallel transfer streams for safetensors model pulls/pushes (default 4)
      OLLAMA_MAX_QUEUE              Maximum number of queued requests
      OLLAMA_MODELS                 The path to the models directory
      OLLAMA_NUM_PARALLEL           Maximum number of parallel requests
      OLLAMA_NO_CLOUD               Disable Ollama cloud features (remote inference and web search)
      OLLAMA_NOPRUNE                Do not prune model blobs on startup
      OLLAMA_ORIGINS                A comma separated list of allowed origins
      OLLAMA_SCHED_SPREAD           Always schedule model across all GPUs
      OLLAMA_FLASH_ATTENTION        Enabled flash attention
      OLLAMA_KV_CACHE_TYPE          Quantization type for the K/V cache (default: f16)
      OLLAMA_LLM_LIBRARY            Set LLM library to bypass autodetection
      OLLAMA_GPU_OVERHEAD           Reserve a portion of VRAM per GPU (bytes)
      OLLAMA_IGPU_ENABLE            Enable integrated GPUs
      LLAMA_ARG_FIT                 Enable llama.cpp automatic fit of unset memory options (default "on")
      LLAMA_ARG_FIT_TARGET          Target free VRAM margin per device for llama.cpp fit (MiB)
      OLLAMA_LOAD_TIMEOUT           How long to allow model loads to stall before giving up (default "5m")
$

CUDA_VISIBLE_DEVICES="0,2" \
LLAMA_ARG_FIT=on \
LLAMA_ARG_FIT_TARGET=256 \
OLLAMA_GPU_OVERHEAD=1073741824 \
OLLAMA_CONTEXT_LENGTH=262144 \
OLLAMA_DEBUG=1 \
OLLAMA_DEBUG_LOG_REQUESTS=1 \
OLLAMA_FLASH_ATTENTION=1 \
OLLAMA_HOST=http://0.0.0.0:11434 \
OLLAMA_MAX_LOADED_MODELS=1 \
OLLAMA_NUM_PARALLEL=4 \
OLLAMA_NO_CLOUD=1 \
OLLAMA_SCHED_SPREAD=1 \
./ollama serve

$ CUDA_VISIBLE_DEVICES="0,2" OLLAMA_DEBUG=1 OLLAMA_HOST=http://0.0.0.0:11434 ./ollama serve
time=2026-10-19T09:52:47.395+08:00 level=INFO source=routes.go:2373 msg="server config" env="map[CUDA_VISIBLE_DEVICES:0,2 GGML_VK_VISIBLE_DEVICES: GPU_DEVICE_ORDINAL: HIP_VISIBLE_DEVICES: HSA_OVERRIDE_GFX_VERSION: HTTPS_PROXY: HTTP_PROXY: LLAMA_ARG_FIT: LLAMA_ARG_FIT_TARGET: NO_PROXY: OLLAMA_CONTEXT_LENGTH:0 OLLAMA_CREATE_REMOTE:false OLLAMA_DEBUG:DEBUG OLLAMA_DEBUG_LOG_REQUESTS:false OLLAMA_EDITOR: OLLAMA_FLASH_ATTENTION:false OLLAMA_GO_TEMPLATE:true OLLAMA_GPU_OVERHEAD:0 OLLAMA_HOST:http://0.0.0.0:11434 OLLAMA_IGPU_ENABLE: OLLAMA_KEEP_ALIVE:5m0s OLLAMA_KV_CACHE_TYPE: OLLAMA_LLM_LIBRARY: OLLAMA_LOAD_TIMEOUT:5m0s OLLAMA_MAX_LOADED_MODELS:0 OLLAMA_MAX_QUEUE:512 OLLAMA_MAX_TRANSFER_STREAMS:4 OLLAMA_MODELS:/root/.ollama/models OLLAMA_NOHISTORY:false OLLAMA_NOPRUNE:false OLLAMA_NO_CLOUD:false OLLAMA_NUM_PARALLEL:1 OLLAMA_ORIGINS:[http://localhost https://localhost http://localhost:* https://localhost:* http://127.0.0.1 https://127.0.0.1 http://127.0.0.1:* https://127.0.0.1:* http://0.0.0.0 https://0.0.0.0 http://0.0.0.0:* https://0.0.0.0:* app://* file://* tauri://* vscode-webview://* vscode-file://*] OLLAMA_REMOTES:[ollama.com] OLLAMA_SCHED_SPREAD:false OLLAMA_VULKAN:true ROCR_VISIBLE_DEVICES: http_proxy: https_proxy: no_proxy:]"

map[
    CUDA_VISIBLE_DEVICES:0,2
    GGML_VK_VISIBLE_DEVICES:
    GPU_DEVICE_ORDINAL:
    HIP_VISIBLE_DEVICES:
    HSA_OVERRIDE_GFX_VERSION:
    HTTPS_PROXY:
    HTTP_PROXY:
    LLAMA_ARG_FIT:
    LLAMA_ARG_FIT_TARGET:
    NO_PROXY:
    OLLAMA_CONTEXT_LENGTH:0
    OLLAMA_CREATE_REMOTE:false
    OLLAMA_DEBUG:DEBUG
    OLLAMA_DEBUG_LOG_REQUESTS:false
    OLLAMA_EDITOR:
    OLLAMA_FLASH_ATTENTION:false
    OLLAMA_GO_TEMPLATE:true
    OLLAMA_GPU_OVERHEAD:0
    OLLAMA_HOST:http://0.0.0.0:11434
    OLLAMA_IGPU_ENABLE:
    OLLAMA_KEEP_ALIVE:5m0s
    OLLAMA_KV_CACHE_TYPE:
    OLLAMA_LLM_LIBRARY:
    OLLAMA_LOAD_TIMEOUT:5m0s
    OLLAMA_MAX_LOADED_MODELS:0
    OLLAMA_MAX_QUEUE:512
    OLLAMA_MAX_TRANSFER_STREAMS:4
    OLLAMA_MODELS:/root/.ollama/models
    OLLAMA_NOHISTORY:false
    OLLAMA_NOPRUNE:false
    OLLAMA_NO_CLOUD:false
    OLLAMA_NUM_PARALLEL:1
    OLLAMA_ORIGINS:[
        http://localhost
        https://localhost
        http://localhost:*
        https://localhost:*
        http://127.0.0.1
        https://127.0.0.1
        http://127.0.0.1:*
        https://127.0.0.1:*
        http://0.0.0.0
        https://0.0.0.0
        http://0.0.0.0:*
        https://0.0.0.0:*
        app://*
        file://*
        tauri://*
        vscode-webview://*
        vscode-file://*
    ]
    OLLAMA_REMOTES:[ollama.com]
    OLLAMA_SCHED_SPREAD:false
    OLLAMA_VULKAN:true
    ROCR_VISIBLE_DEVICES:
    http_proxy:
    https_proxy:
    no_proxy:
]

```

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
CUDA_VISIBLE_DEVICES:0,2
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在深度学习和大模型(LLM)推理系统中, `CUDA_VISIBLE_DEVICES` 是一个至关重要的底层环境变量. Ollama 本质上是基于 `llama.cpp` 构建的轻量级推理引擎, 在其使用 NVIDIA GPU 进行模型加速(模型分片和算子下发)时, 严格遵循 CUDA 运行时的设备可见性规则.

下面为你详细解析这一环境变量的含义、核心应用场景以及在 Ollama 中的具体实操方法.

---

### 一、`CUDA_VISIBLE_DEVICES:0,2` 的含义

该环境变量是由 NVIDIA CUDA 运行时(CUDA Runtime)定义的, 它的核心作用是: 控制当前进程及其子进程能够看到哪些物理 GPU, 并对这些 GPU 进行逻辑编号重映射.

具体到 `CUDA_VISIBLE_DEVICES:0,2`:

1. 设备隔离与选择:
   * 宿主机系统上至少存在 3 块或更多的 GPU(通过 `nvidia-smi` 看到的物理编号至少有 0、1、2...).
   * 该配置指定当前 Ollama 进程仅能访问物理编号为 `0` 和 `2` 的 GPU.
   * 物理卡 1(以及 3、4 等其他卡)对 Ollama 是完全不可见的, Ollama 甚至感知不到它们的存在.
2. 逻辑设备重映射(Re-indexing):
   * 在 Ollama 及其底层的 `llama.cpp` 视角中, 被暴露的 GPU 会从 `0` 开始重新编号:
     * 宿主机物理 GPU `0` $\rightarrow$ Ollama 内部的逻辑 GPU `cuda:0`
     * 宿主机物理 GPU `2` $\rightarrow$ Ollama 内部的逻辑 GPU `cuda:1`
3. 在 Ollama 中的实际表现:
   * Ollama 会将模型的参数权重(Layers)拆分并加载到物理卡 0 和物理卡 2 的显存中, 实现双卡显存并行(Model Parallelism / Layer Offloading).

---

### 二、典型使用场景

在实际生产或科研环境中, 显卡资源往往需要细粒度分配, 该变量常见于以下场景:

1. 多任务/多用户资源隔离:
   * 宿主机拥有 4 张卡(0, 1, 2, 3). 物理卡 1 正在进行 LoRA 微调或运行其他服务, 为了防止 Ollama 把显存占满导致 OOM(Out Of Memory), 限制 Ollama 仅使用物理卡 0 和 2.
2. 规避性能瓶颈或异构显卡冲突:
   * 机器上安装了不同规格的显卡(例如: 卡 0 和 2 是 RTX 4090, 卡 1 是用于显示输出的 GT 710, 或者卡 1 的 PCIe 带宽受限). 此时指定 `0,2` 可以防止大模型分配到慢速显卡上拖慢整体推理吞吐.
3. 拓扑亲和性优化(PCIe / NVLink Topology):
   * 在双路 CPU 或多插槽服务器上, 卡 0 和卡 2 可能连接在同一个 NUMA 节点或同一条 PCIe 交换机(Switch)上, 它们之间的数据通信延迟更低. 通过 `nvidia-smi topo -m` 查看拓扑后, 针对性选择通信开销最小的卡组.
4. 单机多 Ollama 实例水平扩展:
   * 实例 A 设置 `CUDA_VISIBLE_DEVICES=0,1` 运行 `qwen2.5:72b`;
   * 实例 B 设置 `CUDA_VISIBLE_DEVICES=2,3` 运行 `deepseek-coder:33b`;
   * 实现两个模型互不干扰的高并发独立服务.

---

### 三、具体示例与配置方法

根据你的运行方式(临时调试、系统服务守护进程、Docker 容器), 配置方法各有不同:

#### 示例 1: 临时终端启动(开发与调试)

在终端中直接通过环境变量前缀启动 Ollama 服务:

```bash
# Linux / macOS
# 仅让 Ollama 使用物理 GPU 0 和 GPU 2
CUDA_VISIBLE_DEVICES=0,2 ollama serve

# 验证运行(在另一个终端):
ollama run qwen2.5:32b
```

如果你使用的是 Windows PowerShell:

```powershell
$env:CUDA_VISIBLE_DEVICES="0,2"
ollama serve
```

#### 示例 2: Linux Systemd 服务管理(生产标准部署)

在 Linux 上, 如果 Ollama 是作为后台系统服务运行的(官方一键脚本的默认方式), 需要修改其 systemd 服务单元文件:

1. 编辑 Ollama 服务配置:

```bash
sudo systemctl edit ollama.service
```

2. 在打开的文件中添加如下内容并保存:

```ini
[Service]
Environment="CUDA_VISIBLE_DEVICES=0,2"
```

3. 重新加载并重启服务:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

4. 验证日志:

```bash
journalctl -u ollama --no-pager -n 30
# 即可在日志中看到你提到的: CUDA_VISIBLE_DEVICES:0,2
```

#### 示例 3: Docker 容器化部署

如果使用 Docker 运行 Ollama, 推荐直接使用 `--gpus` 参数传递设备选择, Docker 会自动在容器内部注入该环境变量:

```bash
# 使用 device 指定物理卡 0 和 2
docker run -d \
  --gpus '"device=0,2"' \
  -v ollama:/root/.ollama \
  -p 11434:11434 \
  --name ollama-gpu \
  ollama/ollama
```

或者使用 `docker-compose.yml` 声明:

```yaml
version: '3.8'
services:
  ollama:
    image: ollama/ollama
    container_name: ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              device_ids: ['0', '2'] # 指定物理卡 0 和 2
              capabilities: [gpu]

volumes:
  ollama_data:
```

---

### 四、高级研究员视角的避坑指南

1. UUID 与索引漂移问题:
   * 在多卡服务器中, 重启后系统的物理设备索引(0, 1, 2...)偶尔可能发生顺序调换.
   * 更稳妥的做法是使用 GPU 的 UUID 进行锁定:

```bash
# 1. 查询显卡 UUID
nvidia-smi -L
# 输出例如:
# GPU 0: NVIDIA A100-PCIE-40GB (UUID: GPU-xxxx-xxxx-xxxx-xxxx)
# GPU 2: NVIDIA A100-PCIE-40GB (UUID: GPU-yyyy-yyyy-yyyy-yyyy)

# 2. 直接使用 UUID 指定设备
export CUDA_VISIBLE_DEVICES=GPU-xxxx-xxxx-xxxx-xxxx,GPU-yyyy-yyyy-yyyy-yyyy
ollama serve
```

2. 监控显存分配:
   * 启动模型后, 运行 `nvidia-smi` 观察物理卡 0 和卡 2 的显存使用情况. 你应当能看到显存被两张卡共同分担, 而物理卡 1 显存占用保持为 0, 这表明配置已完全生效.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
GGML_VK_VISIBLE_DEVICES:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在基于 Ollama 与底层推理引擎(llama.cpp / GGML)的技术架构中, `GGML_VK_VISIBLE_DEVICES` 是一个专门针对 Vulkan 计算后端的硬件隔离与设备路由环境变量.

---

### 一、核心含义解析

1. 命名拆解:
   * `GGML`: Ollama 底层依赖的核心张量库/推理引擎(来自 Georgi Gerganov 开发的 llama.cpp).
   * `VK`: 表示 Vulkan API 后端(区别于 CUDA、ROCm 或 Metal).
   * `VISIBLE_DEVICES`: 可见设备列表.
2. 本质作用:
   * 它的行为模式与 NVIDIA 的 `CUDA_VISIBLE_DEVICES` 或 AMD 的 `ROCR_VISIBLE_DEVICES` 完全一致.
   * 它用于告诉底层 GGML 引擎: "只允许识别并使用指定的这几个 Vulkan 物理设备, 其他所有 GPU 设备强制对其隐藏".
3. 日志中为什么会出现:
   * Ollama 在启动其 runner 进程(llama-server 封装)时, 会在诊断日志中打印出当前所有关联的硬件调度环境变量(如果未显式配置, 日志中通常显示为空值 `GGML_VK_VISIBLE_DEVICES:`, 代表默认让 Vulkan 探测所有可用设备).

---

### 二、核心使用场景

通常情况下, NVIDIA 显卡走 CUDA, macOS 走 Metal. 但在以下场景中, Ollama 会启用或降级至 Vulkan 后端, 此时该变量至关重要:

1. 核显(iGPU)与独显(dGPU)冲突:
   * 很多笔记本或台式机带有 AMD/Intel 核显(共享系统内存), 同时配有高性能独显.
   * Vulkan 默认枚举时, 可能会将 `0` 号位分配给核显(VRAM 极小, 如 512MB), 导致 Ollama 把模型加载进核显, 引发显存溢出(OOM)或极度卡顿. 通过该变量可强制指定使用独显.
2. 多卡环境下的算力隔离:
   * 服务器或工作站安装了多张支持 Vulkan 的 GPU(例如 2 张 AMD Radeon 显卡), 若只想把其中一张分给 Ollama 做推理服务, 另一张留给图形渲染或其它任务, 可通过该变量进行单卡隔离.
3. 过滤纯软件虚拟驱动(llvmpipe):
   * 在部分 Linux 系统中, 系统会安装 Mesa 提供的 CPU 软件光栅化设备(`llvmpipe`), Vulkan 会将其识别为一个计算设备. 若 Ollama 误把计算调度到软件模拟设备上, 性能会急剧恶化.
4. 混合异构 GPU 协同:
   * 机器上插有跨品牌显卡(如一张 Intel Arc + 一张 AMD Radeon), 利用 Vulkan 跨平台特性做 Multi-GPU 推理时, 控制加载设备的顺序和参与者.

---

### 三、具体配置与使用示例

#### 步骤 1: 排查当前系统的 Vulkan 设备编号

在配置之前, 需要先知道每张显卡对应的 Vulkan 索引号(0, 1, 2...).

* Linux 下查询:

```bash
vulkaninfo --summary
# 或者过滤设备名
vulkaninfo | grep deviceName
```

  假设输出如下:

```bash
Device 0: "AMD Radeon Graphics" (集成显卡)
Device 1: "AMD Radeon RX 7900 XTX" (独立显卡)
```

  此时独立显卡的索引号为 `1`.

---

#### 步骤 2: 在不同环境下配置该变量

##### 示例 1: Linux 临时命令行调试启动

如果你是通过终端手动启动 Ollama 服务, 直接在命令前注入环境变量:

```bash
# 只允许使用 1 号设备(独立显卡)
export GGML_VK_VISIBLE_DEVICES=1

# 启动服务
ollama serve
```

##### 示例 2: Linux 系统服务(systemd 守护进程部署)

生产环境中, Ollama 通常由 systemd 管理, 修改其服务单元文件最为规范:

1. 打开服务覆盖配置:

```bash
sudo systemctl edit ollama.service
```

2. 在打开的编辑器中添加如下内容:

```ini
[Service]
Environment="GGML_VK_VISIBLE_DEVICES=1"
```

3. 保存后重新加载并重启服务:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

##### 示例 3: Windows 本地部署环境

在 Windows 下(如 AMD 显卡使用 Vulkan 加速):

* PowerShell 启动:

```powershell
$env:GGML_VK_VISIBLE_DEVICES="1"
ollama serve
```

* 系统永久配置:
  在"系统属性 -> 环境变量 -> 用户变量/系统变量"中, 新建:
  * 变量名: `GGML_VK_VISIBLE_DEVICES`
  * 变量值: `1`
  重启 Ollama 客户端后生效.

##### 示例 4: 多卡并行与设备排序控制

如果系统里有两张卡(0 号卡和 1 号卡), 你可以灵活调整:

* 仅允许两张卡协同(排除其他设备):

```bash
export GGML_VK_VISIBLE_DEVICES=0,1
```

* 调换主从优先级(优先将 1 号卡作为主计算设备):

```bash
export GGML_VK_VISIBLE_DEVICES=1,0
```

##### 示例 5: Docker 容器部署

若使用容器化部署带有 Vulkan ICD 的镜像:

```bash
docker run -d \
  --device /dev/dri \
  -e GGML_VK_VISIBLE_DEVICES=1 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 四、避坑与注意事项

1. 设备编号(ID)与 PCI-E / CUDA ID 不一定一致:
   * Vulkan 枚举设备的顺序由安装的 Vulkan ICD 驱动加载顺序决定, `GGML_VK_VISIBLE_DEVICES` 中的 `0` 号卡并不一定等于 `CUDA_VISIBLE_DEVICES` 中的 `0` 号卡, 请始终以 `vulkaninfo` 查出来的顺序为准.
2. 只对 Vulkan Backend 起效:
   * 如果 Ollama 编译/运行时检测到 NVIDIA 闭源驱动完好并自动走上了 CUDA 引擎, 或者 AMD 显卡成功走了 ROCm 引擎, 该 Vulkan 变量将被底层忽略, 此时起作用的依然是 `CUDA_VISIBLE_DEVICES` 或 `ROCR_VISIBLE_DEVICES`.
3. 当值为空或未设置时:
   * 引擎默认会把所有探测到的 Vulkan 设备均视为可用, 并在日志中输出一条空的占位标记(即你看到的 `GGML_VK_VISIBLE_DEVICES:`).

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
GPU_DEVICE_ORDINAL:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在深入探讨 Ollama 的底层架构时, `GPU_DEVICE_ORDINAL` 是一个源自 AMD 异构计算(OpenCL / ROCm / HIP 生态)的经典环境变量.

与你之前见到的 `GGML_VK_VISIBLE_DEVICES` 类似, 它也是一个用于硬件设备选择与隔离的变量, 但它的历史更早、覆盖的计算栈层级更偏向底层驱动.

---

### 一、核心含义解析

1. 命名解析:
   * `GPU_DEVICE`: 图形处理单元设备.
   * `ORDINAL`: 序数 / 索引序号(0, 1, 2, ...).
2. 本质作用:
   * `GPU_DEVICE_ORDINAL` 最初是 AMD 官方 OpenCL 驱动运行时(AMD OpenCL Runtime)中用于限定应用程序可见 GPU 的标准变量.
   * 随着 AMD 推出 ROCm / HIP 栈替代传统的纯 OpenCL, 该变量被 ROCm 运行时向后兼容保留, 并常常与 `HIP_VISIBLE_DEVICES`、`ROCR_VISIBLE_DEVICES` 一同出现.
   * 它的作用就是显式传入一个逗号分隔的设备索引列表(例如 `0`、`1`、`0,1`), 告诉驱动层: "只将这些序数对应的 AMD GPU 暴露给应用程序, 其余显卡视作不存在".
3. 为什么 Ollama 日志中会出现它:
   * Ollama 为了支持 AMD Radeon 系列(RX 6000 / 7000 系列及数据中心 Instinct MI 卡), 内置了针对 ROCm 的后端 Runner.
   * 在启动其子进程(llama-server ROCm 版本)时, Ollama 会自动梳理、继承或隔离宿主机上的异构计算环境变量. 日志中打印出 `GPU_DEVICE_ORDINAL:`(且后面无内容), 代表该变量在启动时未被用户显式赋值, 系统将交由 ROCm/AMD 驱动默认枚举所有可用硬件.

---

### 二、典型使用场景

在带有 AMD 显卡的机器上运行 Ollama 时, `GPU_DEVICE_ORDINAL` 主要在以下场景发挥作用:

1. AMD APU(核显)与独立显卡冲突:
   * 这是 Linux/Windows 上 AMD 用户最常遇到的问题: CPU 带核显(如 Ryzen 7000/8000 处理器自带的 RDNA2/RDNA3 核显), 同时插有 RX 7900 XTX 独立显卡.
   * ROCm / OpenCL 驱动可能会将核显排在 `0` 号位. 如果默认加载, Ollama 会试图把几十 GB 的大语言模型塞进只有几百兆/几千兆共享显存的核显中, 造成程序秒崩. 通过指定 `GPU_DEVICE_ORDINAL` 可以精确命中独立显卡.
2. 多卡计算负载隔离:
   * 拥有多张 AMD 计算卡或图形卡时, 将其中某张卡(如 1 号卡)分配给 Ollama 服务, 保留 0 号卡用于本地渲染、训练任务或其他推理服务.
3. 驱动兼容层兜底(Fallback):
   * 在某些轻量级虚拟化、容器或老版本 AMD 驱动环境中, 较新的 `ROCR_VISIBLE_DEVICES` 或 `HIP_VISIBLE_DEVICES` 可能因运行时库版本缺失而失效, 但传统的 `GPU_DEVICE_ORDINAL` 仍然能被更底层的驱动层识别, 常被用作兼容性兜底方案.

---

### 三、具体配置与使用示例

#### 步骤 1: 确认 AMD GPU 的设备序号(Ordinal)

在 Linux 下可以通过 ROCm 提供的系统工具查看:

```bash
rocm-smi
```

或者使用 `rocminfo`:

```bash
rocminfo | grep -E "Device Type|Marketing Name"
```

假设输出如下:

```bash
GPU[0] : AMD Radeon Graphics (核显)
GPU[1] : AMD Radeon RX 7900 XTX (独显)
```

此时你想要使用的独立显卡序号就是 `1`.

---

#### 步骤 2: 在不同使用场景下配置

##### 示例 1: Linux 命令行手动启动 Ollama

如果你是临时测试或前台排障, 可以在启动 `ollama serve` 前声明环境变量:

```bash
# 只允许使用 1 号独立显卡
export GPU_DEVICE_ORDINAL=1

# 启动服务
ollama serve
```

##### 示例 2: Linux 系统服务(systemd 守护进程部署)

这是生产或个人常驻服务器中最推荐的方式:

1. 编辑 Ollama 服务配置:

```bash
sudo systemctl edit ollama.service
```

2. 在新弹出的配置区块中加入环境变量配置:

```ini
[Service]
Environment="GPU_DEVICE_ORDINAL=1"
```

   (注: 为保证最大的兼容性, AMD 用户通常也可以同时写上 `HIP_VISIBLE_DEVICES`)

```ini
[Service]
Environment="HIP_VISIBLE_DEVICES=1"
Environment="GPU_DEVICE_ORDINAL=1"
```

3. 保存退出后生效:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

##### 示例 3: 双 AMD 卡并行(模型切分 / Tensor Parallel)

如果机器上有两张卡(序号 0 和 1), 且希望让 Ollama 把大模型权重(如 Llama-3-70B)均匀分摊到两张卡上:

```bash
export GPU_DEVICE_ORDINAL=0,1
ollama serve
```

##### 示例 4: Docker 容器环境

如果使用 Docker 将宿主机 AMD 显卡直通挂载到容器内:

```bash
docker run -d \
  --device /dev/kfd \
  --device /dev/dri \
  -e GPU_DEVICE_ORDINAL=1 \
  -p 11434:11434 \
  --name ollama-amd \
  ollama/ollama:rocm
```

---

### 四、避坑指南与三者优先级关系

在 AMD ROCm / HIP 体系中, 控制显卡可见性的环境变量共有三个, 它们的生效优先级和作用层级通常如下(从高到低):

$$\text{HIP\_VISIBLE\_DEVICES} \quad > \quad \text{ROCR\_VISIBLE\_DEVICES} \quad > \quad \text{GPU\_DEVICE\_ORDINAL}$$

* `HIP_VISIBLE_DEVICES`: HIP 运行时的最高优先级变量(功能对标 NVIDIA 的 `CUDA_VISIBLE_DEVICES`).
* `ROCR_VISIBLE_DEVICES`: Radeon Open Compute Runtime(底层的系统级运行时层).
* `GPU_DEVICE_ORDINAL`: 驱动更偏底层的传统序数控制.

> 最佳实践建议:
> 如果你在使用 AMD 显卡排障时遇到了显卡漂移或核显冲突, 最稳妥的做法是将这几个变量保持一致, 例如在配置文件中同时设置:
> ```bash
> export HIP_VISIBLE_DEVICES=1
> export ROCR_VISIBLE_DEVICES=1
> export GPU_DEVICE_ORDINAL=1
> ```
> 这样无论底层 llama.cpp 是链接了 HIP 动态库还是通过更底层的驱动层初始化硬件, 都能确保 100% 绑定到期望的独立显卡上. 如果你的设备是纯 NVIDIA 显卡环境, 此变量则完全处于非活跃(忽略)状态.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
HIP_VISIBLE_DEVICES:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 AMD 异构计算生态中, `HIP_VISIBLE_DEVICES` 是级别最高、最常用、最核心的 GPU 设备隔离与控制环境变量.

如果把 NVIDIA 的 CUDA 体系与 AMD 的 ROCm 体系做对照, `HIP_VISIBLE_DEVICES` 在 AMD 生态中的地位完全等同于 NVIDIA 生态中的 `CUDA_VISIBLE_DEVICES`.

---

### 一、核心含义与工作机制

1. 命名解析:
   * `HIP`(Heterogeneous-compute Interface for Portability): AMD 推出的跨平台 C++ 编程接口, 旨在提供对标 CUDA 运行时的能力.
   * `VISIBLE_DEVICES`: 可见设备列表.
2. 本质作用:
   * 告诉 AMD HIP 运行时驱动: "只允许应用程序识别并使用指定的这几张 GPU, 未指定的设备强制对其屏蔽".
3. "逻辑重映射(Re-indexing)"机制:
   * 该变量不仅能过滤显卡, 还会对可见设备进行内部逻辑重新编号(从 0 开始).
   * 示例: 如果系统物理显卡有 0, 1, 2, 3 四张, 你设置了 `HIP_VISIBLE_DEVICES=2,3`:
     * 底层框架(Ollama / llama.cpp)看到的显卡数量只有 2 张.
     * 物理上的 2 号卡会被框架识别为逻辑 0 号卡.
     * 物理上的 3 号卡会被框架识别为逻辑 1 号卡.
4. 日志中为什么出现:
   * Ollama 针对 AMD 显卡内置了预编译的 ROCm/HIP Runner 模块. 在启动时, Ollama 会输出相关硬件环境检查状态; 若日志显示 `HIP_VISIBLE_DEVICES:` 且后无具体参数, 说明当前未做任何人工限制, 默认允许 HIP 探测宿主机全部可用设备.

---

### 二、核心使用场景

在基于 AMD 显卡部署 Ollama 服务时, 此变量通常在以下 4 个场景中使用:

1. 解决 AMD CPU 核显(APU)与独立显卡(dGPU)冲突:
   * 现代 AMD Ryzen 处理器(如 7000/8000/9000 系列)自带核显. Linux 或 Windows 系统经常把核显识别为物理 0 号设备.
   * 默认情况下, Ollama 初始化 ROCm 时若优先绑定 0 号核显, 会因显存极小(如 512MB/2GB)立即触发显存溢出(OOM)崩溃. 通过配置该变量指定独立显卡, 是解决此类闪退的最直接方式.
2. 多卡算力切分与业务隔离:
   * 机器配备多张 AMD 显卡(如 2 张 Radeon RX 7900 XTX, 或多张 Instinct MI 计算卡).
   * 如果你需要一张卡供 Ollama 提供 7×24h 模型 API, 另一张卡运行 Stable Diffusion 或 PyTorch 训练, 即可用它将 Ollama 锁定在单卡上.
3. 控制大模型的多卡张量并行(Tensor Parallelism):
   * 运行超大参数模型(如 Llama-3-70B、DeepSeek 等)单卡显存不足时, 指定 `HIP_VISIBLE_DEVICES=0,1`, Ollama 会自动检测并跨卡分摊模型权重层(Layer Sharding).
4. 强制回退到纯 CPU 运行(测试/排障):
   * 当怀疑 GPU 驱动或 ROCm runner 存在兼容性 bug 时, 可以通过传入特殊值禁用所有 GPU, 强制验证 CPU 跑通逻辑.

---

### 三、具体配置与使用示例

#### 步骤 1: 确认系统的物理 GPU 序号

在 Linux 环境下, 通过 ROCm 原生工具查看:

```bash
rocm-smi
```

或者:

```bash
rocminfo | grep -E "Device Type|Marketing Name"
```

假设终端输出:

```bash
GPU[0] : AMD Radeon 780M Graphics (处理器核显)
GPU[1] : AMD Radeon RX 7900 XTX (独立显卡 1)
GPU[2] : AMD Radeon RX 7900 XTX (独立显卡 2)
```

此时独显物理序号为 `1` 和 `2`.

---

#### 步骤 2: 在不同场景下配置

##### 场景 A: 仅使用 1 号独立显卡(屏蔽核显与其他卡)

* Linux 临时运行:

 ```bash
export HIP_VISIBLE_DEVICES=1
ollama serve
```

* Systemd 生产守护进程:

```bash
sudo systemctl edit ollama.service
```

  在编辑窗口中填入:

```ini
[Service]
Environment="HIP_VISIBLE_DEVICES=1"
```

  保存后重启服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 场景 B: 双独显并行(将大模型权重均分在 1 号和 2 号卡)

```bash
export HIP_VISIBLE_DEVICES=1,2
ollama serve
```

(此时 Ollama 会认为它拥有两张卡: 逻辑 0 号是物理 1 号卡, 逻辑 1 号是物理 2 号卡)

##### 场景 C: 颠倒主从卡顺序(将 2 号卡设为主调度卡)

```bash
export HIP_VISIBLE_DEVICES=2,1
ollama serve
```

##### 场景 D: 强制禁用所有 AMD GPU(转为纯 CPU 推理排障)

将值设为空, 或者设为 `-1`:

```bash
export HIP_VISIBLE_DEVICES=-1
ollama serve
```

##### 场景 E: Docker 容器中部署 AMD 卡 Ollama

```bash
docker run -d \
  --device /dev/kfd \
  --device /dev/dri \
  -e HIP_VISIBLE_DEVICES=1 \
  -p 11434:11434 \
  --name ollama-amd \
  ollama/ollama:rocm
```

---

### 四、高级特性与避坑注意

1. 三者环境变量优先权(Precedence Rule):
   在 AMD 驱动栈中, 处理可见设备的环境变量优先级如下:

   $$\mathbf{HIP\_VISIBLE\_DEVICES} \quad > \quad \mathbf{ROCR\_VISIBLE\_DEVICES} \quad > \quad \mathbf{GPU\_DEVICE\_ORDINAL}$$

   * 只要设置了 `HIP_VISIBLE_DEVICES`, 它就会在 HIP 运行时层直接覆盖另外两个变量.

2. 支持基于 UUID 绑定(稳定性更高):
   在经常插拔硬件或 PCI-E 总线顺序变动的服务器上, 物理序号(0, 1)可能会漂移. HIP 支持使用 GPU 的全局唯一 UUID 格式:

```bash
export HIP_VISIBLE_DEVICES=GPU-xxxxxxxxxxxxxxxx
```

   (UUID 可以通过 `rocm-smi --showuniqueid` 或 `rocminfo` 获取).

3. NVIDIA 环境不生效:
   如果宿主机是 NVIDIA 显卡, Ollama 会自动启动 CUDA Runner, `HIP_VISIBLE_DEVICES` 会被忽略; 控制 NVIDIA 显卡请使用 `CUDA_VISIBLE_DEVICES`.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
ROCR_VISIBLE_DEVICES:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 AMD ROCm 异构计算生态中, `ROCR_VISIBLE_DEVICES:` 是一个位于 HSA(异构系统架构)系统级核心运行时层的硬件可见性与设备隔离环境变量.

如果说 `HIP_VISIBLE_DEVICES` 是直接面向 C++ 编程接口(HIP API)的高层控制器, 那么 `ROCR_VISIBLE_DEVICES` 则是直接作用于驱动底层(ROCR / HSA Core Runtime)的"硬件防火墙".

---

### 一、核心含义与架构层级剖析

#### 1. 命名拆解与技术定位

* `ROCR`: 代表 Radeon Open Compute Runtime, 即 AMD 官方开源的 ROCm 系统运行时核心库(对应系统中的动态库 `libhsa-runtime64.so`). 它负责实现 HSA 基金会规范, 向上承接 HIP/OpenCL, 向下直接对接 Linux 内核的 KFD(Kernel Fusion Driver, `/dev/kfd`).
* `VISIBLE_DEVICES`: 可见设备掩码列表.
* 日志状态: 日志中输出 `ROCR_VISIBLE_DEVICES:` 且后无具体数值, 代表当前处于缺省非受限状态, 底层 HSA 运行时会将探测到的所有物理 AMD GPU 代理(Agents)均暴露给 Ollama.

#### 2. ROCm 软件栈中的执行层级

为了彻底理解它, 我们需要透视 AMD 运行时调用链:

```bash
┌────────────────────────────────────────────────────────┐
│  Ollama 服务端 / 底层 llama.cpp 推理 Runner            │
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│  HIP Runtime 运行时 (受 HIP_VISIBLE_DEVICES 控制)      │
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│  ROCR Runtime / HSA Core (受 ROCR_VISIBLE_DEVICES 控制)│ <── 本变量的作用锚点!
└────────────────────────────────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│  Linux 内核驱动层 (AMD KFD: /dev/kfd, /dev/dri/renderD*)│
└────────────────────────────────────────────────────────┘
```

* 工作机制: 当底层引擎调用 `hsa_iterate_agents()` 枚举宿主机上的可用计算节点时, ROCR 运行时会首先读取 `ROCR_VISIBLE_DEVICES`.
* 物理效果: 任何未被列入该变量的 GPU, 在 HSA 这一层就会被彻底抹去. 上层的 HIP 运行时甚至连该显卡的存在都无从感知.

---

### 二、核心使用场景

通常情况下, 设置 `HIP_VISIBLE_DEVICES` 已经能满足大部分多卡隔离需求, 但在以下深水区场景中, `ROCR_VISIBLE_DEVICES` 具有不可替代的底层强制力:

#### 场景 1: 在最底层彻底屏蔽 AMD APU(核显)引发的 HSA 探测崩溃

* 痛点: 现代 AMD Ryzen 处理器(如 7000/8000/9000 系列及移动端)内置了 RDNA 核显. 在 Linux 下, ROCR 驱动初始化时会将核显枚举为一个 HSA 计算 Agent(通常占据 Agent 0 或 Agent 1).
* 灾难: 某些版本的底层 llama.cpp Runner 在初始化内存池时, 会遍历所有 HSA Agent 的拓扑与 NUMA 节点信息. 即便高层 HIP 想选独显, 遍历到核显时往往也会因 APU 缺乏独立 VRAM 导致底层 HSA 直接抛出:
  > `HSA_STATUS_ERROR_INVALID_AGENT` 或 `HSA_STATUS_ERROR_OUT_OF_RESOURCES`
* 解决: 在最底层的 ROCR 层直接设置 `ROCR_VISIBLE_DEVICES=1`, 让 HSA 迭代器从物理源头上彻底跳过核显, 杜绝初始化崩溃.

#### 场景 2: 多卡集群与容器多租户的硬件硬隔离

* 痛点: 一台算力服务器插有 4 张 AMD Radeon RX 7900 XTX 或 Instinct MI 系列计算卡, 需要将其中某一张(如 GPU 2)独立划拨给 Ollama 容器, 其余卡留给深度学习训练团队.
* 解决: 通过注入 `ROCR_VISIBLE_DEVICES=2`, Ollama 在初始化显存计算图和设备上下文时, 绝不会触碰其他 3 张卡的显存与 PCI-E 通道, 实现零资源争抢.

#### 场景 3: 规避跨 NUMA 节点与 PCI-E 拓扑导致的延迟震荡

* 背景: 在双路 CPU 或多插槽 AMD EPYC 服务器中, 不同 GPU 挂载在不同的 CPU Socket(NUMA 节点)下. 如果让 Ollama 跨 NUMA 调度两张卡, 内存总线延迟剧增.
* 解决: 使用该变量强行将模型锁定在同一个 NUMA 节点直连的 GPU 上.

---

### 三、具体配置与使用示例

#### 步骤 1: 排查系统中的 AMD 设备硬件索引(Index)或 UUID

在终端中执行 ROCm 原生排查工具:

```bash
rocminfo | grep -E "HSA Agent Information|Name|Device Type|Marketing Name"
```

或者使用:

```bash
rocm-smi
```

假设终端输出:

```bash
Agent 1: (CPU) AMD Ryzen 9 7950X
Agent 2: (GPU) AMD Radeon Graphics (核显, Index 0)
Agent 3: (GPU) AMD Radeon RX 7900 XTX (独显, Index 1)
```

此时你希望分配给 Ollama 的高性能独显设备索引为 `1`.

---

#### 步骤 2: 在不同环境下配置

##### 示例 1: Linux 终端临时命令行启动

```bash
# 强制只让 1 号独显对 ROCR 运行时可见
export ROCR_VISIBLE_DEVICES=1

# 启动服务
ollama serve
```

##### 示例 2: Linux 生产系统服务(systemd 守护进程部署)

这是长期在服务器上管理 AMD GPU 服务的最佳实践:

1. 编辑系统单元服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入变量配置:

```ini
[Service]
# 绑定底层 ROCR 可见设备为 1 号独立显卡
Environment="ROCR_VISIBLE_DEVICES=1"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 示例 3: 双 AMD 卡张量并行(双卡均分模型)

如果机器上有两张独显(索引 0 和 1), 希望两张卡协同工作, 排除其他潜在设备:

```bash
export ROCR_VISIBLE_DEVICES=0,1
ollama serve
```

##### 示例 4: 基于唯一 UUID 绑定(防止插槽漂移)

在多卡服务器上, 重启后 PCI-E 重新枚举可能导致物理序号 0 和 1 发生互换. ROCR 支持传入设备唯一的 UUID(可通过 `rocminfo` 或 `rocm-smi --showuniqueid` 抓取):

```bash
export ROCR_VISIBLE_DEVICES=GPU-7a2e88b49f91c53d
ollama serve
```

##### 示例 5: Docker 容器化部署

直通 AMD 显卡硬件接口给容器时使用:

```bash
docker run -d \
  --device /dev/kfd \
  --device /dev/dri \
  -e ROCR_VISIBLE_DEVICES=1 \
  -p 11434:11434 \
  --name ollama-amd \
  ollama/ollama:rocm
```

---

### 四、架构师级黄金法则: AMD 三层变量的协同避坑

在配置 AMD 显卡时, 你可能会在日志或脚本中同时看到以下三个变量:

1. `HIP_VISIBLE_DEVICES`(HIP 抽象层)
2. `ROCR_VISIBLE_DEVICES`(底层 ROCR 运行时)
3. `GPU_DEVICE_ORDINAL`(底层驱动传统序号)

#### 避坑致命陷阱: 千万不要让它们"打架"!

* 错误案例:

```bash
# 灾难配置: 高层让看 1 号卡, 底层却只暴露 0 号卡!
export HIP_VISIBLE_DEVICES=1
export ROCR_VISIBLE_DEVICES=0
```

  后果: `ROCR_VISIBLE_DEVICES=0` 将物理 1 号卡从底层抹杀, 导致系统中只剩下一张物理 0 号卡(被逻辑编号为 0); 而高层的 `HIP_VISIBLE_DEVICES=1` 却要求访问逻辑 1 号卡. 系统会瞬间因为找不到目标硬件而直接抛出核心转储(Core Dump)闪退!

> 黄金最佳实践(Best Practice):
> 在 AMD GPU 调障与生产部署中, 如果需要指定某张卡(如 1 号卡), 最安全、最彻底的做法是让这组变量保持绝对一致:
> ```bash
> export HIP_VISIBLE_DEVICES=1
> export ROCR_VISIBLE_DEVICES=1
> export GPU_DEVICE_ORDINAL=1
> ```
> 这样可以从高层 C++ 接口到底层驱动 C 库全链路封死其他显卡, 保证 100% 精确命中你指定的硬件设备.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
HSA_OVERRIDE_GFX_VERSION:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 AMD ROCm 生态与本地 LLM 部署实践中, `HSA_OVERRIDE_GFX_VERSION` 是一个救命级(Life-saving)的"显卡伪装"环境变量.

它是让很多未被 AMD 官方完全支持的消费级显卡(如 RX 6700 XT、RX 7600、RX 7800 XT)以及 Ryzen APU 核显(如 Radeon 780M/880M)成功跑起 ROCm / HIP 硬件加速的关键手段.

---

### 一、核心含义解析

1. 命名解析:
   * `HSA`(Heterogeneous System Architecture): 异构系统架构, 是 AMD ROCm 最底层的系统运行库(ROCR).
   * `OVERRIDE`: 强制覆盖 / 伪装.
   * `GFX_VERSION`: 显卡微架构的指令集架构版本号(ISA Target), 例如 `10.3.0`、`11.0.0`.
2. 底层技术背景(为什么需要它?):
   * 在编译底层 GPU 算子(如 Ollama 中的 `llama.cpp` ROCm Runner)时, 编译器(LLVM/HIP-Clang)需要将代码编译为目标显卡架构专用的机器码对象(Code Object).
   * 官方支持碎片化: AMD 官方 ROCm 主要针对数据中心计算卡(Instinct MI 系列)和极少数旗舰显卡(如 RX 7900 XTX 对应 `gfx1100`、RX 6900 XT 对应 `gfx1030`)进行预编译打包.
   * 架构一致, 但 ID 不被认: 如果你用的是 RX 6700 XT(底层是 `gfx1031`)或 RX 7600(底层是 `gfx1102`), 它们的硬件指令与同代旗舰几乎完全兼容. 但当 ROCm 运行时检测到硬件 ID 不是它预编译名单里的那个时, 会直接报错拒绝运行:
     > `HIP error: no kernel image is available for execution on the device`
     > (或者报: `HSA_STATUS_ERROR_INVALID_ISA: The instruction set architecture is not supported`)
3. 本质功能:
   * `HSA_OVERRIDE_GFX_VERSION` 强制告诉底层 HSA 运行时: "不要管你检测到的真实显卡 ID 是什么, 请假装它就是我指定的这个 GFX 版本, 并执行对应的计算核函数(Kernel). "

---

### 二、核心使用场景

在 Ollama 中, 以下场景必须依赖此变量, 否则无法启用 GPU 加速:

1. 中端 RDNA2 消费级显卡(RX 6000 系列):
   * RX 6700 XT / 6750 XT(`gfx1031`)
   * RX 6600 / 6600 XT / 6650 XT(`gfx1032`)
   * 需伪装成 RX 6800/6900 XT 的 `10.3.0`(`gfx1030`).
2. 中低端 RDNA3 显卡与 APU(RX 7000 系列 / 掌机 / 迷你主机):
   * RX 7800 XT / 7700 XT(`gfx1101`)
   * RX 7600 / 7600 XT(`gfx1102`)
   * ROG Ally / Legion Go / 迷你主机上的 AMD 核显(780M / 880M, `gfx1103`)
   * 需伪装成 RX 7900 XTX 的 `11.0.0`(`gfx1100`).
3. 解决 Ollama 默认回退到 CPU 的问题:
   * 如果你在启动 Ollama 时, 显卡虽然被识别, 但日志提示找不到对应的 runner 并默默切到纯 CPU 推理, 90% 的原因就是你的显卡 GFX 版本未被内置识别.

---

### 三、常见显卡架构映射速查表

设置该变量时, 版本号必须写成带点分十进制的格式(如 `10.3.0` 而不是 `gfx1030`):

| 显卡型号                | 硬件真实 GFX ID | 必须设置的覆盖值 (`HSA_OVERRIDE_GFX_VERSION`) | 伪装成的目标架构     |
| :---------------------- | :-------------- | :-------------------------------------------- | :------------------- |
| RX 6700 XT / 6750 XT    | `gfx1031`       | `10.3.0`                                      | RDNA2 旗舰 (gfx1030) |
| RX 6600 / 6600 XT       | `gfx1032`       | `10.3.0`                                      | RDNA2 旗舰 (gfx1030) |
| RX 6500 XT / 6400       | `gfx1034`       | `10.3.0`                                      | RDNA2 旗舰 (gfx1030) |
| RX 7800 XT / 7700 XT    | `gfx1101`       | `11.0.0`                                      | RDNA3 旗舰 (gfx1100) |
| RX 7600 / 7600 XT       | `gfx1102`       | `11.0.0`                                      | RDNA3 旗舰 (gfx1100) |
| Ryzen APU (780M / 880M) | `gfx1103`       | `11.0.0`                                      | RDNA3 旗舰 (gfx1100) |

(注: 原生支持的显卡如 RX 6800/6900 XT [10.3.0] 和 RX 7900 XT/XTX [11.0.0] 不需要手动设置此变量)

---

### 四、具体配置与使用示例

#### 步骤 1: 排查你的真实显卡 GFX 版本

在 Linux 终端中运行:

```bash
rocminfo | grep -i "gfx"
```

如果输出中包含 `Name: gfx1031`, 则代表需要覆盖为 `10.3.0`; 如果包含 `Name: gfx1102`, 则需要覆盖为 `11.0.0`.

---

#### 步骤 2: 在不同环境下配置

##### 示例 1: Linux 终端手动启动排障

以 RX 6700 XT 为例:

```bash
# 强制将驱动层架构识别为 10.3.0
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# 启动 Ollama 服务
ollama serve
```

启动后加载模型, 观察日志, 此时 ROCm runner 会成功加载, 显卡开始进行张量计算.

##### 示例 2: Linux 生产系统服务(systemd 守护进程部署)

这是长期运行最优雅的方式:

1. 编辑 Ollama 服务覆盖配置:

```bash
sudo systemctl edit ollama.service
```

2. 填入如下内容(以 RX 7800 XT / RX 7600 为例, 设置为 `11.0.0`):

```ini
[Service]
Environment="HSA_OVERRIDE_GFX_VERSION=11.0.0"
```

3. 保存退出并生效:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

##### 示例 3: Docker 容器环境

在 Docker 中为非官方支持的显卡启用 Ollama:

```bash
docker run -d \
  --device /dev/kfd \
  --device /dev/dri \
  -e HSA_OVERRIDE_GFX_VERSION=11.0.0 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama:rocm
```

---

### 五、避坑指南与硬性限制

1. 不可"跨代"伪装(跨代必挂):
   * 能伪装: 同代架构内的降级兼容(如 RDNA3 的 `gfx1102` 伪装成 `11.0.0`; RDNA2 的 `gfx1031` 伪装成 `10.3.0`).
   * 不能伪装: 跨大架构伪装(例如把 RDNA1 显卡 RX 5700 XT 伪装成 `10.3.0`, 或把 Vega 显卡伪装成 `11.0.0`). 跨微架构的指令集不兼容, 强行伪装会发生段错误(Segmentation fault)或核心转储(Core Dump).
2. 关于 APU 显存限制:
   * 如果给 AMD 掌机或核显(780M / 880M)设置 `11.0.0`, 虽然能跑通 ROCm, 但由于核显显存是从主内存划分的, 建议在 BIOS 中将 UMA Frame Buffer Size 调大(如调至 4GB 或 8GB), 否则很容易在初始化阶段 OOM.
3. NVIDIA 平台完全无关:
   * 该变量属于 AMD ROCm / HSA 专属驱动机制, NVIDIA 用户看到此变量日志无需理会, 也不会产生任何影响.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
HTTPS_PROXY:
HTTP_PROXY:
NO_PROXY:
http_proxy:
https_proxy:
no_proxy:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

这组环境变量(`HTTP_PROXY`、`HTTPS_PROXY`、`NO_PROXY` 及其小写版本)是网络代理领域的工业标准配置.

由于 Ollama 的服务端守护进程(Server Daemon)主要是基于 Go 语言(Golang) 编写的, Go 官方标准库 `net/http` 和 `golang.org/x/net/http/httpproxy` 原生集成了对这组变量的解析. Ollama 在启动时将它们打在日志里, 是为了方便排查模型拉取失败、握手超时等网络问题.

---

### 一、核心含义解析

#### 1. 变量功能拆解

* `HTTP_PROXY` / `http_proxy`:
  * 含义: 指定访问明文 HTTP 协议外部资源时所使用的正向代理服务器地址.
* `HTTPS_PROXY` / `https_proxy`:
  * 含义: 指定访问加密 HTTPS 协议外部资源时所使用的正向代理服务器地址.
  * 对 Ollama 的关键性: 最核心的变量. 因为 Ollama 的官方模型镜像库(`registry.ollama.ai`)全程强制走 TLS/HTTPS, 下载模型主要走此代理.
* `NO_PROXY` / `no_proxy`:
  * 含义: 绕过代理的白名单. 指定哪些域名、IP 地址、网段或子网在通信时绝对不走代理, 必须进行直连.

#### 2. 为什么同时存在大写和小写?

* 历史原因: 传统的 Linux CLI 工具(如 `curl`、`wget`)普遍习惯使用小写(`http_proxy`); 而在某些框架、Windows 系统或容器规范中常使用大写(`HTTP_PROXY`).
* Go 语言的读取策略: Go 语言网络库为了最大程度保证兼容性, 会同时检查大写与小写. 通常在 Go 中, 如果两者同时存在, 小写变量(如 `http_proxy`)的优先级通常高于大写; 而对于 `REQUEST_METHOD` 相关的安全漏洞(如早期的 httpoxy 漏洞), 大写和特定的调用链也有特殊防范. Ollama 在日志中成对打印, 代表它正在监听这两种形式的注入.

---

### 二、Ollama 中的典型使用场景

1. 加速/解决官方模型拉取超时(最常见场景):
   * 执行 `ollama pull llama3:8b` 或 `ollama run qwen2.5` 时, Ollama 会连接 `registry.ollama.ai` 并从 Cloudflare CDN 下载几个 GB 到几十 GB 的 GGUF 数据分块(Blobs).
   * 在部分网络环境下, 直连极易出现:
     > `Error: pull model manifest: Get "https://registry.ollama.ai/...": dial tcp ...: i/o timeout`
     > `TLS handshake timeout`
   * 配置 `HTTPS_PROXY` 可以让模型下载流量经由本地加速代理节点平稳下载.
2. 企业内网与金融隔离环境(Air-Gapped / Egress Gateway):
   * 在很多企业算力集群中, 服务器没有公网直接访问权限, 所有外网访问必须统一走企业统一出口代理(Squid / Corporate Forward Proxy), 并可能伴随身份鉴权.
3. 防止本地推理 API 请求被"误代理"(`NO_PROXY` 的必要性):
   * 如果你在本地开发应用(例如一个 Python LangChain 脚本或 Open WebUI), 调用运行在 `http://127.0.0.1:11434` 上的 Ollama 服务.
   * 如果你全局配置了代理, 但没有配置 `NO_PROXY`, 你的 Python 客户端可能会把发给 `127.0.0.1:11434` 的模型请求发送到你的外部代理软件上, 导致代理服务器返回 `502 Bad Gateway` 或 `Connection Refused`, 出现"本地调用自己机器上的 Ollama 却报错超时"的荒谬现象.

---

### 三、代理地址语法规范

代理地址格式支持标准 HTTP 代理与 SOCKS5 代理:

1. 普通 HTTP/HTTPS 代理:
   `http://127.0.0.1:7890`
2. 带用户名和密码的认证代理:
   `http://username:password@proxy.example.com:8080`
3. SOCKS5 代理(Go 语言原生良好支持):
   `socks5://127.0.0.1:1080`

---

### 四、具体配置与使用示例

> 特别提醒(最大避坑点):
> Linux 用户最容易犯的错误是直接在终端跑 `export https_proxy=...`, 然后去测 Ollama. 但由于 Ollama 在 Linux 下默认是作为 `systemd` 系统守护进程以独立服务运行的, 终端里导出的变量根本不会传给后台常驻的 Ollama 服务!

#### 示例 1: Linux 下正确为 systemd 守护进程配置代理(推荐做法)

1. 执行 systemd 配置覆写命令:

```bash
sudo systemctl edit ollama.service
```

2. 在打开的文件中添加代理环境配置:

```ini
[Service]
# 代理服务器地址(根据实际端口修改, 如 Clash 常为 7890, v2ray 常为 10809)
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"

# 必须配置 NO_PROXY, 让本地与局域网流量直连, 避开代理
Environment="NO_PROXY=localhost,127.0.0.1,0.0.0.0,::1,192.168.0.0/16,10.0.0.0/8"
```

3. 保存并退出编辑器, 重新加载并重启 Ollama:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

4. 验证是否生效:
   * 查看日志, 即可看到这几个变量后不再为空, 而是打印出了你设置的代理地址:

```bash
journalctl -u ollama.service -e | grep PROXY
```

---

#### 示例 2: Linux / macOS 前台测试运行

如果你没有使用 systemd, 而是直接在终端前台运行 Ollama 服务:

```bash
export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export NO_PROXY=localhost,127.0.0.1,::1

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 部署环境

* PowerShell 临时启动:

```powershell
$env:HTTPS_PROXY="http://127.0.0.1:7890"
$env:HTTP_PROXY="http://127.0.0.1:7890"
$env:NO_PROXY="localhost,127.0.0.1"
ollama serve
```

* Windows 系统永久配置:
  1. 按 `Win + R` 输入 `sysdm.cpl` 进入系统属性 -> 高级 -> 环境变量.
  2. 在"用户变量"或"系统变量"中新建:
     * 变量名: `HTTPS_PROXY`, 变量值: `http://127.0.0.1:7890`
     * 变量名: `NO_PROXY`, 变量值: `localhost,127.0.0.1`
  3. 彻底退出任务栏托盘里的 Ollama 图标并重新打开它.

---

#### 示例 4: Docker 容器化部署 Ollama

宿主机运行了代理(监听在宿主机对应端口), 容器拉取模型需要访问宿主机代理:

```bash
docker run -d \
  --name ollama \
  -p 11434:11434 \
  --add-host=host.docker.internal:host-gateway \
  -e HTTPS_PROXY="http://host.docker.internal:7890" \
  -e HTTP_PROXY="http://host.docker.internal:7890" \
  -e NO_PROXY="localhost,127.0.0.1" \
  -v ollama:/root/.ollama \
  ollama/ollama
```

---

### 五、避坑指南总结

| 风险点                 | 表现及原因                                                         | 解决方案                                                                                       |
| :--------------------- | :----------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| 忘记配置 `NO_PROXY`    | 配置代理后模型拉取快了, 但 WebUI / 第三方客户端频繁报网络连接异常. | 永远确保 `NO_PROXY` 包含 `localhost,127.0.0.1,::1`.                                            |
| Systemd 环境隔离       | 命令行配了环境变量, `ollama pull` 依然超时.                        | 变量没有注入守护进程, 必须使用 `systemctl edit ollama.service` 配置.                           |
| 私有 Registry 访问失败 | 搭建了公司内网私有模型仓库(如 Harbor), 拉取时反而报错.             | 把私有仓库的内部域名追加到 `NO_PROXY` 中, 例如 `NO_PROXY=localhost,127.0.0.1,.mycompany.corp`. |

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
LLAMA_ARG_FIT:
LLAMA_ARG_FIT_TARGET:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在深入剖析 Ollama 及其底层计算引擎时, `LLAMA_ARG_FIT` 和 `LLAMA_ARG_FIT_TARGET` 属于来自底层 llama.cpp(llama-server)现代参数自适应引擎的核心控制变量.

Ollama 的底层推理进程(Runner)是基于 llama.cpp 构建的. llama.cpp 引入了一套通用规范: 所有命令行参数 `--<option>` 都可以通过环境变量 `LLAMA_ARG_<OPTION>` 进行同等注入.

---

### 一、两个环境变量的核心含义

#### 1. `LLAMA_ARG_FIT`(自适应显存装载总开关)

* 对应原生命令参数: `-fit, --fit [on|off]`
* 作用机制:
  * `on`(默认行为): 开启显存自适应拟合机制. 当你在启动或请求模型时, 如果没有严格锁死每项显存参数(如 `-ngl` 卸载到 GPU 的层数、KV Cache 上下文大小、MoE 专家层卸载等), 引擎会自动探测系统当前的剩余显存, 并动态计算出"刚好能塞进显存"的最大层数与上下文尺寸, 竭尽全力避免抛出 CUDA Out of Memory (OOM) 崩溃.
  * `off`: 关闭该自动化机制. 必须由用户或上层调用者严格手动指定各项资源, 超出显存即硬性报错中断.

#### 2. `LLAMA_ARG_FIT_TARGET`(目标预留显存冗余 / 安全缓冲)

* 对应原生命令参数: `-fitt, --fit-target MiB0,MiB1,MiB2,...`(单位: MiB, 默认值为 `1024`, 即 1GB)
* 作用机制:
  * 在开启 `--fit` 自动计算分配时, 引擎绝不会鲁莽地把显卡物理显存 100% 占满, 而是会主动在每张卡上保留一块"安全余量(Margin)".
  * 默认的 1024 MiB 是给操作系统桌面绘制、浏览器硬件加速、临时计算图峰值留出的缓冲带.
  * 该变量允许你传入单个数值(应用到所有卡)或使用逗号分隔的数值(针对多卡分别设定), 以精细控制每张显卡要预留多少 MiB 显存不被模型占用.

> 日志为什么显示为空?
> 在 Ollama 的日志中输出 `LLAMA_ARG_FIT: ` 与 `LLAMA_ARG_FIT_TARGET: ` 且后面无值, 说明当前宿主机没有显式提供外部覆写, 底层引擎正运行在官方内置的缺省状态(即 `--fit on` 且默认缓冲为 1024 MiB).
>

---

### 二、核心使用场景

#### 场景 1: 无桌面纯算力服务器 -- "极限压榨"显存(Squeeze VRAM)

* 背景: 在一台纯 Linux 字符界面的专用算力机上, 显卡完全用于模型计算, 没有图形桌面环境(X11/Wayland)占用显存.
* 痛点: 默认保留 1024 MiB 会白白浪费 1GB 珍贵显存, 有时可能就因为差这 500MB, 导致大模型的最后两层 Transformer Block 无法放入 GPU, 只能切到慢几十倍的 CPU 内存.
* 解决: 把 `LLAMA_ARG_FIT_TARGET` 压缩到 `128` 或 `64` MiB, 几乎吃满整张卡, 将更多模型层保留在显存中大幅提升吞吐.

#### 场景 2: 个人工作站 / 笔记本 -- 防桌面卡死与显存防暴(Prevent OOM)

* 背景: 开发者在一边用本地 Ollama 编码, 一边在同一张卡上使用 Chrome(数十个标签页)或连接双 4K 显示器.
* 痛点: 默认的 1024 MiB 可能不够抵抗桌面窗口开启时的显存波动, 极易引发 Windows 驱动重置或 Linux 崩溃.
* 解决: 主动放大缓冲区, 将 `LLAMA_ARG_FIT_TARGET` 设为 `2048` 或 `3072` MiB, 给桌面留出充足空间.

#### 场景 3: 异构多卡(主显卡 + 纯计算副卡)精细化分工

* 背景: 插了两张卡: GPU 0 接显示器负责图形; GPU 1 是专门买来跑模型的副卡.
* 解决: 利用多参数分别配置:
  `LLAMA_ARG_FIT_TARGET="2048,128"`(0 号主卡留 2GB 缓冲区, 1 号副卡只留 128MB 极限利用).

#### 场景 4: 基准性能压测(Benchmark & Strict Reproducibility)

* 背景: 做算法评估或吞吐压测时, 不希望底层根据剩余显存"自作聪明"地动态缩减层数或截断 Context.
* 解决: 设置 `LLAMA_ARG_FIT=off`, 关闭弹性调度, 强制进行严苛装载.

---

### 三、具体配置与使用示例

#### 示例 1: Linux 临时命令行调优启动(极限压榨显存)

假设你有一张 16GB 的 RTX 4080, 在纯服务器无 GUI 环境下, 希望将预留缓冲从 1024MB 压缩到 256MB, 尽可能多塞层数:

```bash
# 启用显存拟合, 并将安全预留调小至 256 MiB
export LLAMA_ARG_FIT=on
export LLAMA_ARG_FIT_TARGET=256

# 启动服务
ollama serve
```

#### 示例 2: Linux 生产系统服务(systemd 守护进程部署)

这是长期运行最推荐的配置方式:

1. 编辑 Ollama 服务配置:

```bash
sudo systemctl edit ollama.service
```

2. 注入如下环境变量(以双卡工作站为例: 0号卡留 2048MB 给系统, 1号卡只留 256MB 给模型):

```ini
[Service]
Environment="LLAMA_ARG_FIT=on"
Environment="LLAMA_ARG_FIT_TARGET=2048,256"
```

3. 重启生效:

```bash
sudo systemctl daemon-reload
sudo systemctl restart ollama
```

#### 示例 3: Windows 本地个人电脑(放宽安全缓冲)

防止运行大模型时浏览器或 IDE 闪退:

* PowerShell 启动:

```powershell
$env:LLAMA_ARG_FIT="on"
$env:LLAMA_ARG_FIT_TARGET="2048"
ollama serve
```

#### 示例 4: Docker 容器化云原生部署

```bash
docker run -d \
  --gpus all \
  -e LLAMA_ARG_FIT=on \
  -e LLAMA_ARG_FIT_TARGET=128 \
  -p 11434:11434 \
  --name ollama-optimized \
  ollama/ollama
```

---

### 四、架构师级进阶认知: 与 Ollama 原生显存机制的关系

在 Ollama 的高阶架构设计中, 不要混淆 `OLLAMA_GPU_OVERHEAD` 与 `LLAMA_ARG_FIT_TARGET`:

1. `OLLAMA_GPU_OVERHEAD`(Ollama 自身的上层预留):
   * 采用字节(Bytes)计量.
   * 这是 Ollama 自身的调度调度器(Scheduler)在做宏观决策(比如决定分配多少显存给模型、模型是否需要驱逐出显存)时使用的安全余量.
2. `LLAMA_ARG_FIT_TARGET`(llama.cpp 底层推理进程的预留):
   * 采用 MiB(兆字节) 计量.
   * 这是进入 C++ 计算后端真正执行内存分配计算图(ggml-alloc / memory plan)时的最后一公里防线.

> 经验总结:
> 如果你在使用显存非常敏感的模型(如 Qwen-32B 或 70B 级别 MoE 模型), 发现模型老是被 Ollama 退回一部分到 CPU, 而显存实际上还空着不少, 将 `LLAMA_ARG_FIT_TARGET` 适当调低(如 `256` 或 `128`)通常是立竿见影挤出 GPU 算力、提高每秒推理 Token 数(Tokens/s)的关键技巧.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_GPU_OVERHEAD:0
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的底层架构中, `OLLAMA_GPU_OVERHEAD:0` 是一个由 Ollama 顶层 Go 语言调度器(Scheduler)直接消费的显存安全预留变量.

它直接决定了 Ollama 在评估"这台机器能把模型的多少层塞进显卡"时, 要对显存扣除多少"安全保证金".

---

### 一、核心含义解析

1. 官方定义与计量单位:
   * 源码定义: `GpuOverhead = Uint64("OLLAMA_GPU_OVERHEAD", 0)`.
   * 核心含义: "Reserve a portion of VRAM per GPU (in bytes)"(每张显卡强制预留、坚决不用的显存大小).
   * 计量单位: 字节(Bytes). 这一点至关重要, 它接收的是一个无符号 64 位整数(如 `1073741824` 代表 1 GiB).
2. 日志中显示 `:0` 的意义:
   * 默认情况下, Ollama 将其初始值设为 `0`.
   * 这表示: Ollama 默认没有开启额外的预留防线, 调度器在探测到当前 GPU 有多少剩余显存时, 就会尽可能按满额去规划模型层数卸载(Offload).
3. 调度器(Scheduler)中的数学逻辑:
   在加载模型前, Ollama 的 Go 调度器执行以下计算公式:

   $$\text{规划可用显存} = \text{系统实测剩余显存} - \mathbf{OLLAMA\_GPU\_OVERHEAD}$$

   调度器根据这个最终的"规划可用显存", 动态计算出模型权重能放多少层到 GPU(`-ngl`)、KV Cache 能够开多大以及激活图缓存的上限.

---

### 二、核心使用场景

既然默认是 0, 为什么要在特定场景下主动配置它?

#### 场景 1: 混合负载防显卡崩溃(个人工作站 / 开发者电脑)

* 痛点: 你的电脑插了一张 16GB 的显卡, 除了跑 Ollama, 平时还在用 Chrome、运行 3D 渲染, 或者同时挂着 ComfyUI / Stable Diffusion 生成图片.
* 问题: Ollama 启动时一查"还有 15GB 显存", 直接把 14.5GB 占满. 当你突然在浏览器里播放 4K 视频或切出图形软件时, 显存瞬间被挤爆, 导致 CUDA 驱动崩溃、闪屏甚至死机.
* 解决: 主动预留 2GB(`2147483648` 字节)作为防火墙, Ollama 绝不会踏入这 2GB 空间, 保证操作系统图形渲染永远安全.

#### 场景 2: 防止推理动态尖峰引发 OOM(显存波动缓冲)

* 痛点: Ollama 的模型加载预算主要计算的是"静态模型权重 + KV Cache". 但在处理超长 Prompt 或复杂的多模态(视觉大模型)图片推理时, 临时的计算图中间激活(Compute Graph Reserve / Scratch Buffer)会出现动态突发峰值.
* 解决: 为防止极少数边缘请求瞬间撑爆显存(CUDA Out of Memory), 预留 512MB~1GB 的显存冗余, 能有效吸收推理过程中的显存毛刺.

#### 场景 3: 云原生与 vGPU / K8s 容器算力切分

* 痛点: 在 Kubernetes 环境中使用 vGPU 方案(如 HAMi 等显存切分技术)时, 多容器共享同一物理卡, 如果 Ollama 按照物理总显存盲目估算, 会因为超出虚拟配额而直接收到 `SIGSEGV` 或 OOM 杀死信号.
* 解决: 通过环境变量强制锁死 Ollama 的显存吞吐预期, 避免越界触发容器驱逐.

---

### 三、字节换算速查表

由于该变量以 Byte(字节) 为底层计量单位, 设置时请务必填写精确数值(直接写 `1GB` 或 `1024` 会导致解析失败或严重偏差):

| 期望预留的显存大小 | 计算公式                      | 环境变量填写的实际数值 |
| :----------------- | :---------------------------- | :--------------------- |
| 512 MiB            | $512 \times 1024 \times 1024$ | `536870912`            |
| 1 GiB              | $1 \times 1024^3$             | `1073741824`           |
| 2 GiB              | $2 \times 1024^3$             | `2147483648`           |
| 4 GiB              | $4 \times 1024^3$             | `4294967296`           |

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(systemd 守护进程部署)

假设你需要为 Linux 桌面系统保留 2 GiB 显存:

1. 编辑系统服务单元:

```bash
sudo systemctl edit ollama.service
```

2. 注入预留环境变量:

```ini
[Service]
# 预留 2 GiB (2147483648 字节)
Environment="OLLAMA_GPU_OVERHEAD=2147483648"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

#### 示例 2: Linux / macOS 终端临时运行(预留 1 GiB)

```bash
# 预留 1 GiB
export OLLAMA_GPU_OVERHEAD=1073741824

# 启动服务
ollama serve
```

#### 示例 3: Windows 本地部署环境

* PowerShell 命令行测试:

```powershell
$env:OLLAMA_GPU_OVERHEAD="1073741824"
ollama serve
```

* 系统环境变量配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_GPU_OVERHEAD`
  * 变量值: `1073741824`(注意不要加引号)

#### 示例 4: Docker 容器化部署(K8s / 容器显存配额保护)

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_GPU_OVERHEAD=536870912 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、避坑指南(高级研究员关键提醒)

#### 1. 警惕"显存下溢(Underflow)导致强制退回 CPU"陷阱

社区中很多新手遇到过这个问题: 配置该变量后, 模型突然变成 100% 跑在 CPU 上, 推理奇慢无比!

* 原因: 如果你的显卡总共只有 8GB, 开机后系统桌面和软件已经用掉了 5GB, 当前显卡实测只剩 3GB 自由空间.
* 此时如果你把 `OLLAMA_GPU_OVERHEAD` 设为了 4GB(`4294967296`), 调度器算式就会变成:

  $$\text{规划可用} = 3\text{GB} - 4\text{GB} \le 0$$

* 调度器发现显存为"0 或负数", 就会放弃向 GPU 装载任何模型层, 静默将模型全量退回系统内存与 CPU 运行!
* 对策: 设置预留值时, 必须确保它显著小于显卡的日常空闲显存.

#### 2. 区分两个相似的预留变量

* `OLLAMA_GPU_OVERHEAD`(顶层宏观调度, 单位: Bytes):
  控制 Ollama 的 Go 语言调度器在决策"把模型切几层给 GPU"时的预留防线.
* `LLAMA_ARG_FIT_TARGET`(底层微观分配, 单位: MiB):
  底层 `llama.cpp` 计算引擎在真正执行 C++ 内存分配(Memory Arena/Tiling)时的防线.
* 日常使用中, 优先调整 `OLLAMA_GPU_OVERHEAD` 即可解决绝大多数显存防打满与多任务避让需求.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_CONTEXT_LENGTH:0
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的运行日志中, `OLLAMA_CONTEXT_LENGTH:0` 是一个控制服务全局上下文窗口(Context Window Size)默认大小的关键环境变量.

作为 Ollama 长期演进中最重要的用户体验改进之一, 它的引入彻底改变了之前"每个模型都要写 Modelfile 强行修改 `num_ctx`"的繁琐局面.

---

### 一、核心含义解析

1. 命名与作用:
   * `OLLAMA_CONTEXT_LENGTH`: 指定 Ollama 服务端全局生效的上下文长度(以 Token 数量为单位).
   * 它决定了模型单次能接收并记忆的"提示词 + 历史多轮对话 + 模型输出"的最大 Token 阈值.
2. 日志中显示 `:0` 的具体含义:
   * 在 Ollama 内部配置模块(`envconfig`)中, `0` 是未显式赋值的占位符/缺省标记(Default/Unset).
   * 当其为 `0` 时, 说明你没有在宿主机上对该变量进行主动覆写.
   * 此时 Ollama 会启用其内置的自适应规则分配上下文(依据显存阶梯自动适配, 常见规则如下):
     * 显存 < 24 GiB: 默认使用 4096(4K)Token;
     * 显存 24 ~ 48 GiB: 自动放宽至 32768(32K)Token;
     * 显存 $\ge$ 48 GiB: 自动开放至 262144(256K)Token;
     * (若为特定轻量模型, 则回退为该模型 Modelfile 约定的默认值, 通常为 4096).

---

### 二、为什么需要该变量? (核心使用场景)

长期以来, 像 Llama 3.1/3.3、Qwen 2.5、DeepSeek 等开源大模型原生已支持 32K 乃至 128K 上下文, 但用户在 Ollama 中直接调用时, 经常发现长文本被悄悄截断(Silent Truncation)或报错.

这是因为很多第三方客户端(如 Open WebUI、Cursor、Continue、LangChain 等)在调用 Ollama API 时, 并没有显式在请求体里携带 `num_ctx` 参数, 此时 Ollama 会将其限制在 4096 截断. 该变量在以下场景至关重要:

1. 全局解锁大模型长文本能力(RAG / Agent / 代码库分析):
   * 在使用 AI 编程助手阅读大型项目代码、或进行百页 PDF 深度文档问答时, 4096 Token 往往一次对话就超标了. 通过设置 `OLLAMA_CONTEXT_LENGTH=64000` 或 `32768`, 可以在服务端直接将所有拉取运行的模型上下文扩大, 无需反复构建自定义镜像.
2. 多租户 / 统一对外推理 API 服务规范化:
   * 当使用 Ollama 搭建团队共享的 LLM 网关时, 统一在服务端将全局上下文定在一个安全上限(例如 `16384`), 避免个别超长恶意请求耗光算力.
3. 显存受限设备的"防爆内存"控制:
   * 在 8GB / 12GB 显存的显卡上, 某些大模型如果默认加载 32K 上下文, 其 KV Cache 会霸占数 GB 显存, 导致模型主体被挤出显存、降级到 CPU 运行. 此时主动配置 `OLLAMA_CONTEXT_LENGTH=2048` 可以极度节省显存, 保证模型全层跑在 GPU 上.

---

### 三、Ollama 上下文配置的生效优先级(Hierarchy)

当一个推理请求发起时, Ollama 确定最终使用的 Context 长度遵循严格的就近原则(从高到低):

$$\text{1. API 单次请求传入的 } \mathbf{options.num\_ctx} \quad (\text{最高优先级})$$
$$\Downarrow$$
$$\text{2. 模型 Modelfile 中配置的 } \mathbf{PARAMETER\ num\_ctx}$$
$$\Downarrow$$
$$\text{3. 服务端环境变量 } \mathbf{OLLAMA\_CONTEXT\_LENGTH}$$
$$\Downarrow$$
$$\text{4. 系统根据 VRAM 自动评估的兜底值 } (\text{当 } OLLAMA\_CONTEXT\_LENGTH=0 \text{ 时})$$

---

### 四、具体配置与使用示例

#### 示例 1: Linux Systemd 守护进程部署(最常用生产方案)

1. 执行 systemd 配置编辑:

```bash
sudo systemctl edit ollama.service
```

2. 将全局上下文长度设为你期望的值(例如 32K = 32768, 或 64K = 64000):

```ini
[Service]
Environment="OLLAMA_CONTEXT_LENGTH=32768"
```

3. 重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

#### 示例 2: Linux / macOS 前台临时启动

```bash
# 设置为 16K 上下文
export OLLAMA_CONTEXT_LENGTH=16384

ollama serve
```

#### 示例 3: Windows 部署

* PowerShell 启动:

```powershell
$env:OLLAMA_CONTEXT_LENGTH="32768"
ollama serve
```

* 系统环境变量设置:
  在系统属性中添加环境变量 `OLLAMA_CONTEXT_LENGTH`, 值设为 `32768`, 重启桌面托盘中的 Ollama 即可.

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_CONTEXT_LENGTH=32768 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、进阶验证与显存避坑建议

#### 1. 如何确认配置真正生效?

不要只看 `ollama show`(它显示的是模型理论最大值而非运行时分配值). 在模型加载后, 直接运行:

```bash
ollama ps
```

查看输出结果中的 `CONTEXT` 列(较新版本 Ollama 提供了该列), 它会直接显示当前模型在显存中真实开辟的上下文长度:

```bash
NAME          ID              SIZE     PROCESSOR    CONTEXT    UNTIL
qwen2.5:14b   6e9f9c77f59     9.0 GB   100% GPU     32768      4 minutes from now
```

#### 2. 算力开销警示(KV Cache 显存暴涨)

大语言模型的 KV Cache(键值缓存)消耗的显存与 Context 长度成严格线性正比关系:

* 以 8B~14B 参数模型(GQA 架构)为例:
  * 4K 上下文: KV Cache 仅需约 500MB ~ 1GB 显存;
  * 32K 上下文: KV Cache 会膨胀到约 4GB ~ 6GB 显存;
  * 128K 上下文: KV Cache 会迅速消耗 16GB+ 显存.
* 避坑点: 如果你的显卡显存有限(如 16GB 卡), 盲目将 `OLLAMA_CONTEXT_LENGTH` 设为 `131072`, 会因为显存不足以容纳庞大的 KV Cache, 迫使 Ollama 把模型的权重层(Layers)大量卸载(Offload)到 CPU, 导致推理速度从几十 Tokens/s 断崖式暴跌到 1~2 Tokens/s. 务必在扩大上下文后通过 `ollama ps` 确认其仍然保持在 `100% GPU`!

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_CREATE_REMOTE:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的运行日志与环境变量表中, `OLLAMA_CREATE_REMOTE:false` 是一个专门控制 `ollama create`(根据 Modelfile 构建/导入模型)底层执行路径的高级控制开关.

---

### 一、核心含义解析

1. 官方定义:
   > "Force model creation through the server API even when the server is local."
   > (即使服务端运行在本地, 也强制通过服务端 HTTP API 来完成模型的创建)

2. 变量拆解:
   * `OLLAMA_CREATE`: 对应 CLI 命令 `ollama create <model-name> -f ./Modelfile`.
   * `REMOTE`: 远程模式(通过 REST API 流式传输).
   * 默认值 `false`: 日志中显示 `OLLAMA_CREATE_REMOTE:false`, 说明系统处于缺省的本地直连优先状态.

3. 底层工作机制(本地路径 vs 远程 API 路径):
   在 Ollama 源码(`cmd/cmd.go`)中, 当你执行 `ollama create` 构建模型时, CLI 客户端会判断执行策略:

```go
// 如果没有开启 CREATE_REMOTE, 并且检测到服务端是 localhost
if !envconfig.CreateRemote() && isLocalhost() {
    return createModel(...)       // 走[本地直接模式]
}
return createModelRemote(...)     // 走[远程 API 流式模式]
```

   * 当其为 `false`(默认)且访问本机时:
     Ollama CLI 会认为"客户端和服务端都在同一台机器", 为了追求最高速度, 它会绕过网络传输, 直接在本地磁盘上解析 GGUF 文件、切片数据, 并直接写入本地的模型存储目录(如 `~/.ollama/models/blobs`).
   * 当其被设为 `true` 时:
     Ollama CLI 会被强制剥夺本地直接读写磁盘的特权, 哪怕它连接的是 `http://127.0.0.1:11434`, 也必须老老实实通过 HTTP `POST /api/create` 将 Modelfile 和模型权重分块上传给服务端.

---

### 二、核心使用场景与痛点

既然本地直接操作磁盘速度更快, 为什么还需要提供这个开关? 主要为了解决以下 3 类特殊部署架构中的痛点:

#### 场景 1: 容器化部署与宿主机 CLI 的"伪本地"冲突(最常见痛点)

* 背景: 你把 Ollama 服务端部署在 Docker 容器内, 映射了端口 `-p 11434:11434`; 但你在宿主机(物理机)的终端中安装了 `ollama` CLI 工具.
* 冲突: 你在宿主机执行 `ollama create` 时, CLI 检查目标地址是 `127.0.0.1:11434`, 误以为服务端与自己在同一个文件系统下, 于是尝试在宿主机的 `/root/.ollama` 或 `/usr/share/ollama` 下直接写文件. 但服务端的实际环境和存储卷是在 Docker 容器内! 这会导致模型创建看似完成, 容器内的服务却根本找不到模型, 或直接报文件路径不存在.
* 解决: 在宿主机配置 `OLLAMA_CREATE_REMOTE=true`, 强迫客户端把数据通过 HTTP API 传入容器内部.

#### 场景 2: Linux 生产环境的权限隔离(Permission Denied)

* 背景: 在标准 Linux 安装中, Ollama 服务端是以系统独立用户 `ollama:ollama` 身份运行的, 其模型库位于 `/usr/share/ollama/.ollama/models`, 普通用户无权写入.
* 冲突: 当开发人员以普通用户身份(如 `ubuntu`)在终端执行 `ollama create` 时, 本地直接模式会因尝试直写 `/usr/share/ollama/...` 而报 `permission denied` 错误.
* 解决: 普通用户导出 `OLLAMA_CREATE_REMOTE=true`, 创建请求就会作为标准 API 请求发给具备写入权限的后台 `ollama` 守护进程, 由服务端代理落盘.

#### 场景 3: API 客户端兼容性调试与 CI/CD 自动化流水线

* 背景: 开发者正在为 Ollama 开发第三方客户端(如基于 Python/Node.js/Go 的模型发布工具), 或者在单机 CI 环境测试 `/api/create` 接口的流式进度条与校验机制.
* 解决: 在本地单机测试时开启此变量, 可以 100% 模拟真实跨机器网络调用的 API 流式响应行为, 而无需额外搭建第二台服务器.

---

### 三、具体配置与使用示例

#### 示例 1: 宿主机向本地 Docker 容器内的 Ollama 创建模型

假设你用 Docker 启动了服务:

```bash
docker run -d -p 11434:11434 -v ollama_data:/root/.ollama --name ollama ollama/ollama
```

在宿主机准备好了一个从 HuggingFace 下载的 GGUF 文件和 Modelfile:

```dockerfile
# Modelfile
FROM ./my-custom-qwen.gguf
PARAMETER temperature 0.7
```

如果在宿主机直接运行 `ollama create` 会报错. 此时在当前终端执行:

```bash
# 1. 强制走 HTTP API 流式上传
export OLLAMA_CREATE_REMOTE=true

# 2. 正常发起创建命令
ollama create my-custom-model -f ./Modelfile
```

执行过程中的变化: 你会看到终端开始显示网络层面的分块上传进度条(`uploading ... 100%`), 权重被完整推送进 Docker 容器内部.

---

#### 示例 2: 普通用户解决 Linux 服务端权限冲突

在多用户服务器上, 普通开发者没有系统目录写权限:

```bash
# 临时声明变量并单次执行
OLLAMA_CREATE_REMOTE=true ollama create private-llama -f ./Modelfile
```

此时模型将由系统后台具备合法权限的 `ollama` 服务进程创建, 普通用户不需要 `sudo` 也能成功构建模型.

---

#### 示例 3: 写入个人 Shell 配置文件(长期生效)

如果你经常在本地开发连接容器化或沙盒内的 Ollama:

* Linux / macOS(Bash 或 Zsh):

  在 `~/.bashrc` 或 `~/.zshrc` 中追加:

```bash
export OLLAMA_CREATE_REMOTE=true
```

* Windows(PowerShell):

```powershell
$env:OLLAMA_CREATE_REMOTE="true"
ollama create my-model -f .\Modelfile
```

---

### 四、总结与日常建议

| 状态          | 适用场景                                                                                       | 性能与行为                                                  |
| :------------ | :--------------------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| `false`(默认) | Ollama 客户端与服务端均原生安装在同一操作系统, 且使用同权限账户.                               | 速度极快(零网络拷贝, 直接在本地磁盘建立硬链接或移动 blob).  |
| `true`        | 1. 容器化/沙盒化部署环境; <br> 2. 解决多用户系统权限拒绝; <br> 3. 调试 `/api/create` 流式接口. | 网络流式上传(有轻微序列化与 HTTP 数据拷贝开销, 但隔离性好). |

> 研究员建议:
> 日志中的 `OLLAMA_CREATE_REMOTE:false` 只是 Ollama 打印出来的配置项当前快照. 如果你没有使用 Modelfile 从本地构建定制模型, 或者是在纯物理机环境下常规使用 `ollama pull` / `ollama run`, 保持其默认的 `false` 即可, 无需刻意修改.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_DEBUG:DEBUG
OLLAMA_DEBUG_LOG_REQUESTS:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的运行日志快照中, `OLLAMA_DEBUG:DEBUG` 与 `OLLAMA_DEBUG_LOG_REQUESTS:false` 属于 Ollama 的两级可观测性与排障调试体系.

很多开发者误以为"开启 Debug 就能看到客户端发来的具体提示词", 但 Ollama 在架构设计上严格区分了"系统运行时诊断"与"请求数据载荷审计".

---

### 一、核心含义解析

#### 1. `OLLAMA_DEBUG:DEBUG`(运行时诊断日志级别)

* 核心含义: 控制 Ollama 服务进程的全局日志详细程度(Log Verbosity).
* 运行状态:
  * 默认状态下为 `INFO`.
  * 你的日志显示 `OLLAMA_DEBUG:DEBUG`(通常由传入 `OLLAMA_DEBUG=1` 或 `OLLAMA_DEBUG=DEBUG` 触发), 说明服务已处于高详细度调试模式.
* 输出内容: 它会巨细靡遗地输出引擎底层的调度与硬件状态, 但不包含用户的具体输入内容:
  1. GPU 硬件拓扑与探测: 显卡型号、VRAM 容量、Compute Capability、PCI ID、CUDA/ROCm/Vulkan 驱动版本.
  2. 模型分层装载决策(Offload Planning): 模型共有多少层、具体将多少层放进了 GPU、多少层留在了 CPU 内存、KV Cache 占用了多少显存.
  3. 计算后端调用链: 启动底层 `ollama_llama_server` 子进程时传递的具体参数与动态链接库路径.

#### 2. `OLLAMA_DEBUG_LOG_REQUESTS:false`(请求报文与重放日志开关)

* 核心含义: 是否将客户端发送的完整推理请求 Body(含 Prompt、对话历史、Agent 工具定义等)持久化保存到临时目录, 并生成可重现的 `curl` 调试脚本.
* 运行状态:
  * 默认值为 `false`(即你日志中看到的关闭状态).
* 隐私安全隔离设计:
  * 即使开启了 `OLLAMA_DEBUG=1`, Ollama 也绝对不会在终端或标准输出中打印用户的提示词. 这是为了防止多租户场景下系统管理员在监控日志时泄露敏感商业数据或聊天隐私.
  * 只有显式将 `OLLAMA_DEBUG_LOG_REQUESTS` 设为 `true` / `1` 时, 它才会把用户发来的每一条推理请求落盘审计.

---

### 二、核心使用场景

| 调试目标              | 应该开启哪个变量?                | 典型场景                                                                                                              |
| :-------------------- | :------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| 显存与硬件排障        | `OLLAMA_DEBUG=1`                 | 显卡无法识别、模型莫名其妙回退到 CPU 慢速运行、推理时突然 OOM 崩溃、多卡显存分配不均.                                 |
| Agent / 工具调用排障  | `OLLAMA_DEBUG_LOG_REQUESTS=1`    | 上层框架(如 LangChain、Cursor、Open WebUI)调用 Ollama 函数调用(Tool Calling)失败, 需要抓取上游到底传了什么 JSON 数据. |
| Prompt 格式与模板复现 | `OLLAMA_DEBUG_LOG_REQUESTS=1`    | 怀疑 Chat 模板拼接错误(多余空格/特殊 Token 缺失导致模型胡言乱语), 需要导出纯净的 `curl` 脚本进行单步排查.             |
| 生产环境标准部署      | 两者均保持默认(`INFO` / `false`) | 节省磁盘空间、减少日志 I/O 开销、满足数据隐私与合规安全(防止 Prompt 落地泄露).                                        |

---

### 三、具体配置与使用示例

#### 示例 1: 临时启动"全景排障模式"(同时抓取底层调度与请求 Payload)

```bash
# 1. 开启详细诊断日志
export OLLAMA_DEBUG=1

# 2. 开启请求体落盘(抓取 Prompt 与 Curl 重放脚本)
export OLLAMA_DEBUG_LOG_REQUESTS=1

# 3. 启动服务
ollama serve
```

##### 此时观察发生了什么?

1. 终端控制台会实时打印出模型的装载图、GPU 显存预算(Memory Budget)、KV Cache 显存占用等底层技术细节.
2. 当你在外部通过客户端发起一次对话时, Ollama 会在操作系统的临时目录(Linux/macOS 为 `/tmp/`, Windows 为 `%TEMP%`)生成一对落盘文件:
   * `ollama-request-logs-<timestamp>-request.json`: 记录包含 System Prompt、Context 在内的完整 JSON 原始请求体.
   * `ollama-request-logs-<timestamp>-replay.sh`: 自动封装好的一段 `curl` 命令!

3. 如何利用落盘文件单步调试?
   开发人员可以直接在终端执行生成的脚本:

```bash
bash /tmp/ollama-request-logs-xxxx-replay.sh
```

无需依赖前端应用, 就能以完全相同的载荷 1:1 复现 Bug.

---

#### 示例 2: Linux 生产环境(systemd 守护进程排查 GPU 故障)

如果是在服务器上排查"为什么 RTX 4090 只吃了一半显存", 仅开启 `OLLAMA_DEBUG` 即可, 切勿长开 `OLLAMA_DEBUG_LOG_REQUESTS`:

1. 编辑系统服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入配置:

```ini
[Service]
Environment="OLLAMA_DEBUG=1"
# 请求落盘在排查完后一定要确保是 false, 防止打满系统 /tmp 空间或泄密
Environment="OLLAMA_DEBUG_LOG_REQUESTS=false"
```

3. 重启并追踪日志:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
journalctl -u ollama.service -f
```

---

#### 示例 3: Docker 容器环境抓取请求体调试

调试容器内的 Agent 对话时, 建议挂载宿主机的临时目录以方便直接查看抓包结果:

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_DEBUG=1 \
  -e OLLAMA_DEBUG_LOG_REQUESTS=1 \
  -v /tmp/ollama-debug:/tmp \
  -p 11434:11434 \
  --name ollama-debug \
  ollama/ollama
```

调用接口后, 直接在宿主机的 `/tmp/ollama-debug/` 目录下即可看到所有请求的 JSON 和重放脚本.

---

### 四、避坑与安全合规警示(Security & Privacy)

1. 磁盘空间耗尽风险(Disk Exhaustion):
   * `OLLAMA_DEBUG_LOG_REQUESTS` 会为每一次 API 调用写入独立文件, 且默认不会自动轮转(Log Rotate)或自动清理.
   * 如果在有高并发请求的生产服务器上忘记关闭该开关, `/tmp` 目录会在极短时间内被海量 Prompt 文件占满, 导致操作系统根分区爆满死机.
2. 合规性风险(GDPR / 数据泄露):
   * 大模型交互往往包含用户输入的代码、企业知识库检索内容(RAG 文档)、甚至个人身份信息(PII). 开启此开关意味着敏感数据以明文形式留存在临时磁盘上, 完成调试后务必重置为 `false` 并物理清理生成的临时文件.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_EDITOR:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的运行日志中, `OLLAMA_EDITOR:` 是一个面向交互式终端交互体验(CLI REPL)的辅助环境变量.

虽然你在部署 `ollama serve` 时看到了它, 但它实际上属于客户端(`ollama run`)的高级功能配置.

---

### 一、核心含义解析

1. 官方定义:
   > "Path to editor for interactive prompt editing (Ctrl+G)"
   > (用于在终端交互模式下按 `Ctrl+G` 呼出外部文本编辑器编写 Prompt 的编辑器路径)

2. 为什么需要它?:
   在终端中使用 `ollama run <model>` 进行即时问答时, 如果在命令行里输入长文本、系统设定(System Prompt)、多行代码块或者 Markdown 表格, 终端自带的行编辑体验非常糟糕(换行容易意外触发提交、光标移动困难、粘贴格式易错位).
   为了解决这个问题, Ollama 内置了类似 Git / Bash 的外部编辑器挂载功能: 在对话界面按下快捷键 `Ctrl+G`, Ollama 会自动暂存当前输入, 并弹出一个完整的文本编辑器让你尽情编写.

3. 后备继承机制(Fallback Hierarchy):
   在 Ollama 源码(`cmd/interactive.go`)中, 调用编辑器的优先级如下:

   $$\mathbf{OLLAMA\_EDITOR} \;\longrightarrow\; \mathbf{\$VISUAL} \;\longrightarrow\; \mathbf{\$EDITOR} \;\longrightarrow\; \text{系统默认(Linux/macOS 下为 } \texttt{vi}\text{, Windows 下为 } \texttt{notepad}\text{)}$$

   * 日志中打印 `OLLAMA_EDITOR:` 且后无内容, 说明你未单独为 Ollama 设定专属编辑器, 系统将顺延回退去读取你系统的 `$EDITOR` 或默认的 `vi` / `notepad`.

---

### 二、核心使用场景

1. 编写复杂的多行提示词(Few-Shot / CoT 提示词设计):
   * 需要给大模型输入一个带有详细规范、几百行参考样本、特定 JSON Schema 的复杂提示词. 在终端里直接粘贴很容易乱码或截断, 调出 Vim、Nano 或 VS Code 能够从容编辑.
2. 多行代码审查与重构:
   * 让大模型分析一段代码时, 在文本编辑器中可以利用高亮、自动缩进和语法检查, 把代码调整整齐后再发给大模型.
3. 与系统默认编辑器解耦:
   * 你系统的全局 `$EDITOR` 可能是 `vim`(平时用来写 Git Commit), 但你可能希望给 Ollama 配一个更直观的 GUI 编辑器(如 `code --wait`)或者更轻量的 `nano`, 此时单独设置 `OLLAMA_EDITOR` 可以互不干扰.

---

### 三、具体配置与使用示例

#### 示例 1: 配置轻量级终端编辑器(Nano / Neovim)

* Linux / macOS(Bash 或 Zsh):

```bash
# 使用 nano 作为编辑器
export OLLAMA_EDITOR=nano

# 或者使用更现代的 neovim
export OLLAMA_EDITOR=nvim
```

  如果你希望长期生效, 将其写入 `~/.bashrc` 或 `~/.zshrc` 中即可.

* 实操体验流程:
  1. 启动模型对话:

```bash
ollama run qwen2.5:7b
```

  2. 在 `>>> ` 提示符下, 按下键盘上的 `Ctrl` + `G`.
  3. 终端会瞬间切入 `nano` 或 `nvim` 界面, 并打开一个临时的 `ollama-prompt-xxx.txt` 文件.
  4. 随心所欲地输入多行内容、换行、贴大段代码.
  5. 保存并退出编辑器(如 nano 中按 `Ctrl+O` 再 `Ctrl+X`, 或 vim 中输入 `:wq`).
  6. 终端自动切回 Ollama 交互界面, 刚才在编辑器里写好的文字已经整整齐齐地呈现在输入框中, 按下 `Enter` 即可一次性发送给模型!

---

#### 示例 2: 配置现代 GUI 图形编辑器(VS Code / Sublime Text)

如果你更习惯使用图形界面编写 Prompt, 完全可以配置 VS Code!

> 关键提醒: 必须加上 `--wait`(等待)参数, 否则编辑器主进程后台化后, Ollama 会以为你已经"退出保存"了, 导致读入空文本.
>

* macOS / Linux:

```bash
export OLLAMA_EDITOR="code --wait"
```

* Windows(PowerShell):

```powershell
$env:OLLAMA_EDITOR="code --wait"
```

按下 `Ctrl+G` 后, 系统会自动拉起一个新的 VS Code 标签页供你自由编辑; 当你把该标签页保存并点击 `X` 关闭时, 文本立刻被回调给 Ollama 客户端.

---

#### 示例 3: Windows 本地配置 Notepad++ 或记事本

在 Windows 下, 若希望使用 Notepad++ 编辑:

```powershell
$env:OLLAMA_EDITOR="notepad++.exe -multiInst -notabbar -nosession"
```

或者指定绝对路径:

```powershell
$env:OLLAMA_EDITOR="C:\Program Files\Notepad++\notepad++.exe"
```

---

### 四、总结与避坑指南

1. 为什么在 `ollama serve`(服务端)日志里也能看到它?
   * Ollama 源码中设计了一个统一的 `envconfig` 配置注册表.
   * 当后台守护进程 `ollama serve` 启动时, 它会自动 dump 出当前所有它所关心的环境变量键值清单(包括网络、显卡、日志以及 CLI 客户端交互配置)以便运维排障.
2. 生产服务器不需要理会该变量:
   * 如果该机器是一台仅通过 HTTP API 对外提供推理服务的远程算力机(平时只通过 Open WebUI、API 或 Python 客户端调用), 这个变量完全处于空闲状态, 日志里留空是完全正常的, 无需做任何配置.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_FLASH_ATTENTION:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在现代大语言模型(LLM)的底层加速技术中, `OLLAMA_FLASH_ATTENTION:false` 是一个对推理吞吐量(尤其是长文本首字延迟 TTFT)和显存占用有决定性影响的性能开关.

当你看到该变量为 `false` 时, 意味着你的 Ollama 服务目前正在使用传统的标准自注意力(Standard Attention)机制, 尚未激活硬件级的 FlashAttention(闪速注意力) 加速.

---

### 一、核心含义与底层算法原理

#### 1. 变量映射

* `OLLAMA_FLASH_ATTENTION`: 对应底层推理引擎(llama.cpp)启动参数中的 `-fa` / `--flash-attn`.
* 默认值 `false`: 日志中显示 `false`, 说明 FlashAttention 处于关闭状态.

#### 2. 底层原理: 标准 Attention vs FlashAttention

* 传统标准 Attention(内存墙瓶颈):
  * 计算公式为: $\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$.
  * 在计算过程中, 系统必须在 GPU 显存(HBM)中完整具象化出一个巨大的中间矩阵 $S = QK^T$ 以及概率矩阵 $P = \text{softmax}(S)$, 其显存与读写复杂度为 $O(N^2)$($N$ 为上下文 Token 数量).
  * 随着上下文长度增长(如达到 8K、32K、128K), GPU 算力尚未跑满, 显存带宽(Memory Bandwidth)却已经被频繁的 HBM 读写彻底卡死(Memory-bound).
* FlashAttention(IO 感知分块计算):
  * 由 Tri Dao 等人提出, 它利用 GPU 片上极高速但容量较小的静态共享内存(SRAM), 引入平铺分块(Tiling)与在线 Softmax(Online Softmax) 技巧.
  * 它永远不会在显存(HBM)中实例化完整的 $N \times N$ 注意力大矩阵, 而是分块在 SRAM 内部完成算子融合并就地累加输出.
  * 结果: 显存读写次数减少一个数量级, 中间激活显存大幅下降.

---

### 二、为什么 Ollama 默认保持 `false`?

既然 FlashAttention 性能优异, 官方为何不直接默认全局开启?

1. 老旧硬件兼容性:
   * FlashAttention 对 GPU 硬件微架构有硬性要求.
   * NVIDIA 平台需要至少 Turing 架构及以上(如 RTX 20xx、RTX 30xx、RTX 40xx、A100、H100 等).
   * 如果用户在老旧显卡(如 Pascal 架构的 GTX 1080Ti、Tesla P40)或老旧 CPU 指令集上强行开启, 会导致计算精度异常(模型输出乱码胡言乱语)甚至直接引发 CUDA 算子崩溃.
2. 量化与算子匹配:
   * 在早期的 llama.cpp 实现中, 某些非主流的 GGUF 量化格式(如老版 IQ 量化格式)对 FlashAttention 算子的支持不够稳定. 为了保证对"万千用户不同老电脑"的最大开箱即用稳定性, Ollama 采取了保守策略, 默认关闭.

---

### 三、开启该变量的核心收益与使用场景

将 `OLLAMA_FLASH_ATTENTION` 设为 `true` / `1`, 在以下场景能带来质的飞跃:

| 核心指标                  | 关闭 (`false`)                    | 开启 (`true` / `1`)            | 实际体验收益                                     |
| :------------------------ | :-------------------------------- | :----------------------------- | :----------------------------------------------- |
| 首字时间 (TTFT / Prefill) | 随 Context 呈二次方激增(很慢)     | 接近线性增长(极快)             | 输入百页长文档时, 模型"思考"准备时间缩短 2~5 倍. |
| 长文本峰值显存占用        | 极其庞大, 长文本易直接 OOM 爆显存 | 极低(不落地中间中间矩阵)       | 允许用更小的显存塞下更大的 Context(如 32K~64K).  |
| 整体显卡温度与功耗        | 显存控制器持续高负荷搬运数据      | 算子融合就地计算, 带宽效率极高 | 显存读写压力显著降低, 整体能效比提升.            |

#### 典型受益场景:

1. 长文档 RAG 知识库检索: 检索返回的大段上下文字符数高达几万 Token, 开启后能秒级响应.
2. AI 代码审查与大仓库重构: 一次性把几个完整的源码文件塞给大模型(如 Qwen2.5-Coder、DeepSeek-Coder).
3. 复杂多轮 Agent 工作流: 长对话累积后, 普通 Attention 会越聊越慢, FlashAttention 能保持交互流畅.

---

### 四、具体配置与使用示例

#### 步骤 1: 确认你的硬件是否支持

* NVIDIA GPU: RTX 20 系列及以后、GTX 16 系列及以后、A10/A30/A100/H100 等(Compute Capability $\ge$ 7.0).
* Apple Silicon: M1/M2/M3/M4 系列 Mac(Metal 框架原生良好支持).
* AMD GPU: RDNA3 架构(RX 7000 系列及以上)或 CDNA(MI200/MI300 系列).

---

#### 步骤 2: 在不同环境下开启 FlashAttention

##### 示例 1: Linux 生产系统服务(systemd 守护进程部署)

这是长期运行生产环境最标准的开启方式:

1. 编辑系统服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启变量(与扩大上下文配合使用体验最佳):

```ini
[Service]
# 开启 FlashAttention
Environment="OLLAMA_FLASH_ATTENTION=1"

# 顺带把全局上下文扩大(例如开到 32K)
Environment="OLLAMA_CONTEXT_LENGTH=32768"
```

3. 重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 示例 2: Linux / macOS 终端临时启动测试

```bash
# 声明变量(1 或 true 均可识别)
export OLLAMA_FLASH_ATTENTION=1

# 启动服务
ollama serve
```

##### 示例 3: Windows 部署

* PowerShell 启动:

```powershell
$env:OLLAMA_FLASH_ATTENTION="1"
ollama serve
```

* 系统永久配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_FLASH_ATTENTION`
  * 变量值: `1`
  保存后彻底重启 Ollama 任务栏托盘程序.

##### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_FLASH_ATTENTION=1 \
  -e OLLAMA_CONTEXT_LENGTH=32768 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、进阶验证与避坑指南

#### 1. 如何确认它真正生效了?

在启动 Ollama 服务并运行模型时, 查看输出日志:

```bash
journalctl -u ollama.service -f
# 或者前台观察输出
```

当模型加载并处理提示词时, 日志中底层 runner 打印的运行参数会明确出现:

> `flash_attn = 1` 或 `flash attention enabled`
>

#### 2. 短文本 vs 长文本的体验差异

* 如果你的提示词(Prompt)只有一句话(< 500 Token), 开启与关闭 FlashAttention 几乎体感不到区别(短文本下标准 Attention 本来就极快).
* 它的收益具有非线性放大特性: 当输入 Prompt 超过 2048、4096、8192... 个 Token 时, 速度差距会从 10% 迅速扩大到 200% ~ 400%.

> 研究员建议:
> 只要你的机器使用的是现代主流显卡(RTX 30xx/40xx、Apple Silicon 或近两代 AMD 卡), 强烈建议将 `OLLAMA_FLASH_ATTENTION=1` 作为服务器的标配基线配置开启! 它几乎是一项"免费"的大幅性能升级.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_GO_TEMPLATE:true
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 架构中, `OLLAMA_GO_TEMPLATE:true` 是一个控制对话提示词模板渲染引擎(Chat Template Engine)优先权的核心环境变量.

大语言模型原生使用 Hugging Face 的 Jinja2 模板, 而早期 Ollama 基于 Go 语言自建了 Go `text/template` 规范. 这一变量决定了底层到底走哪套渲染机制.

---

### 一、核心含义解析

1. 官方定义:
   > "Enable Modelfile TEMPLATE based rendering when available"
   > (当模型具备 Modelfile 时, 优先启用基于 Go 语言的 `TEMPLATE` 语法进行渲染)

2. 两套模板引擎的冲突与博弈:
   * GGUF 内置的原生 Jinja2 模板:
     现代开源模型(如 Llama 3、Qwen 2.5、DeepSeek 等)在转为 GGUF 格式时, 元数据里都内置了官方的 `tokenizer.chat_template`(Jinja2 语法). 它由底层 `llama-server` 引擎的原生解释器解析.
   * Ollama 自定义的 Go Template 模板:
     Ollama 历史上一贯在 `Modelfile` 中使用 Go 语言自带的 `text/template` 语法(即形如 `{{ if .System }}...{{ .Prompt }}...{{ .Response }}`).

3. `true` 状态下的行为逻辑:
   * 日志中显示 `OLLAMA_GO_TEMPLATE:true`, 说明当前服务处于"Modelfile 模板优先"模式:
     * 如果为 `true`(当前状态): 当你在本地使用 `ollama create` 编写了 Modelfile 并定制了 `TEMPLATE`, 或者模型带有官方转换好的 Go 模板时, Ollama 会强制在 Go 服务端解析该模板并生成 Prompt, 再传给底层推理.
     * 如果为 `false`: Ollama 会绕过 Go 模板, 直接把对话历史(Messages 数组)下发给底层 `llama-server`, 强制使用 GGUF 模型元数据自带的原生 Jinja2 模板进行渲染.

---

### 二、核心使用场景

为什么要提供这个切换开关? 在实际的提示词工程与模型微调部署中, 以下 3 个场景至关重要:

#### 场景 1: 在 Modelfile 中强行关闭或开启"思考模式"(Thinking Blocks)

* 背景: 现在很多推理模型(如 DeepSeek-R1、Qwen-Thinking 等)在输出时会默认包裹 `<think>...</think>` 思维链.
* 痛点: 若开发者通过自定义 Modelfile 修改模板试图关闭或固定思考前缀, 如果系统默认走 GGUF 内部的 Jinja2 模板, 你写的 Modelfile `TEMPLATE` 会被直接忽略, 模型依然会"私自思考".
* 解决: 保持 `OLLAMA_GO_TEMPLATE=true`, Ollama 才会真正尊重你在 Modelfile 里定制的 Go 语法模板, 确保你对思维链的拦截生效.

#### 场景 2: 解决 HuggingFace 第三方 GGUF 导入时的"模板丢失或错位"

* 背景: 从 Hugging Face(`hf.co/...`)直接运行社区未清洗的 GGUF 镜像时, 部分量化模型内嵌的 Jinja 模板编写不规范(或者缺乏多轮历史裁剪), 导致多轮对话出现重复输出或死循环.
* 解决:
  * 若社区的 GGUF Jinja 模板有问题, 可写一个 clean 的 Go `TEMPLATE` 并设 `OLLAMA_GO_TEMPLATE=true` 覆盖;
  * 反之, 若官方镜像转换的 Go 模板漏掉了复杂的工具调用(Tool Calling), 可设为 `OLLAMA_GO_TEMPLATE=false` 强制回退使用 GGUF 最原汁原味的 Jinja 模板.

#### 场景 3: 结构化输出(JSON Schema)顺序控制

* 背景: 当通过 `/api/chat` 请求强制输出特定 JSON Schema(`format`)时:
  * 在 Go 模板路径下, JSON Schema 的 Key 声明顺序会被如实提交给底层;
  * 在 Native Jinja 路径下, 部分版本会经历 Map 解析导致 Key 按字母顺序被二次重排.
* 解决: 依赖严格 Key 生成顺序的下游系统, 可以通过该变量锁定走 Go 模板路径.

---

### 三、具体配置与使用示例

#### 示例 1: 通过自定义 Modelfile 修改模板并确保生效

假设你想部署一个用于客服的定制模型, 并在 System Prompt 后面强行插入特殊的终止符:

1. 编写定制 `Modelfile`:

```dockerfile
FROM qwen2.5:7b

# 使用 Go Template 语法自定义对话模板
TEMPLATE """
{{- if .System }}<|im_start|>system
{{ .System }}<|im_end|>
{{- end }}
{{- range .Messages }}
<|im_start|>{{ .Role }}
{{ .Content }}<|im_end|>
{{- end }}
<|im_start|>assistant
"""

```

2. 构建模型:

```bash
ollama create my-custom-qwen -f ./Modelfile
```

3. 确保服务端开启 Go Template 优先:

```bash
# 显式声明开启(默认即为 true, 但显式声明能防止版本回退)
export OLLAMA_GO_TEMPLATE=true
ollama serve
```

   此时调用 `my-custom-qwen`, Ollama 会严格按照你编写的这套模板执行分块封装.

---

#### 示例 2: 切换为使用 GGUF 内置原生 Jinja2 模板(排查模板 Bug)

如果发现某个官方镜像的工具调用(Tool Calling)失效, 怀疑是 Ollama 的 Go 模板转换不完整, 想要让模型运行原厂的 Jinja2 逻辑:

* Linux 临时启动:

```bash
# 关闭 Go 模板优先, 强制使用 GGUF 内置的原生 Jinja 模板
export OLLAMA_GO_TEMPLATE=false
ollama serve
```

* Systemd 生产服务配置:

```bash
sudo systemctl edit ollama.service
```

  填入:

```ini
[Service]
Environment="OLLAMA_GO_TEMPLATE=false"
```

  重启服务生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

### 四、进阶验证: 如何查看当前生效的到底是什么模板?

你可以直接通过 Ollama 的 HTTP 端点检查当前载入的模板:

```bash
curl http://localhost:11434/api/show -d '{"name": "qwen2.5:7b"}'
```

* 查看返回 JSON 中的 `template` 字段:
  * 如果开头是 `{{- if .System }}` 这种带有点号(`.`)的语法, 说明当前生效的是 Go 模板;
  * 如果开头是 `{%- if tools %}` 或 `{% for message in messages %}`, 说明当前生效的是 Jinja2 模板.

---

### 五、总结与日常建议

| 设定值           | 核心行为                                              | 适用场景                                                                                  |
| :--------------- | :---------------------------------------------------- | :---------------------------------------------------------------------------------------- |
| `true`(当前状态) | 优先遵循你在 `Modelfile` 中定义的 `TEMPLATE`.         | 需要修改 Prompt 结构、截断/定制 `<think>` 思维链、编写个性化角色模板.                     |
| `false`          | 绕过 Modelfile, 强制使用 GGUF 内嵌的原厂 Jinja2 模板. | 需要最原汁原味的模型自带逻辑, 或者当 Go 模板转换出现严重语法/工具调用 Bug 时作为救急回退. |

> 研究员建议:
> 日志中的 `OLLAMA_GO_TEMPLATE:true` 证明你的服务正在尊重本地 Modelfile 的规则. 在绝大多数本地开发与自建模型场景下, 保持 `true` 是最符合直觉的做法, 只有当你遇到复杂的原厂 Jinja2 特殊语法未被正常解析时, 才需要考虑临时将其置为 `false`.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_HOST:http://0.0.0.0:11434
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在本地部署大语言模型服务时, `OLLAMA_HOST:http://0.0.0.0:11434` 是使用频次最高、最核心的网络绑定与通信路由环境变量.

它在架构设计上具有"双重身份": 它既能作为服务端(Server)决定在哪个网卡和端口监听流量, 也能作为客户端(Client CLI)决定去连接哪台机器上的 Ollama.

---

### 一、核心含义解析

#### 1. 拆解构成: `http://0.0.0.0:11434`

* 协议(`http://`): 指定 Ollama 原生提供的是标准的明文 HTTP/1.1 REST API 服务.
* 监听地址(`0.0.0.0`):
  * 默认情况: Ollama 默认绑定的是 `127.0.0.1`(本地环回地址 Loopback), 这意味着只有这台机器本身可以通过 `localhost` 访问模型, 局域网内的其他任何电脑、手机、Docker 容器均无法访问.
  * `0.0.0.0`(通配地址 / INADDR_ANY): 指示底层操作系统网络栈监听该机器上的所有物理及虚拟网络接口(包括本地回环 `127.0.0.1`、局域网内网 IP `192.168.x.x`、Docker 网桥 `172.17.x.x`、甚至公网 IP).
* 端口(`11434`): Ollama 官方约定的默认 TCP 端口.

#### 2. 服务端与客户端的双向语义

* 给 `ollama serve`(服务端)用: 指定监听的主机和端口.
* 给 `ollama run / pull / list`(客户端)用: 指定目标服务器的访问地址.

---

### 二、核心应用场景

#### 场景 1: 将本机变成局域网/团队内部的"私有大模型服务器"

* 需求: 你的工作站插了高性能 RTX 4090 显卡, 你希望办公室的同事、或你自己的笔记本电脑能够共享这台机器的算力.
* 作用: 绑定 `0.0.0.0:11434` 后, 局域网内的任何设备只需输入你的局域网 IP(如 `http://192.168.1.100:11434`), 即可在他们的应用(如 Cherry Studio、NextChat、Cursor)中直接调用模型.

#### 场景 2: 跨容器或前后端分离访问(如搭配 Open WebUI)

* 需求: 在很多部署架构中, Ollama 跑在宿主机(物理机)直接吃显卡, 而 Web 图形界面(如 Docker 运行的 Open WebUI)运行在容器内.
* 作用: 如果 Ollama 默认监听 `127.0.0.1`, Docker 容器因为网络命名空间隔离, 通过 `host.docker.internal` 访问宿主机也会被拒绝(Connection Refused). 只有改成 `0.0.0.0`, 容器内的流量才能穿透进来.

#### 场景 3: 客户端远程操作(Remote CLI)

* 需求: 算力机放在机房或机柜中(Headless 纯服务器模式), 你在轻薄本上写代码.
* 作用: 可以在轻薄本上设置 `OLLAMA_HOST` 指向机房机器, 在本地终端敲 `ollama run qwen2

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_IGPU_ENABLE:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在现代异构计算与本地推理调度体系中, `OLLAMA_IGPU_ENABLE:` 是一个专门控制是否允许集成显卡(核芯显卡 / APU)参与模型推理加速的核心特性开关.

从 Ollama v0.30+ 版本开始, 官方对设备枚举逻辑进行了收紧: 在默认状态下, Ollama 会主动探测并强制过滤(Drop)掉所有集成显卡.

---

### 一、核心含义解析

1. 命名与作用:
   * `iGPU`: Integrated GPU(集成显卡 / 核芯显卡 / APU), 如 AMD Radeon 780M / 890M, 以及 Intel UHD / Iris Xe / Arc 核显.
   * `ENABLE`: 开关控制.
   * 日志含义: 日志中显示 `OLLAMA_IGPU_ENABLE:` 且后面为空, 代表处于缺省状态(默认等同于 `false` 或 `0`).
2. 为什么在日志中经常伴随这段提示?
   如果你开启了详细日志(`OLLAMA_DEBUG=1`), 在包含核显的设备上经常会看到如下关键记录:
   > `dropping integrated GPU; to enable, set OLLAMA_IGPU_ENABLE=1`
   * 这表明 Ollama 已经正确识别到了这颗核显, 但根据默认安全策略, 选择主动放弃使用它, 并回退到纯 CPU 运行.

---

### 二、为什么 Ollama 官方默认要"屏蔽"核显?

很多用户会疑惑: 既然核显也是 GPU, 为什么官方要"多此一举"默认把它禁用? 这源于本地部署中的两大核心痛点:

#### 1. 避免双显卡笔记本/台式机的"反向优化(选错卡)"

* 现象: 很多游戏本或设计师电脑同时拥有"Intel/AMD 核显"和"NVIDIA 独显(如 RTX 4070)".
* 痛点: 核显共享系统内存(UMA), 通过 Vulkan API 探测时, 它经常会上报系统总内存(例如错误汇报拥有 32GB "显存"); 而独显可能只有 8GB 或 12GB 物理 VRAM.
* 灾难: Ollama 的调度器如果只按"谁报告的显存大就优先挑谁", 会误把孱弱的核显当成顶级显卡, 把模型加载进核显, 导致推理速度暴跌 5~10 倍, 原本强大的独显反而完全闲置!
* 对策: Ollama 决定默认封杀所有 iGPU, 确保只要有独显在, 就绝对走高速独显通道.

#### 2. 低端核显算力还不如纯 CPU

* 对于较老或规格较低的核显(如 Intel UHD 630、老款 Vega 核显), 由于执行单元(EU/CU)极少且缺乏专用指令集, 驱动层频繁进行数据拷贝的同步开销, 甚至比不上直接用现代多核 CPU(配合 AVX2 / AVX-512 指令集)跑推理快.

---

### 三、核心使用场景(何时必须强制开启?)

只要属于以下场景, 你就必须手动配置 `OLLAMA_IGPU_ENABLE=1`, 否则模型会被迫退回 CPU 造成极慢卡顿:

#### 场景 1: 无独显的高性能迷你主机(Mini PC)与掌机

* 适用硬件:
  * 搭载 AMD Ryzen 7000 / 8000 / AI 300 系列 APU 的迷你主机(如 Minisforum、Beelink 搭载的 Radeon 780M / 890M).
  * Windows 游戏掌机(如 ROG Ally、Legion Go、Steam Deck、GPD).
  * 搭载 Intel Core Ultra(Meteor Lake / Lunar Lake)的新款轻薄本.
* 效果: 这些现代核显算力相当强劲, 开启后利用 Vulkan 或 ROCm 加速, 通常能提供 20 ~ 40+ Tokens/s 的流畅推理; 若不开启被默认降回 CPU, 速度往往跌到 5 ~ 8 Tokens/s 且风扇狂暴啸叫.

#### 场景 2: All-in-One 家庭服务器 / NAS(Proxmox / LXC 虚拟化)

* 架构: 工控机或软路由上没有独立显卡, 但宿主机 CPU 自带核显.
* 效果: 把 `/dev/dri` 直通给 Ollama 容器, 配置该变量后即可让轻量级边缘推理直接吃满核显算力, 释放宝贵的 CPU 计算核心.

#### 场景 3: 利用超大共享内存跑大模型("穷人版大显存")

* 架构: AMD 迷你主机插了 64GB 或 96GB 内存.
* 效果: 在 BIOS 中把 UMA 显存调大, 或在 Linux 中配置 GTT 动态显存(`options amdgpu gttsize=...`). 通过强制开启该变量, 可以让核显利用几十 GB 的大内存完整装载 30B 级别大模型, 虽然速度不如独显, 但能突破显存瓶颈跑起来.

---

### 四、具体配置与使用示例

> 核心组合拳: 在 AMD 核显或迷你主机上, 该变量通常需要与 `OLLAMA_VULKAN=1`(或直接让 Vulkan 探测)协同开启, 体验最佳.
>

#### 示例 1: Linux 生产服务(针对迷你主机 / 软路由 systemd 部署)

1. 编辑系统单元服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启参数(以 AMD Radeon 780M / 890M 迷你主机为例):

```ini
[Service]
# 1. 强制解除对核显的屏蔽
Environment="OLLAMA_IGPU_ENABLE=1"

# 2. 建议显式开启 Vulkan 加速引擎(对 APU 兼容性与性能最好)
Environment="OLLAMA_VULKAN=1"
```

3. 重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux 终端临时命令行启动验证

```bash
# 激活集成显卡支持
export OLLAMA_IGPU_ENABLE=1
export OLLAMA_VULKAN=1

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地部署(ROG Ally 掌机 / 轻薄本)

* PowerShell 启动测试:

```powershell
$env:OLLAMA_IGPU_ENABLE="1"
$env:OLLAMA_VULKAN="1"
ollama serve
```

* 系统永久配置(彻底解决开机 CPU 慢速问题):
  1. 打开"环境变量"设置;
  2. 在"系统变量"中新建:
     * 变量名: `OLLAMA_IGPU_ENABLE`, 变量值: `1`
  3. 重启任务栏右下角的 Ollama 桌面托盘图标即可.

---

#### 示例 4: Docker / LXC 容器化穿透运行

```bash
docker run -d \
  --device /dev/dri \
  -e OLLAMA_IGPU_ENABLE=1 \
  -e OLLAMA_VULKAN=1 \
  -p 11434:11434 \
  --name ollama-apu \
  ollama/ollama
```

---

### 五、验证生效与避坑指南

#### 1. 如何确认它真正生效了?

运行一个模型后, 在终端敲击:

```bash
ollama ps
```

* 未生效(被过滤):

```bash
NAME          ID             SIZE     PROCESSOR
qwen2.5:7b    ...            4.7 GB   100% CPU   <-- 说明仍未用上核显
```

* 成功生效:

```bash
NAME          ID             SIZE     PROCESSOR
qwen2.5:7b    ...            4.7 GB   100% GPU   <-- 核显已被识别为 GPU 加速
```

#### 2. 双显卡用户(已有 RTX 独显)的特别警告

如果你的台式机或笔记本里已经有一张 NVIDIA RTX 独显, 绝对不要设置 `OLLAMA_IGPU_ENABLE=1`!
保持其日志中为空即可. 否则一旦开启, 系统极易混淆两张卡的优先级, 导致你的万元独显被核显抢占.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_KEEP_ALIVE:5m0s
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的模型生命周期与显存调度机制中, `OLLAMA_KEEP_ALIVE:5m0s` 是一个控制模型在处理完请求后, 在 GPU 显存或系统内存中"空闲保活停留时间"的全局核心变量.

日志中输出的 `5m0s` 是 Go 语言标准时间(`time.Duration`)的格式化表示, 代表系统的缺省保活倒计时为 5 分钟(5 minutes 0 seconds).

---

### 一、核心工作机制解析

大模型推理具有显著的"冷启动"成本: 从磁盘读取十几 GB 的模型权重、经由 PCIe 总线传输至显卡显存、并在显存中构建张量计算图, 往往需要数秒乃至数十秒的时间.

为避免每一次请求都要重新经历漫长的磁盘到显存的加载过程, Ollama 引入了空闲保活机制(Keep-Alive):

```bash
[客户端请求] ──> [模型推理完成] ──> [触发 Keep-Alive 倒计时 (如 5m)]
                                            │
                     ┌──────────────────────┴──────────────────────┐
                     ▼                                             ▼
        [在 5 分钟内收到新请求]                          [5 分钟内无任何请求]
                     │                                             │
            [重置倒计时并秒级响应]                         [杀死 Runner 进程, 彻底释放显存]

```

1. 请求完成瞬间: 内部计时器启动, 模型进程继续驻留在显存中, 处于挂起监听状态.
2. 命中热缓存(Hot Start): 如果在 5 分钟内有后续请求到来, Ollama 会零延迟立即开始推理, 并把倒计时重新刷新回 5 分钟.
3. 超时驱逐(Eviction): 如果 5 分钟内没有任何请求访问该模型, 后台的 `ollama_llama_server` 子进程会被平滑销毁, 显存全量归还给操作系统.

---

### 二、语法格式与特殊极值

该变量支持灵活的时间字符串语法, 并支持两个极其关键的特殊极值:

| 设定值               | 行为解释                  | 典型用途                                         |
| :------------------- | :------------------------ | :----------------------------------------------- |
| `-1`                 | 永久保活(Never Unload)    | 企业生产网关、常驻 API 服务, 杜绝一切冷启动延迟. |
| `0`                  | 立即卸载(Immediate Evict) | 极度节省显存环境, 推理完成瞬间立刻释放显存.      |
| `30s` / `10m` / `2h` | 自定义时长                | 灵活平衡本地兼顾办公与推理响应速度.              |

---

### 三、核心使用场景

#### 场景 1: 企业 API 生产网关 / 聊天机器人(追求"零冷启动延迟")

* 痛点: 部署在服务器上给团队或应用提供 API. 如果员工每隔 10 分钟提问一次, 由于默认 5 分钟就卸载了模型, 每次提问都需要硬等模型重新"搬运进显存", 体验极差.
* 对策: 设置 `OLLAMA_KEEP_ALIVE=-1`, 模型开机载入显存后永远不卸载, 每次调用都能做到毫秒级极速响应.

#### 场景 2: 单卡显存受限下的"多模型频繁轮转"(Multi-model Switching)

* 痛点: 显卡只有 16GB 显存, 但业务流中需要组合使用模型: 先调用 `bge-m3` 做向量检索(Embedding), 再调用 `qwen2.5:14b` 做对话生成, 最后调用代码模型. 如果每个模型都赖在显存里占 5 分钟, 后续模型载入时就会发生显存冲突或被强行挤下 CPU.
* 对策: 将该变量设为极小值(如 `0` 或 `30s`), 让上一棒任务执行完毕后迅速交出显存, 为下一个模型的加载腾出空间.

#### 场景 3: 个人兼顾娱乐与开发(桌面防霸占)

* 痛点: 白天在电脑上用 Ollama 辅导编程, 晚上想玩 3D 游戏. 如果显存被 Ollama 长期霸占, 游戏会爆显存崩溃.
* 对策: 保持默认的 `5m` 或缩短为 `2m`, 关闭终端几分钟后显存自动释放, 无需手动干预.

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(配置永久常驻 `-1`)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入全局永久保活环境变量:

```ini
[Service]
# -1 代表常驻显存, 绝不超时卸载
Environment="OLLAMA_KEEP_ALIVE=-1"
```

3. 保存重载生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行(配置保活 1 小时)

```bash
# 设置保活 1 小时
export OLLAMA_KEEP_ALIVE="1h"

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 启动:

```powershell
$env:OLLAMA_KEEP_ALIVE="24h"
ollama serve
```

* 系统环境变量配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_KEEP_ALIVE`
  * 变量值: `-1`(或 `30m`)
  保存后重启右下角任务栏的 Ollama 图标生效.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_KEEP_ALIVE=-1 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、进阶技巧: 动态精细化覆盖(Request-level Override)

作为服务端全局变量, `OLLAMA_KEEP_ALIVE` 是作为默认兜底存在的. 你完全可以在单次 API 请求中临时覆盖它, 而无需重启服务!

#### 1. 通过 REST API 动态临时保活 / 卸载

在调用 `/api/generate` 或 `/api/chat` 时, 直接在 JSON 体中传入 `keep_alive` 参数:

* 让单次请求后模型永远常驻:

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "qwen2.5:7b",
  "prompt": "Hello",
  "keep_alive": -1
}'
```

* 用完立刻释放显存(阅后即焚模式):

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "qwen2.5:7b",
  "prompt": "Hello",
  "keep_alive": 0
}'
```

#### 2. 通过命令行主动释放特定模型

如果之前模型设置了常驻显存, 但你突然需要释放显卡, 直接运行:

```bash
ollama stop qwen2.5:7b
```

即可主动把模型直接驱逐出显存.

---

### 六、总结与最佳实践

| 机器用途                        | 推荐配置值    | 理由                                              |
| :------------------------------ | :------------ | :------------------------------------------------ |
| 纯算力 API 推理服务器           | `-1`          | 追求绝对的吞吐量与极低请求时延, 不浪费冷启动时间. |
| 显存紧张(单卡 < 16GB)跑多任务   | `30s` 或 `1m` | 加速显存周转, 防止模型切换时堆积 OOM.             |
| 日常个人主力电脑(办公/娱乐混用) | `5m`(默认)    | 兼顾连续打字交互的顺畅度, 又能保证闲置后释放硬件. |

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_KV_CACHE_TYPE:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 LLM 本地推理的显存调优技术中, `OLLAMA_KV_CACHE_TYPE:` 是一个能够将上下文缓存显存直接砍半甚至压缩 75% 的"核武级"优化变量.

它控制的是大语言模型在进行长文本对话时, 保存在显存中的键值缓存(KV Cache)的数据量化格式.

---

### 一、核心含义解析

#### 1. 什么是 KV Cache? 为什么它是长文本的"显存黑洞"?

在 Transformer 自回归生成(每次预测一个 Token)时, 模型为了避免重复计算历史所有 Token 的注意力, 会将过去的 Key 向量和 Value 向量永久暂存在显存中, 这就是 KV Cache.

KV Cache 占用的显存与上下文长度(Context Length)成绝对线性正比:

$$\text{KV Cache 显存} = 2 \times N_{\text{layers}} \times N_{\text{kv\_heads}} \times d_{\text{head}} \times \text{Context Length} \times \mathbf{Bytes\_Per\_Element}$$

* 默认情况(`f16`): 每个元素占 2 个字节(16-bit 浮点数).
* 当上下文开到 32K、64K 甚至 128K 时, KV Cache 消耗的显存甚至会大幅超越模型本身的权重体积(例如一个 8B 的 Q4 模型本体才 5GB, 但 128K 上下文在 FP16 下单是 KV Cache 就要吃掉 16GB 显存)!

#### 2. `OLLAMA_KV_CACHE_TYPE` 的作用与参数选项

该变量告诉底层推理引擎(llama.cpp 的 `--cache-type-k` 与 `--cache-type-v`): 把存放在显存里的历史上下文向量进行动态量化压缩.

支持的取值如下:
* `f16`(官方默认值): 半精度浮点(16-bit). 日志中显示为空(`OLLAMA_KV_CACHE_TYPE:`)代表系统正处于此缺省状态. 无任何精度损失, 但显存开销极大.
* `q8_0`(黄金平衡档): 将 KV Cache 量化为 8-bit 整数.
  * 显存直接减少 50%(砍半);
  * 对模型推理质量、代码逻辑、问答精度的影响几乎不可感知(损失在 0.5% 以内).
* `q4_0`(极限压榨档): 将 KV Cache 压缩为 4-bit 整数.
  * 显存减少 75%(仅剩 1/4);
  * 可以在极小显存上挑战超长文本, 但在复杂数学推理或"大海捞针"(Needle In A Haystack)任务中会有微小的精度下降.

---

### 二、显存压缩收益对比账本

以常见的 Llama-3.1-8B 或 Qwen2.5-7B(Q4 量化, 模型权重约 5.5GB)为例, 不同 KV Cache 格式在不同上下文下的实际显存占用:

| 上下文长度(Context) | 默认 `f16` KV 显存 | `q8_0` 压缩后显存 | `q4_0` 极限压缩后 | 带来的实际部署变化                                |
| :------------------ | :----------------- | :---------------- | :---------------- | :------------------------------------------------ |
| 8K                  | ~1.0 GB            | ~0.5 GB           | ~0.25 GB          | 差异不大, 感觉不明显                              |
| 32K                 | ~4.0 GB            | ~2.0 GB           | ~1.0 GB           | 8GB/12GB 显卡从必须 CPU 卸载变为 100% GPU 运行    |
| 64K                 | ~8.0 GB            | ~4.0 GB           | ~2.0 GB           | 16GB 显卡(如 4080)可以轻松承载                    |
| 128K                | ~16.0 GB           | ~8.0 GB           | ~4.0 GB           | 24GB 显卡(如 3090/4090)原本必爆显存, 现在稳定运行 |

---

### 三、核心使用场景

1. 突破消费级显卡(8G/12G/16G)的长文本天花板:
   * 许多用户尝试配置 `OLLAMA_CONTEXT_LENGTH=32768` 时, 发现模型速度瞬间从 80 Tokens/s 跌到 2 Tokens/s. 这是因为 KV Cache 把显存撑爆了, Ollama 被迫把模型层回退到了 CPU.
   * 配置 `OLLAMA_KV_CACHE_TYPE=q8_0`, 显存瞬间省出数 GB, 让整个模型与长文本 100% 留存在显存中高速运行.
2. 高并发与并行槽位扩展(`OLLAMA_NUM_PARALLEL`):
   * 如果你需要将 Ollama 用于团队多人共享, 设置了并发处理(如 `OLLAMA_NUM_PARALLEL=4`).
   * 每一个并发会话都需要一份独立的 KV Cache! 如果开 4 个并发, 32K 上下文在 FP16 下光是 KV Cache 就要吃掉 $4 \times 4\text{GB} = 16\text{GB}$ 显存. 量化为 `q8_0` 可以直接腾出 8GB 空间, 成倍提高单卡并发承载量.

---

### 四、具体配置与使用示例

> ⚠️ 关键前置条件(最大避坑点):
> KV Cache 量化必须依赖 Flash Attention!
> 在绝大多数架构下, 如果 Flash Attention 没有启用, 量化 KV 缓存会静默失效回退到 `f16`! 因此, 必须将两者组合使用.
>

#### 示例 1: Linux 生产系统服务(推荐标配方案)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入如下黄金优化组合(开启 FlashAttention + 开启 8-bit KV 缓存压缩):

```ini
[Service]
# 1. 强制激活 FlashAttention(量化 KV Cache 的前置硬性依赖)
Environment="OLLAMA_FLASH_ATTENTION=1"

# 2. 启用 8-bit KV 缓存量化(显存直接节省一半)
Environment="OLLAMA_KV_CACHE_TYPE=q8_0"

# 3. 此时可以放心把上下文拓宽到 32K 或 64K
Environment="OLLAMA_CONTEXT_LENGTH=32768"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行验证

```bash
export OLLAMA_FLASH_ATTENTION=1
export OLLAMA_KV_CACHE_TYPE=q8_0
export OLLAMA_CONTEXT_LENGTH=32768

ollama serve
```

---

#### 示例 3: Windows 本地部署环境

* PowerShell 启动测试:

```powershell
$env:OLLAMA_FLASH_ATTENTION="1"
$env:OLLAMA_KV_CACHE_TYPE="q8_0"
ollama serve
```

* 系统环境变量配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_FLASH_ATTENTION`, 变量值: `1`
  * 变量名: `OLLAMA_KV_CACHE_TYPE`, 变量值: `q8_0`
  保存后重启任务栏右下角的 Ollama 桌面程序.

---

#### 示例 4: Docker 容器化生产部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_FLASH_ATTENTION=1 \
  -e OLLAMA_KV_CACHE_TYPE=q8_0 \
  -e OLLAMA_CONTEXT_LENGTH=32768 \
  -p 11434:11434 \
  --name ollama-optimized \
  ollama/ollama
```

---

### 五、验证生效与避坑指南

#### 1. 如何验证它真正生效了?

在启动模型并输入一段长提示词时, 查看后台 `journalctl -u ollama.service -f` 或标准输出, 寻找底层 `llama-server` 打印的初始化参数:
* 成功生效的标志:
  底层启动参数中包含 `--cache-type-k q8_0 --cache-type-v q8_0`, 并在显存打印中显示:
  > `llama_kv_cache: ... K (q8_0): 1024 MiB, V (q8_0): 1024 MiB`
  (相比以前 FP16 状态下的 2048 MiB 准确缩减了一半).

#### 2. 特殊架构兼容性

* 绝大多数标准 Transformer 架构(Llama 系列、Mistral、Qwen、Gemma)均完美支持 KV 量化.
* 但某些特殊结构模型(如极少数非对称注意力或特定 MoE/线性注意力模型, 头维度不能被 32 整除), 在开启 `q8_0` 时可能会因算子分块约束报错并安全回退到 `f16`.

> 研究员建议:
> 如果你的硬件支持 FlashAttention(NVIDIA RTX 20/30/40 系、Apple M系列芯片), 强烈推荐将 `OLLAMA_KV_CACHE_TYPE=q8_0` 作为所有服务器的默认标准配置. 它能在几乎零感知精度损失的前提下, 免费带给你翻倍的长文本处理空间.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_LLM_LIBRARY:
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的底层架构中, `OLLAMA_LLM_LIBRARY:` 是一个拥有"一票否决权"的底层计算后端强制指定开关.

它用于绕过(Bypass)Ollama 默认的硬件自适应探测算法, 强制底层推理引擎加载特定架构或指令集的动态计算库(Runner).

---

### 一、核心含义与架构背景

#### 1. 为什么 Ollama 需要这个变量?

Ollama 并不是一个单一编译的二进制文件, 为了实现"在任何电脑上都能开箱即用", 它在发布时打包了多个针对不同硬件优化的独立推理子程序(动态库 / Runners):

* CPU 端: 编译了基础指令集版(`cpu`)、高级矢量扩展版(`cpu_avx`)、高性能矢量扩展版(`cpu_avx2`);
* NVIDIA GPU 端: 针对不同驱动版本编译了 `cuda_v11`、`cuda_v12`、`cuda_v13`;
* AMD GPU 端: 编译了不同兼容性的 `rocm_v5`、`rocm_v6` 等;
* 其他平台: 如 macOS 的 `metal`、跨平台的 `vulkan`.

#### 2. 日志中为什么显示为空?

* 默认状态(空值): 代表处于"全自动嗅探模式(Auto-detection)". Ollama 启动时会自动调用 CPUID 查看 CPU 指令集, 探测系统中的显卡驱动 API, 并从内置的动态库列表中自动挑选出当前硬件支持的最优 Runner.
* 配置后的状态: 如果填入具体值, Ollama 将彻底关闭自动嗅探, 强行载入你指定的那个动态库.

> 提示: 你在启动日志中常能看到类似的一行记录:
> `Dynamic LLM libraries [cpu cpu_avx cpu_avx2 cuda_v12 rocm_v6]`
> 这里中括号里列出的所有名称, 就是当前 Ollama 版本允许你通过 `OLLAMA_LLM_LIBRARY` 手动强制指定的合法候选值.
>

---

### 二、核心使用场景

虽然官方推荐自动探测, 但在以下 4 个特殊排障场景中, 该变量是关键的解决手段:

#### 场景 1: 机器有 GPU, 但想强制使用纯 CPU 进行推理排障

* 痛点: 机器上插了一张显卡, 但显卡可能正在跑其他核心训练任务, 或者该卡存在硬件隐患/显存故障; 有时甚至只是为了做对比实验, 测试纯 CPU 推理的准确性.
* 解决: 无需去物理拔卡或配置复杂的显卡屏蔽规则, 直接设置 `OLLAMA_LLM_LIBRARY="cpu_avx2"`, 服务会直接以 CPU 高性能指令集运行, 彻底跳过 GPU 初始化.

#### 场景 2: 虚拟化 / 老旧 CPU 上的"非法指令异常(SIGILL)"

* 痛点: 在 VMware、Proxmox VE、KVM 等虚拟机中, 或使用某些特殊的云计算 VPS 时, 宿主机的 CPU 标志(Flags)透传不完整. Ollama 的自动嗅探机制误以为 CPU 支持 AVX2, 启动时直接抛出 `Illegal instruction (core dumped)` 崩溃退出.
* 解决: 强制降级为兼容性更好的指令集, 例如指定为 `cpu_avx` 或最基础的 `cpu`.

#### 场景 3: NVIDIA / AMD 驱动版本不匹配引发的加载失败

* 痛点: 宿主机安装的 NVIDIA 驱动比较老旧(例如只支持 CUDA 11.x), 但 Ollama 自动嗅探时优先尝试拉起 `cuda_v12` 导致驱动报符号缺失(Symbol lookup error)或初始化闪退.
* 解决: 强制指定旧版兼容 Runner, 例如 `OLLAMA_LLM_LIBRARY="cuda_v11"`.

#### 场景 4: 科研基准测试与吞吐量比对(Benchmarking)

* 需求: 研究不同向量指令集(如普通 AVX 对比 AVX2)对小参数模型(如 0.5B / 1.5B)推理 Prompt 阶段的实际加速比.
* 解决: 通过切换此变量, 在同一台机器上无缝横向评测不同后端的真实性能表现.

---

### 三、常见可选值速查表

| 取值(Value) | 适用硬件与特性                             | 性能级别         | 典型适用场景                          |
| :---------- | :----------------------------------------- | :--------------- | :------------------------------------ |
| `cpu_avx2`  | 支持 AVX2/FMA 的现代 x86 CPU(近 10 年主流) | CPU 极高         | 纯 CPU 推理的首选最佳性能档.          |
| `cpu_avx`   | 仅支持早期 AVX 的老架构 CPU                | CPU 中等         | 老旧工控机、轻量 VPS 防崩溃.          |
| `cpu`       | 纯基础 x86 指令集(无 AVX 依赖)             | 最慢, 兼容性最强 | macOS Rosetta 2 转译、极老服务器兜底. |
| `cuda_v12`  | 搭载主流新版驱动的 NVIDIA 显卡             | GPU 极高         | 锁定使用 CUDA 12 运行时.              |
| `cuda_v11`  | 搭载老版闭源驱动(515 以前)的 NVIDIA 显卡   | GPU 高           | 兼容旧版企业级服务器驱动环境.         |
| `rocm_v6`   | 搭载现代 ROCm 驱动的 AMD 计算卡/独显       | GPU 极高         | 锁定使用 AMD ROCm 6 后端.             |
| `vulkan`    | 支持 Vulkan 1.2+ 的跨平台 GPU/核显         | 平台泛用         | 排除特定驱动冲突时使用.               |

---

### 四、具体配置与使用示例

#### 示例 1: Linux 终端临时强制使用 CPU-AVX2 运行

无论机器是否有 NVIDIA / AMD 显卡, 强制让其完全由 CPU 的 AVX2 指令集运算:

```bash
# 强制指定为 CPU AVX2 运行库
export OLLAMA_LLM_LIBRARY="cpu_avx2"

# 启动服务
ollama serve
```

启动后观察日志, Ollama 会跳过所有 GPU 设备初始化, 直接挂载 `cpu_avx2` runner 并在终端中显示 CPU 推理信息.

---

#### 示例 2: Linux 生产系统服务(systemd 守护进程部署)

如果服务器的 CUDA 驱动版本有特殊限制, 需要强制使用指定的 GPU Runner:

1. 编辑系统服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入指定运行库:

```ini
[Service]
Environment="OLLAMA_LLM_LIBRARY=cuda_v12"
```

3. 保存重载生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 3: Windows 本地配置(解决老 CPU 指令集报错)

* PowerShell 启动测试:

```powershell
$env:OLLAMA_LLM_LIBRARY="cpu_avx"
ollama serve
```

* 系统永久配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_LLM_LIBRARY`
  * 变量值: `cpu_avx2`
  重启 Ollama 桌面客户端生效.

---

#### 示例 4: Docker 容器化部署

在没有 NVIDIA Container Toolkit 的纯 CPU Docker 容器中, 确保以最优 AVX2 模式运行:

```bash
docker run -d \
  -e OLLAMA_LLM_LIBRARY="cpu_avx2" \
  -p 11434:11434 \
  --name ollama-cpu \
  ollama/ollama
```

---

### 五、避坑指南与硬核认知

1. 不可"无中生有":
   * 你填入的值必须是当前运行的 Ollama 安装包实际内含的 Runner.
   * 例如在没有 NVIDIA 显卡的机器上强制指定 `cuda_v12`, 或者在一个只包含 `rocm_v6` 的新版本镜像里强行填 `rocm_v4`, Ollama 在初始化阶段会直接抛出 `runner not found` 或动态链接库加载失败异常.
2. 硬件物理特性不可逆:
   * 如果你的物理 CPU 本身硬件不支持 AVX2 指令(可通过 `lscpu | grep avx2` 确认), 强行填写 `OLLAMA_LLM_LIBRARY="cpu_avx2"` 不会带来性能提升, 而会在执行第一个浮点运算指令时瞬间触发 CPU 硬件异常崩溃(SIGILL).
3. 日常运维建议:
   * 在生产环境或日常开发中, 日志中保持 `OLLAMA_LLM_LIBRARY:`(空值)是官方推荐的健康常态. 只有在遇到"自动探测误判"、"驱动版本卡死"或"指令集闪退"时, 才需将其作为救急工具进行精确覆盖.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_LOAD_TIMEOUT:5m0s
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的调度器(Scheduler)与生命周期管理中, `OLLAMA_LOAD_TIMEOUT:5m0s` 是一个控制"模型从磁盘加载到显存/内存时的最大允许超时等待时间"的核心稳定性变量.

日志中的 `5m0s` 是 Go 语言标准时间(`time.Duration`)的输出格式, 代表系统默认设定的加载保护阈值为 5 分钟(5 minutes 0 seconds).

---

### 一、核心工作机制解析

当你发起一次请求, 且目标模型尚未在显存中(触发冷启动)时, Ollama 必须经历一系列重量级的初始化流水线:

```bash
[用户发起推理请求]
       │
       ▼ (模型未驻留, 触发冷启动)
[拉起底层 llama-server 进程]
       │
       ▼
[从磁盘读取几十 GB 的 GGUF 权重] ── (若此处因磁盘/网络卡顿超过 5 分钟) ──┐
       │                                                                │
       ▼                                                                ▼
[PCIe 总线传输至 GPU 显存 / 统一内存]                             [触发 Load Timeout 熔断]
       │                                                                │
       ▼                                                                │
[构建张量计算图并初始化 KV Cache]                                        ▼
       │                                                   强制杀死 Runner 子进程,
       ▼ (握手成功, Runner 报告 Ready)                      报错中断请求:
[开始 Token 推理生成]                                      "context deadline exceeded"
```

* 核心作用: 该变量是针对模型加载阶段的防假死检测机制(Stall Detection).
* 行为逻辑: Ollama 服务端拉起底层 Runner 子进程后, 会启动一个倒计时. 如果在 `OLLAMA_LOAD_TIMEOUT` 规定时间内, Runner 迟迟没有完成数据装载并报告就绪状态, Ollama 会认定本次加载已发生死锁或严重阻塞, 从而强制杀死子进程、回滚状态, 并向客户端抛出 `context deadline exceeded` 超时错误.

---

### 二、语法格式与特殊值

该变量在底层支持两种传值语法:

1. 时间单位字符串: 如 `10m`(10 分钟)、`30m`(30 分钟)、`1h`(1 小时).
2. 纯整数秒数: 如 `600`(等同于 600 秒 / 10 分钟).
3. `0` 或负数(如 `-1`): 彻底关闭超时检测(Infinite / 无限等待). 系统会一直等待, 直到模型彻底载入完毕, 绝不主动超时掐断.

---

### 三、核心使用场景

默认的 5 分钟对于普通 7B/14B 模型在高速 NVMe 固态硬盘上是绰绰有余的(通常只需 2~5 秒). 但在以下场景中, 5 分钟会成为系统崩溃的元凶, 必须调大该变量:

#### 场景 1: 超大参数模型(70B、120B、405B 或 MoE 架构)冷启动

* 痛点: 加载一个 Llama-3.3-70B、Qwen-72B 或数百 GB 的 DeepSeek 量化权重时, 冷启动需要从磁盘读取 40GB 到 100GB+ 的巨量数据, 并在多张 GPU 之间做复杂的张量切分(Tensor Splitting).
* 现象: 当硬盘读速不够快时, 读盘到第 4 分 59 秒刚读了 90%, Ollama 的 5 分钟定时器突然响起, 直接把进程强行掐死, 提示 `context deadline exceeded`, 导致大模型永远无法正常跑起来.
* 解决: 将其放宽到 `15m` 或 `30m`, 给大模型充足的读盘与切分时间.

#### 场景 2: 基于网络存储(NAS / NFS / SMB)或机械硬盘(HDD)的集群部署

* 痛点: 在 Kubernetes 集群、私有云或家庭服务器中, 模型的持久化目录 `OLLAMA_MODELS` 挂载在远端的 NAS(网络附加存储)上.
* 现象: 千兆网口(1Gbps)的理论极速仅为 125 MB/s, 加上网络抖动, 读取一个 40GB 的模型往往需要 8~10 分钟. 默认的 5 分钟必定超时.
* 解决: 设置 `OLLAMA_LOAD_TIMEOUT=20m` 或 `0`.

#### 场景 3: Apple Silicon 统一内存高负荷置换(Swap 严重时)

* 痛点: 在 64GB/128GB 的 Mac 上运行接近内存上限的极限模型, macOS 需要频繁在统一内存与虚拟内存(Swap)之间挪移交换数据.
* 现象: 由于内存置换导致 I/O 剧烈排队, 模型载入时间被拉长至 6~8 分钟.
* 解决: 根据官方模型库对大型模型的调优建议, 配置 `OLLAMA_LOAD_TIMEOUT=15m`.

#### 场景 4: 高可用生产网关的"快速熔断"(Fail-Fast)

* 需求: 在多节点的高并发反向代理集群中, 算力机全部采用 PCIe 4.0 NVMe 超高速固态.
* 做法: 反向调小该值, 例如设为 `1m`(1 分钟). 如果某台机器 1 分钟都没载入成功, 说明该节点硬件挂死, 快速超时并让网关将流量分流到其他健康节点.

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(放宽到 20 分钟)

对于需要跑超大模型或挂载了网络硬盘的生产机:

1. 编辑系统服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入调优参数:

```ini
[Service]
# 将加载容忍时间放宽至 20 分钟
Environment="OLLAMA_LOAD_TIMEOUT=20m"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行验证

```bash
# 设置为 15 分钟
export OLLAMA_LOAD_TIMEOUT="15m"

# 或者彻底禁用超时限制(设为 0, 无限等待)
# export OLLAMA_LOAD_TIMEOUT=0

ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 命令行测试:

```powershell
$env:OLLAMA_LOAD_TIMEOUT="20m"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_LOAD_TIMEOUT`
  * 变量值: `20m`
  重启任务栏托盘里的 Ollama 图标即可生效.

---

#### 示例 4: Docker / K8s 容器化挂载外部存储部署

挂载 NAS 存储卷时, 容器启动必配项:

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_LOAD_TIMEOUT=30m \
  -v /mnt/nas/ollama_models:/root/.ollama/models \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、易混淆概念与避坑指南

很多开发者容易把 `OLLAMA_LOAD_TIMEOUT` 与 `OLLAMA_KEEP_ALIVE` 搞混, 两者的职责完全不同:

| 环境变量              | 作用阶段         | 核心任务                                                |
| :-------------------- | :--------------- | :------------------------------------------------------ |
| `OLLAMA_LOAD_TIMEOUT` | 加载中(Loading)  | 允许模型从磁盘搬进显存的最长等待时间, 防止读盘卡死.     |
| `OLLAMA_KEEP_ALIVE`   | 推理完成后(Idle) | 模型成功加载并生成完毕后, 在显存里空闲驻留多久不被释放. |

> 排障经验总结:
> 当你使用第三方前端(如 Open WebUI)调用大模型时, 如果前端在等待几分钟后突然跳出红色的 `Context Deadline Exceeded` 或 `timed out waiting for llama runner to start`, 同时检查后台发现 GPU 显存增长到一半突然归零, 这就是典型的触发了加载超时熔断! 直接将 `OLLAMA_LOAD_TIMEOUT` 调整为 `15m` 或 `20m` 即可彻底解决.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_MAX_LOADED_MODELS:0
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的高并发架构与模型调度体系中, `OLLAMA_MAX_LOADED_MODELS:0` 是一个控制"系统允许同时常驻在显存/内存中的模型实例数量上限"的核心调度变量.

它与 `OLLAMA_NUM_PARALLEL` 一同构成了 Ollama 的多任务并发调度基石.

---

### 一、核心含义解析

#### 1. 变量功能

* `OLLAMA_MAX_LOADED_MODELS`: 指不同模型(或同一模型的多个独立实例)同时驻留在显存(VRAM)或系统内存(RAM)中的最大数量.
* 它是系统级别的"模型槽位上限".

#### 2. 日志中显示 `:0` 的具体含义

* 在 Ollama 源码配置模块(`envconfig/config.go`)中, `0` 代表"自动计算模式(Automatic Management)":
  * GPU 环境下: 系统自动将上限设置为 `3 * GPU 数量`(例如单张 RTX 4090 默认允许最多驻留 3 个模型, 双卡机器允许 6 个);
  * 纯 CPU 环境下: 系统默认允许最多驻留 `3` 个模型.
* 此时日志显示 `OLLAMA_MAX_LOADED_MODELS:0`, 说明你未手动写死槽位数量, 服务正交由系统根据显卡数量自动评估.

#### 3. 底层置换策略(LRU 驱逐机制)

如果加载新模型时, 当前驻留的模型数量达到了该变量的上限(或者显存已无法塞下新模型), Ollama 会触发 LRU(Least Recently Used, 最近最少使用)淘汰算法:

1. 自动挑选一个在空闲状态且最久没有被调用过的模型;
2. 提前终止其保活(忽略剩余的 `OLLAMA_KEEP_ALIVE` 倒计时);
3. 杀死其底层 Runner 进程并释放显存, 给新模型腾出空间.

---

### 二、核心使用场景

虽然默认的自动规则(3 个/卡)能满足日常需求, 但在实际生产与高负载场景中, 往往需要人工显式覆写该值:

#### 场景 1: 中小显存显卡, 强制"单模型独占算力"(设为 `1`)

* 痛点: 对于消费级显卡(如 12GB 的 RTX 4070、16GB 的 RTX 4080), 显存只够完整承载一个 14B 参数的模型. 如果默认允许最多加载 3 个模型, 当你尝试同时调用一个 7B 对话模型和一个 2B 小模型时, Ollama 会尝试把两者强行塞入显存.
* 灾难: 显存瞬间捉襟见肘, Ollama 会被迫把模型的大量子层卸载(Offload)到极其缓慢的 CPU 内存中, 导致两个模型的推理速度断崖式下跌.
* 解决: 配置 `OLLAMA_MAX_LOADED_MODELS=1`. 只要发起新模型请求, 旧模型会被立刻踢出, 保证所有可用显存 100% 专供当前活跃模型使用.

#### 场景 2: RAG(检索增强生成)与 Agent 多模型协同流水线(设为 `2` 或更高)

* 痛点: 一个标准的现代 RAG 系统, 每次问答都需要先调用 Embedding 模型(如 `bge-m3`, 约 1.2GB)将用户输入转为向量, 检索出知识库文档后再调用生成模型(如 `qwen2.5:14b`, 约 9GB)产出最终答案.
* 灾难: 若此时设置了 `OLLAMA_MAX_LOADED_MODELS=1`, 每一次对话都会发生恐怖的"模型乒乓切换"(加载 Embedding $\to$ 卸载 $\to$ 加载 LLM $\to$ 卸载 $\to$ 下一轮又重新载入 Embedding), 大量的冷启动 I/O 导致每次检索延迟高达十几秒.
* 解决: 将其设为 `2` 或 `3`, 让轻量级的 Embedding 模型与 LLM 永久共存于显存中, 实现秒级流式问答.

#### 场景 3: 大显存工作站 / 统一内存 Mac(设为 `4` ~ `6`)

* 背景: 搭载 128GB 统一内存的 Mac Studio, 或插有双卡 RTX 4090(48GB 显存)的服务器.
* 对策: 放宽到 `4` 以上, 可以让代码助手(Qwen2.5-Coder)、通用闲聊(Llama 3)、推理模型(DeepSeek-R1)以及视觉模型(Llava)全部预热就绪, 随时调用无需等待冷启动.

---

### 三、关键概念辨析: 不要与并发搞混!

很多工程师容易将 Ollama 的两个并发变量混为一谈:

| 环境变量                   | 控制对象                | 含义通俗解释                                                         |
| :------------------------- | :---------------------- | :------------------------------------------------------------------- |
| `OLLAMA_MAX_LOADED_MODELS` | 不同模型权重(Models)    | 显存里最多能同时停放几辆不同的汽车(如同时跑 Llama3 和 Qwen2).        |
| `OLLAMA_NUM_PARALLEL`      | 单模型的并发请求(Slots) | 某一辆汽车上最多能同时坐几个乘客(同一模型并发处理几个用户的 Prompt). |

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(推荐中小显存服务器设为 `1`)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入配置:

```ini
[Service]
# 强制单模型独占, 避免多模型共存抢显存导致降级到 CPU
Environment="OLLAMA_MAX_LOADED_MODELS=1"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行(配置 RAG 双模型常驻)

```bash
# 允许同时常驻 2 个模型(1 个 Embedding 向量模型 + 1 个对话 LLM)
export OLLAMA_MAX_LOADED_MODELS=2

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 启动:

```powershell
$env:OLLAMA_MAX_LOADED_MODELS="1"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_MAX_LOADED_MODELS`
  * 变量值: `1`(或者 `2`)
  保存后重启任务栏托盘里的 Ollama 图标即可.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_MAX_LOADED_MODELS=2 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、进阶验证与避坑指南

#### 1. 如何直观查看当前常驻的模型?

在发起请求后, 随时在终端敲入:

```bash
ollama ps
```

如果配置了 `OLLAMA_MAX_LOADED_MODELS=2`, 你可能会看到两行模型同时在显存中活跃运行:

```bash
NAME                 ID             SIZE     PROCESSOR    UNTIL
qwen2.5:7b           6e9f9c77f59    4.7 GB   100% GPU     4 minutes from now
bge-m3:latest        f341ba08f86    1.2 GB   100% GPU     4 minutes from now
```

#### 2. 物理显存是不可逾越的硬限制

请铭记: 该变量设置得再大, 也必须受限于物理显存的真实容量.

* 即使你设置了 `OLLAMA_MAX_LOADED_MODELS=5`, 但你使用的显卡只有 8GB, 当你加载第二个模型时, 由于显存已经彻底耗尽, Ollama 的显存规划器仍会强制把最老的模型驱逐, 或者把新模型大部分权重丢到 CPU 内存中.
* 最佳实践建议:
  * 显存 $\le$ 16GB 的单卡: 坚决设为 `1`(追求单模型的极致推理速度与纯 GPU 运行);
  * 显存 24GB+ 或双卡系统: 设为 `2` ~ `3`(满足 Agent 与 RAG 的无缝多模型混跑).

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_NUM_PARALLEL:1
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的高并发架构与推理服务化体系中, `OLLAMA_NUM_PARALLEL:1` 是直接决定大模型单实例"并发处理能力(Concurrency)与并行槽位(Slots)"的核心调度变量.

日志中显示的 `1` 代表当前处于单请求串行处理模式: 即该模型在同一时刻只能专心为一个用户生成文本, 其他后续到达的请求必须在队列中排队死等.

---

### 一、核心含义与底层工作机制

#### 1. 对应底层引擎的参数

* 底层映射: 该变量直接对应底层推理引擎 `llama-server` 的 `-np` / `--parallel` 命令行参数.
* 物理意义: 它指定了在加载模型时, 底层引擎要为该模型预先开辟出多少个独立的上下文槽位(Sequence Slots).

#### 2. "串行(`=1`)" vs "连续批处理(`>1`)"的区别

* 当 `OLLAMA_NUM_PARALLEL=1`(当前状态):
  * 模式: 排他式串行生成.
  * 行为: 如果用户 A 正在让大模型生成一篇 2000 字的长文章(耗时约 30 秒), 此时用户 B 发送了一个只有 10 个字的问候, 用户 B 也必须硬等 30 秒, 直到用户 A 的文章彻底输出完成. 用户 B 的请求会被迫积压在上文介绍的 `OLLAMA_MAX_QUEUE` 候机厅中.
* 当 `OLLAMA_NUM_PARALLEL=4` 时:
  * 模式: 激活底层硬件的连续批处理(Continuous Batching)能力.
  * 行为: 底层计算图会同时开辟 4 个并行槽位. 用户 A、B、C、D 可以同时向模型发起提问, 显卡张量核心(Tensor Cores)会在同一个前向推理步中把 4 个用户的 Token 打包并发计算并流式吐字, 彻底消除彼此排队阻塞的现象.

---

### 二、算力账本: 并发与显存的"倍增法则"

并发并不是"免费的午餐". 作为高级研究人员, 必须看清其背后的显存倍增代价:

$$\mathbf{总\ KV\ Cache\ 显存占用} = \mathbf{OLLAMA\_NUM\_PARALLEL} \times \text{单槽位 KV Cache 显存}$$

* 模型静态权重(Weights): 只有一份, 在显存中不增加(例如 7B 模型无论是 1 个并发还是 8 个并发, 模型本体都只占 5GB).
* 动态上下文缓存(KV Cache): 必须按并发槽位数进行严格线性翻倍!

#### 显存开销推演(以 32K 上下文为例):

* 假设单个槽位开辟 32K 上下文需要消耗 4 GB 显存:
  * 当 `OLLAMA_NUM_PARALLEL=1`: 总 KV 缓存 = 4 GB(加上模型本体 5GB, 总计 9GB, 12G 显卡轻松跑);
  * 当 `OLLAMA_NUM_PARALLEL=4`: 总 KV 缓存 = $4 \times 4\text{GB} = \mathbf{16\text{ GB}}$(总显存激增至 21GB, 12G/16G 显卡当场爆显存退回 CPU)!

---

### 三、核心使用场景与选型策略

| 变量取值    | 核心优势                                              | 潜在弊端                                  | 适用业务场景                                                         |
| :---------- | :---------------------------------------------------- | :---------------------------------------- | :------------------------------------------------------------------- |
| `1`(默认值) | 单用户延迟最低、显存占用最小. 模型全层最大化留在 GPU. | 多人访问时体验极差, 必须按序死等前序完成. | 个人独享电脑、本地开发调试、显卡显存较小($\le 16$GB).                |
| `2` ~ `4`   | 兼顾吞吐与多任务, 消除人际等待卡顿.                   | KV 缓存成倍增加, 单字输出速度微幅下降.    | 小型团队共享服务器、多 Agent 智能体并行分支调用、Open WebUI.         |
| `8` 或更高  | 集群吞吐量(Throughput)极大化, 吃满高规格 GPU 算力.    | 极度消耗显存, 需要搭配量化缓存.           | 大型企业私有 API 网关、高并发无状态接口、大显存集群(A100/H100/4090). |

#### 典型受益场景:

1. 构建私有 WebUI 服务供团队协作:
   * 办公室内有 5~10 名同事接入同一台部署了 Ollama 的服务器. 设为 `4`, 大家提问时可以同时得到回复, 不再出现一人提问全员卡死的情况.
2. 多 Agent 智能体框架(LangGraph / AutoGen / CrewAI):
   * 复杂的 Agent 会将一个大任务切分为 3~4 个子任务(如同时并发检索 3 个网页并总结). 若设为 1, 子任务会被迫排队执行; 设为 4, 端到端任务耗时可直接压缩数倍.

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(推荐团队 4 并发配置)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入并发环境变量(建议设为 4):

```ini
[Service]
# 开启 4 个并发推理槽位
Environment="OLLAMA_NUM_PARALLEL=4"
```

3. 保存并重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时启动测试

```bash
# 临时开辟 4 并发槽位
export OLLAMA_NUM_PARALLEL=4

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地部署环境

* PowerShell 启动测试:

```powershell
$env:OLLAMA_NUM_PARALLEL="4"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_NUM_PARALLEL`
  * 变量值: `4`
  保存后彻底重启任务栏右下角的 Ollama 桌面程序.

---

#### 示例 4: Docker 容器化生产部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_NUM_PARALLEL=4 \
  -p 11434:11434 \
  --name ollama-concurrent \
  ollama/ollama
```

---

### 五、架构师级黄金组合拳(解决显存暴涨的解法)

很多架构师在把 `OLLAMA_NUM_PARALLEL` 改为 `4` 甚至 `8` 后, 发现模型直接退回 CPU 变得奇慢无比, 这正是因为没有做好"显存对冲".

在生产环境中, 高并发设置必须与前文讲解的另外两个变量组成"铁三角组合拳":

```ini
[Service]
# 1. 开启 4 并发槽位(提升多用户吞吐)
Environment="OLLAMA_NUM_PARALLEL=4"

# 2. 强制开启 FlashAttention(降低长文本动态开销)
Environment="OLLAMA_FLASH_ATTENTION=1"

# 3. 强制将 KV Cache 压缩为 8-bit(把每个并发槽位的显存消耗直砍 50%!)
Environment="OLLAMA_KV_CACHE_TYPE=q8_0"
```

* 收益: 借助 `OLLAMA_KV_CACHE_TYPE=q8_0` 将膨胀的显存砍半, 你可以在一张普通的 16GB 或 24GB 显卡上, 稳稳承载 4 个并发、每个并发 16K 上下文的高负载运转, 且保证模型 100% 跑在显卡上!

---

### 六、核心概念对比辨析

再次提醒, 不要混淆以下两个参数:

* `OLLAMA_MAX_LOADED_MODELS`: 显存里能同时装几部不同的模型(Model Instances);
* `OLLAMA_NUM_PARALLEL`: 单部模型内部能同时接待几个并发的用户请求(Request Slots).

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_MAX_QUEUE:512
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的高并发架构与请求调度体系中, `OLLAMA_MAX_QUEUE:512` 是用于实现"过载保护与服务端背压机制(Backpressure & Overload Protection)"的核心限流变量.

日志中的 `512` 是 Ollama 官方预设的缺省队列长度, 它直观规定了: 当服务端的计算资源全部被占满时, 最多允许多少个后续请求在内存中排队等待.

---

### 一、核心工作机制解析

为了理解这个变量, 我们需要先厘清 Ollama 内部的"计算槽位(Slot)"与"排队候机厅(Queue)"的两级流水线:

```bash
                 [高并发海量请求涌入]
                          │
                          ▼
        ┌────────────────────────────────────┐
        │  OLLAMA_NUM_PARALLEL (计算槽位)    │ <── 正在 GPU 上并行推理的请求 (如 4 个)
        └────────────────────────────────────┘
                          │ (全部槽位已被占满!)
                          ▼
        ┌────────────────────────────────────┐
        │  OLLAMA_MAX_QUEUE (排队缓冲区)     │ <── 挂起等待、按 FIFO 顺序排队的请求 (最多 512 个)
        └────────────────────────────────────┘
                          │ (排队数量超过 512 阈值!)
                          ▼
            [触发快速熔断 / 拒绝服务]
             立即返回 HTTP 503 Service Unavailable:
             "server is overloaded" / "queue is full"
```

1. 正常处理: 当请求到达时, 如果有空闲的并行槽位(由 `OLLAMA_NUM_PARALLEL` 决定), 请求直接进入显卡开始计算.
2. 排队挂起: 若所有槽位均在运行, 新来的请求不会立即报错, 而是进入一个先进先出(FIFO)的内存等待队列, 挂起 HTTP 连接等待前序任务完成.
3. 熔断丢弃(Load Shedding): 一旦排队等候的请求数量达到 `512` 这个上限, Ollama 就会坚决切断进流通道, 对第 513 个及后续的所有请求立刻直接返回 HTTP 503 错误(服务过载), 避免服务被无休止的请求彻底冲垮.

---

### 二、核心痛点与排队时延的"数学陷阱"

为什么作为高级架构师, 我们往往不建议在面向前端用户的生产环境无脑保留默认的 `512`?

* 排队时延估算公式:

  $$\text{最坏情况等待时间} \approx \frac{\text{当前排队请求数} \times \text{单次请求平均生成耗时}}{\text{并行处理槽位数 (OLLAMA\_NUM\_PARALLEL)}}$$

* 实际案例推演:
  * 假设模型单次问答平均耗时为 5 秒, 你的显卡开辟了 4 个并发槽位;
  * 如果排队区被 512 个请求塞满, 排在队尾的那个用户需要死等:

    $$\frac{512 \times 5\text{s}}{4} = 640\text{ 秒} \approx 10.6\text{ 分钟}!$$

* 引发的次生灾害(幽灵请求 / 算力浪费):
  * 大多数 Web 页面、App、甚至反向代理(Nginx 的 `proxy_read_timeout`)的超时时间通常只有 60 秒.
  * 结果就是: 用户等了 1 分钟早就关闭了网页或取消了提问, 但由于请求已经进了 Ollama 的 512 深度队列, 10 分钟后 Ollama 依然会傻傻地把这个废弃请求拉进 GPU 算力中去跑推理, 白白消耗大量显存与电费!

---

### 三、核心使用场景与调优策略

根据不同的业务形态, 该变量的调整策略通常呈现两极化:

#### 场景 1: 在线交互式 Web 服务 / 智能客服(大幅调小, 追求"快速失败 Fail-Fast")

* 策略: 将 `OLLAMA_MAX_QUEUE` 压缩至 `20` ~ `50`.
* 收益: 绝不让真实用户排队超过几分钟. 队列一旦堆积, 立即向客户端返回 503 提示"当前咨询人数较多, 请稍后重试", 前端可以友好引导, 同时也方便上游负载均衡网关快速触发重试分流.

#### 场景 2: 微服务集群与前置网关(极限低队列, 做无缝动态分流)

* 策略: 搭配 Nginx / HAProxy / Envoy 多节点集群, 将各节点的 `OLLAMA_MAX_QUEUE` 设为极小值(如 `5` 或 `10`).
* 收益: 当这台服务器算力吃满且排队稍微有一点点苗头, 立刻返回 503, 负载均衡器捕获后秒级把请求自动剔除并重定向路由到另一台相对空闲的算力机上, 实现算力集群利用率最大化.

#### 场景 3: 离线批处理与知识库入库(调大队列, 吸收瞬时流量脉冲)

* 策略: 将 `OLLAMA_MAX_QUEUE` 扩充到 `1024` 或 `2048`.
* 背景: 在企业 RAG 知识库构建阶段, 后台自动化 Python 脚本瞬间并发提交了 1000 篇文档切片的 Embedding 向量化请求.
* 收益: 脚本无需复杂精巧的客户端限流防重试逻辑, 庞大的队列能够像"海绵"一样一口气吸收所有请求, 并在后台以最大吞吐量排队慢慢消化.

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(推荐在线 Web 服务的防过载配置)

1. 编辑系统单元服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入调优组合(将排队上限压缩至 30, 避免无效长久排队):

```ini
[Service]
# 设置排队上限为 30
Environment="OLLAMA_MAX_QUEUE=30"

# 配合开启 4 个并发槽位处理
Environment="OLLAMA_NUM_PARALLEL=4"
```

3. 保存并重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行(离线大批量任务吸收)

```bash
# 将排队池放宽至 2048, 供离线脚本批量灌入任务
export OLLAMA_MAX_QUEUE=2048

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 启动:

```powershell
$env:OLLAMA_MAX_QUEUE="50"
ollama serve
```

* 系统环境变量配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_MAX_QUEUE`
  * 变量值: `50`
  保存后重启右下角任务栏的 Ollama 图标即可.

---

#### 示例 4: Docker 容器化生产部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_NUM_PARALLEL=4 \
  -e OLLAMA_MAX_QUEUE=50 \
  -p 11434:11434 \
  --name ollama-production \
  ollama/ollama
```

---

### 五、进阶验证与实战排障建议

#### 1. 如何模拟验证排队与熔断效果?

你可以使用简单的并发压测工具(如 `hey` 或 `ab`)向 Ollama 服务发起突发并发:

```bash
# 以 100 并发向本地模型发起 200 次请求
hey -n 200 -c 100 -m POST \
  -H "Content-Type: application/json" \
  -d '{"model":"qwen2.5:7b","prompt":"hello","stream":false}' \
  http://localhost:11434/api/generate
```

* 观察结果:
  * 如果 `OLLAMA_MAX_QUEUE` 设为 `20`, 而并发数达到 100, 你会立即看到部分请求成功返回 200, 而大量超出容量的请求会秒级收到 `Status code: 503`, 证明熔断防线坚挺生效.

#### 2. 架构师级黄金法则总结

* 排队占用的并不是显存, 而是 Go 语言运行时微量的内存连接句柄, 因此队列设大本身不会直接引起显卡 OOM.
* 但队列深度本质上是在"以响应时间换可用性".
* 法则: 只要终端消费者是人类(Chatbot 对话), `OLLAMA_MAX_QUEUE` 建议设为 `20 ~ 50`; 只要终端消费者是批处理程序(Batch Workers), 保持默认 `512` 或扩至 `1024+` 最为稳妥.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_MAX_TRANSFER_STREAMS:4
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的网络传输与模型存储引擎中, `OLLAMA_MAX_TRANSFER_STREAMS:4` 是一个专门控制模型拉取(Pull)与推送(Push)时"多流并发传输通道上限"的网络层调度变量.

日志中显示的 `:4` 是系统官方预设的缺省值, 代表默认允许最多 4 个数据流同时进行并行网络传输.

---

### 一、核心含义与底层技术背景

#### 1. 源码定义

在 Ollama 源码(`envconfig/config.go`)中, 该变量的定义如下:
> "Caps the number of simultaneous body-bearing transfers during safetensors model pulls/pushes, keeping slower networks from being saturated. Tune higher for fast networks. Has no effect on GGUF transfers, which use the legacy upload/download paths."
> (限制拉取/推送 safetensors 格式模型时的最大并发传输流数量, 防止慢速网络被瞬间打满拥塞. 高速网络可调大. 对走传统单流/分层机制的 GGUF 传输无效.)
>

#### 2. 为什么需要这个变量? (Safetensors 带来的改变)

* 传统的 GGUF 格式: Ollama 传统的 GGUF 模型通常被打包为一个或几个大型的 Blob 二进制层, 主要依赖单连接或简单的分块断点续传.
* 现代原生 Safetensors 格式: 随着 Ollama 支持更广泛的后端(如 Apple MLX Runner、直接拉取 Hugging Face 原生格式权重等), 现代模型大多是以分片(Sharded)形式存在的(例如一个 70B 模型会被切成 `model-00001-of-00008.safetensors` 到 `00008` 等多个独立分卷).
* 多流并发机制: 为了加速下载, Ollama 会同时发起多个 HTTP/TCP 连接并发下载不同分卷. `OLLAMA_MAX_TRANSFER_STREAMS:4` 规定了同时在传输中的文件流绝对不超过 4 个.

---

### 二、核心使用场景与调优策略

根据你的网络带宽环境, 调整该变量能解决两类极端问题:

#### 场景 1: 弱网/高丢包环境 -- "调小以保稳定"(官方救急方案)

* 痛点: 在家庭 Wi-Fi、跨国网络、或者移动热点下下载几十 GB 的大模型, 经常下载到 70% 突然报错断开:
  > `unexpected EOF`
  > `connection reset by peer`
  > `TLS handshake timeout`
* 原因: 4 个并发流同时进行极高吞吐的 TCP 数据包搬运, 容易导致老旧家用路由器 NAT 表爆满、高丢包率, 进而引发 TCP 连接被对端重置.
* 解决: 将其调小至 `1` 或 `2`. 牺牲一点并发速度, 转为单流或双流稳扎稳打传输, 极大提升弱网下的下载成功率.

#### 场景 2: 数据中心 / 万兆光纤环境 -- "调大以吃满带宽"

* 痛点: 在企业 IDC 机房或千兆/万兆(10Gbps)高速宽带服务器上, 拉取多分卷模型时, 单流往往受限于单 TCP 连接的拥塞窗口和延迟, 导致 4 个流只能跑出几十 MB/s, 远远喂不饱 10Gbps 的网络管道.
* 解决: 将其放宽至 `8`、`16` 甚至 `32`. 开启更多并发下载通道, 让服务器带宽直接跑满, 几分钟内下完上百 GB 的分卷模型.

#### 场景 3: 本地开发防网络"抢占"(QoS 限流避让)

* 痛点: 在个人电脑后台跑 `ollama pull`, 发现电脑上的其他网页打不开了, 视频会议也卡死了.
* 解决: 把传输流压到 `1`, 避免 Ollama 彻底霸占家庭出口带宽.

---

### 三、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(高速机房调大并发)

在具备千兆/万兆带宽的云服务器上, 编辑 systemd 单元:

1. 打开配置编辑:

```bash
sudo systemctl edit ollama.service
```

2. 注入调优参数(将并发流扩至 8 或 16):

```ini
[Service]
# 提升 safetensors 多流并发上限, 大幅加速拉取
Environment="OLLAMA_MAX_TRANSFER_STREAMS=8"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行(弱网环境单流保活)

如果在下载特定多文件模型时频发网络中断, 尝试单流模式:

```bash
# 限制单流稳健传输, 防止网络拥塞
export OLLAMA_MAX_TRANSFER_STREAMS=1

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 启动测试:

```powershell
$env:OLLAMA_MAX_TRANSFER_STREAMS="8"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_MAX_TRANSFER_STREAMS`
  * 变量值: `8`(高速网络)或 `1`(不稳定网络)
  重启右下角任务栏的 Ollama 图标即可.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_MAX_TRANSFER_STREAMS=8 \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 四、避坑与技术边界提示

1. 对纯传统 GGUF 镜像无效:
   * 如果你拉取的只是普通的单一 GGUF 格式模型(如常规的 `qwen2.5:7b`), Ollama 底层走的是传统的单一大层传输逻辑, 该变量不会对它产生影响.
   * 它主要在拉取/推送包含多个分块权重文件的格式(如分片 safetensors)时发挥关键作用.
2. 切忌盲目设置过大:
   * 某些模型托管服务(如 Hugging Face 或部分 CDN 镜像)有单个 IP 的频控(Rate Limiting)策略. 如果你将其设为 `64` 或更高, 可能会触发对方防火墙的反爬/防刷保护, 直接返回 `429 Too Many Requests`. 日常高速网络设为 `8 ~ 16` 即可达到理想上限.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_MODELS:/root/.ollama/models
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在部署与运维 Ollama 服务时, `OLLAMA_MODELS:/root/.ollama/models` 是直接决定大模型存储物理位置的最核心存储层环境变量.

日志中输出的路径表明: 你的 Ollama 服务目前是以 `root` 超级用户身份(例如在 Linux 终端手动使用 `sudo` 运行, 或者在默认的 Docker 容器内)启动的, 因此默认把模型的持久化目录放在了 root 用户的家目录下.

---

### 一、核心含义与存储机制剖析

1. 变量功能:
   * `OLLAMA_MODELS`: 定义 Ollama 在执行 `ollama pull`、`ollama run` 或 `ollama create` 时, 模型权重文件和元数据在磁盘上的绝对存放路径.
2. 底层目录结构(内容寻址存储 CAS):
   如果你进入这个目录(`ls -la /root/.ollama/models`), 会发现它采用了与 Docker 镜像层类似的高效设计:
   * `manifests/`: 存放模型的轻量级清单元数据(类似于镜像 Tag, 记录模型各层 SHA256 哈希值、系统模板、参数规范).
   * `blobs/`: 核心数据实体(体积巨大). 所有的 GGUF 权重、分层参数均以 `sha256-xxxxxx` 命名的纯二进制文件保存在这里.
   * 去重优势: 如果两个模型共用了相同的底座层(例如同一个 7B 模型的普通版与微调版), Ollama 会在 `blobs/` 中复用同一块物理文件, 避免重复占用磁盘.

---

### 二、核心使用场景(为什么必须掌握它?)

在本地大模型生产环境中, 几乎 90% 的运维事故都与该变量的默认配置有关:

#### 场景 1: 防止系统根分区(`/`)或 Windows C 盘被"撑爆"

* 痛点: 通常 Linux 云服务器或物理机的根分区(`/`)划分较小(如 40GB ~ 60GB), 专门用来装系统; 另外挂载了数百 GB 甚至数 TB 的独立数据盘(如 `/data`、`/mnt` 或 Windows 的 `D盘`).
* 灾难: 一个 7B 模型约 5GB, 14B 模型约 9GB, 70B 模型高达 40GB+. 默认留在 `/root` 目录下, 随便拉取两三个模型就会直接把操作系统的系统盘彻底打满(Disk 100% Full), 导致操作系统死锁、SSH 连不上、数据库崩溃.
* 解决: 必须通过 `OLLAMA_MODELS` 将存储路径重定向到挂载的大容量数据盘上.

#### 场景 2: 将模型迁移至高速 NVMe SSD(大幅缩短冷启动时延)

* 痛点: 大模型第一次加载(Cold Start)需要从磁盘把几十 GB 权重读入显存. 如果在机械硬盘(HDD)或低速 SATA 固态上, 加载 70B 模型需要几分钟.
* 解决: 将 `OLLAMA_MODELS` 指向专用的高速 PCIe 4.0/5.0 NVMe 固态挂载点, 顺序读速可达 5000+ MB/s, 大模型冷启动只需几秒钟.

#### 场景 3: 多容器 / 多应用数据共享(避免重复下载)

* 痛点: 本地可能启动了多个 Ollama 实例进行并行开发或测试. 如果每个容器都独立拉取模型, 每个实例都要花几十分钟下载重复的 40GB 权重.
* 解决: 宿主机指定统一的 `OLLAMA_MODELS` 路径, 所有容器只需将该宿主机目录作为只读或读写 Volume 挂载, 即可多实例秒级共享所有本地已有模型.

#### 场景 4: 纯内网/离线机房的"模型冷迁移"

* 需求: 机房服务器完全断网, 无法执行 `ollama pull`.
* 解决: 在外网机器上拉取完毕后, 把 `OLLAMA_MODELS` 整个目录打包拷贝到离线服务器上, 指定该环境变量, 离线服务器即可直接认出所有模型.

---

### 三、跨平台默认路径速查

| 操作系统 / 运行方式           | 默认物理存放路径                                     |
| :---------------------------- | :--------------------------------------------------- |
| Linux(root 身份运行 / Docker) | `/root/.ollama/models` (你当前所处的状态)            |
| Linux(systemd 官方守护进程)   | `/usr/share/ollama/.ollama/models`                   |
| Linux(普通用户终端直接运行)   | `~/.ollama/models`(即 `/home/用户名/.ollama/models`) |
| macOS                         | `~/.ollama/models`                                   |
| Windows                       | `C:\Users\<用户名>\.ollama\models`                   |

---

### 四、实战配置与已有数据无损迁移指南

如果你希望将模型存储位置从默认的 `/root/.ollama/models` 迁移到更大的数据盘(例如 `/data/ollama/models`):

#### 步骤 1: 完整迁移已有数据(保留历史下载的模型)

```bash
# 1. 先停掉当前 Ollama 服务, 防止写入冲突
sudo systemctl stop ollama  # 或者杀死前台运行的进程

# 2. 创建新的目标存储目录
sudo mkdir -p /data/ollama/models

# 3. 将原目录的数据完整同步到新目录(保留权限与属性)
sudo rsync -avP /root/.ollama/models/ /data/ollama/models/
# 或者: sudo cp -r /root/.ollama/models/* /data/ollama/models/
```

#### 步骤 2: 在不同环境中注入新的环境变量

##### 场景 A: Linux 生产系统服务(systemd 守护进程部署)

1. 编辑系统单元服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入新路径:

```ini
[Service]
Environment="OLLAMA_MODELS=/data/ollama/models"
```

3. ⚠️ 关键权限修复(极重要, 见后文避坑):
   如果你的 systemd 服务是以系统用户 `ollama` 运行的, 必须赋予权限:

```bash
sudo chown -R ollama:ollama /data/ollama/models
```

4. 重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 场景 B: Linux / macOS 终端临时指定启动

```bash
export OLLAMA_MODELS="/data/ollama/models"
ollama serve
```

##### 场景 C: Windows 系统永久修改(挪出 C 盘)

1. 假设你想搬到 `D:\ollama\models`, 先将原 `C:\Users\你的名字\.ollama\models` 里的文件复制过去.
2. 打开"系统属性 -> 环境变量 -> 系统变量", 新建:
   * 变量名: `OLLAMA_MODELS`
   * 变量值: `D:\ollama\models`
3. 彻底退出任务栏托盘里的 Ollama 桌面程序并重新打开.

##### 场景 D: Docker 容器化持久化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_MODELS="/data/ollama/models" \
  -v /宿主机大容量路径/models:/data/ollama/models \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 五、架构师级避坑指南

1. Linux 权限陷阱(Permission Denied):
   * 官方的 Linux 一键安装脚本默认会创建一个名为 `ollama` 的系统无登录账户作为服务运行者.
   * 如果你在 `/data` 目录下用 `root` 创建了新目录并复制了文件, 但忘记执行 `chown -R ollama:ollama`, Ollama 启动后拉取新模型时会立即崩溃, 报 `open /data/ollama/models/blobs/...: permission denied`.
2. 切勿手动改动 `blobs` 内的文件名:
   * `blobs/` 内的所有文件名都是文件内容做哈希(SHA256)后的散列码.
   * 绝对不要手动往里面扔自己下载的 `my-model.gguf` 并重命名, 这样会导致哈希校验链断裂, Ollama 永远无法识别. 如果需要导入第三方 GGUF, 必须走标准途径: 编写 `Modelfile` 执行 `FROM /path/to/model.gguf` 然后通过 `ollama create` 规范导入.
3. 软链接(Symlink)替代方案:
   * 如果你不想动任何环境变量, 也有一个简单粗暴的"偷梁换柱"方案:

```bash
mv /root/.ollama/models /data/ollama/models
ln -s /data/ollama/models /root/.ollama/models
```

     让原来的路径变成指向新大容量硬盘的软链接, 效果完全等同.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_NOHISTORY:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的安全与交互配置体系中, `OLLAMA_NOHISTORY:false` 是一个专门用于控制终端交互模式(`ollama run`)下是否将用户输入的 Prompt 历史持久化记录到磁盘的隐私安全开关.

日志中显示的 `false` 是官方默认值, 代表系统默认会记录并保存你在终端敲下的每一句对话历史.

---

### 一、核心含义与底层存储机制

#### 1. 它是如何工作的?

当你使用命令行交互模式与模型聊天时(如 `ollama run qwen2.5:7b`), Ollama 底层使用 Readline / Liner 库来支持命令行的行编辑.

* 当 `false`(默认)时: 你输入的每一句提问、代码片段或系统指令, 都会被自动、明文追加写入到本地磁盘的一个历史文件中.
  * 作用: 这让你可以像在 Linux 终端用 Bash 一样, 随时按下键盘的 `↑`(上箭头)和 `↓`(下箭头) 来快速翻阅、重放之前输入过的长提示词.
* 当 `true` / `1` 时: 彻底关闭磁盘写入. 你在该次会话中输入的所有内容, 只暂存在当前的内存进程中; 一旦按下 `Ctrl+D` 或输入 `/bye` 退出终端, 磁盘上不会留下任何你曾经提问过的痕迹.

#### 2. 默认历史文件保存在哪里?

如果不主动关闭, 你的全部历史提示词都以明文形式静默保存在:

* Linux / macOS: `~/.ollama/history`
* Windows: `C:\Users\<你的用户名>\.ollama\history`

---

### 二、核心使用场景

在很多大模型应用安全规范中, `OLLAMA_NOHISTORY` 属于核心防泄漏配置:

#### 场景 1: 输入敏感商业数据、凭据与私密代码(合规与防泄密)

* 痛点: 在用本地模型排查 Bug、处理合同、或者清洗敏感数据时, Prompt 中可能会粘贴公司内部 API 密钥、数据库连接串、未公开的源码、患者病历或敏感财务报表.
* 风险: 即使大模型本身部署在本地没有上传公网, 但这些敏感内容已经被全量明文写入了本地的 `~/.ollama/history` 文件! 如果电脑失窃、被同事借用, 或者遭受恶意软件扫描, 该文件会直接导致敏感数据泄露.
* 对策: 启动前声明 `OLLAMA_NOHISTORY=1`, 确保关键数据"阅后即焚, 不落磁盘".

#### 场景 2: 共享堡垒机 / 多人共用跳板机(Multi-user Host)

* 痛点: 在公司或实验室的共享 Linux 服务器上, 多名开发人员常常使用同一个系统账户或公共开发机进行调试.
* 风险: 下一位开发者登录服务器打开 `ollama run`, 按几下键盘 `↑` 键, 就能一清二楚地看到上一位用户输入的所有私人提问与聊天内容.
* 对策: 在个人环境变量中开启该开关, 防止提问记录被其他共用账号的人翻阅.

#### 场景 3: 自动化脚本与测试流(防止无意义文件膨胀)

* 痛点: 在自动化 CI/CD 流程中通过终端批处理调用 `ollama run`, 成千上万次测试调用会把 `~/.ollama/history` 撑得非常大.
* 对策: 开启无历史模式, 避免频繁的磁盘随机 I/O 和文件膨胀.

---

### 三、具体配置与使用示例

> 特别提醒:
> 该变量虽然在 `ollama serve`(服务端)启动时会被配置注册表统一打印, 但它在本质上是一个客户端(CLI)环境变量, 只对执行 `ollama run` 的终端生效!
>

#### 示例 1: 单次会话临时开启"隐私无痕模式"

如果只是本次提问包含敏感商业机密, 直接在命令前注入:

* Linux / macOS:

```bash
# 仅在本次运行中禁用历史记录落盘
OLLAMA_NOHISTORY=1 ollama run qwen2.5:7b
```

* Windows(PowerShell):

```powershell
$env:OLLAMA_NOHISTORY="1"; ollama run qwen2.5:7b
```

---

#### 示例 2: 为个人账户永久开启"无痕模式"(推荐安全实践)

如果你希望以后任何时候敲 `ollama run` 都不在本地保存提问历史:

* Linux / macOS(Bash 或 Zsh):
  编辑你的个人 Shell 配置文件(`~/.bashrc` 或 `~/.zshrc`), 在末尾追加:

```bash
# 永久禁用 Ollama 终端提问历史落盘
export OLLAMA_NOHISTORY=1
```

  保存后使其生效:

```bash
source ~/.bashrc
```

* Windows 永久生效:
  在"系统属性 -> 环境变量 -> 用户变量"中新建:
  * 变量名: `OLLAMA_NOHISTORY`
  * 变量值: `1`

---

#### 示例 3: 彻底清理历史遗留的痕迹

如果开启该变量前, 你已经使用 Ollama 很久了, 建议顺手把过去遗留的明文历史文件彻底擦除:

* Linux / macOS:

```bash
# 查看历史记录了什么
cat ~/.ollama/history

# 彻底删除它
rm -f ~/.ollama/history
```

* Windows:

```powershell
Remove-Item -Path "$env:USERPROFILE\.ollama\history" -Force
```

---

### 四、架构师级关键避坑(社区常见误区)

#### 为什么在 `ollama.service` 里加了它却"不管用"?

很多运维工程师在部署后台服务时, 通过 `systemctl edit ollama.service` 添加了 `Environment="OLLAMA_NOHISTORY=1"`, 然后发现自己在终端执行 `ollama run` 时, 按上下箭头依然能翻出历史记录!

* 原因剖析:
  * `ollama.service` 启动的是后台服务端(Server Daemon), 它只负责监听端口处理 HTTP 请求, 它根本不负责终端输入行编辑.
  * `ollama run` 是你作为普通终端用户在本地 Shell 里拉起的 CLI 客户端程序. 客户端运行在你的终端进程树下, 根本读取不到 systemd 守护进程里的局部环境变量!
* 正确做法:
  * 必须将 `export OLLAMA_NOHISTORY=1` 注入到执行 `ollama run` 命令的那个用户的 Shell 环境中(如 `~/.bashrc`), 而不是塞给后台 systemd 服务.

---

### 五、总结

| 变量状态      | 是否保存历史               | 能否按上下箭头(↑/↓)追溯?             | 适用场景                                                   |
| :------------ | :------------------------- | :----------------------------------- | :--------------------------------------------------------- |
| `false`(默认) | 保存到 `~/.ollama/history` | 可以跨会话翻阅历史输入               | 个人独享安全电脑、日常写提示词需要反复修改测试.            |
| `true` 或 `1` | 不落盘, 进程退出即销毁     | 仅在当前这次交互有效, 关闭终端即遗忘 | 敏感凭据/商业机密输入、多用户共用服务器、严格隐私合规要求. |

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_NOPRUNE:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的存储管理与垃圾回收(Garbage Collection, GC)体系中, `OLLAMA_NOPRUNE:false` 是一个控制"服务启动时是否自动清理(修剪)无用、孤立的模型数据分块(Blobs)"的存储级环境变量.

日志中显示的 `false` 是官方默认值, 代表系统默认开启开机自动垃圾清理(Pruning Enabled).

---

### 一、核心含义与底层存储机制

#### 1. 源码定义与命名拆解

* `NO_PRUNE`: 不修剪、不修剪清理.
* 源码注释: `"Do not prune model blobs on startup"`(服务启动时不要清理模型孤立数据块).
* 默认状态(`false`): 否定之否定, 即"允许在启动时执行 Prune 修剪".

#### 2. 它是如何工作的? (Manifest vs Blobs)

Ollama 的模型存储采用类似 Docker 镜像的内容寻址架构:

* `manifests/`: 记录所有合法模型的标签清单(索引指引文件).
* `blobs/`: 实际存放巨额模型权重和分层的物理文件(以 `sha256-...` 命名).

开机清理逻辑(当其为 `false` 时):
每次 Ollama 服务冷启动(`ollama serve`)时, 存储引擎会自动扫描 `manifests/` 下的所有合法模型, 并遍历 `blobs/` 目录:

* 如果某个 Blob 既不属于任何现有模型, 也没有正在活跃的任务引用它(通常称为"孤儿 Blobs / Orphan Blobs"), Ollama 会在开机时直接执行物理删除, 并在日志中打印:
  > `msg="total unused blobs removed: X"`
* 当其设为 `true` / `1` 时: 强制跳过开机垃圾回收, 磁盘上所有未关联的 Blobs 哪怕无人引用, 也会被完整原样保留在磁盘中.

---

### 二、核心使用场景

虽然默认的清理机制有助于节省磁盘空间, 但在以下场景中, 开启 `OLLAMA_NOPRUNE=true` 可以挽救大量时间和带宽:

#### 场景 1: 超大模型下载中断与断点续传保护(最关键救命场景)

* 痛点: 在拉取 70B 或超大多分卷模型(如 40GB~100GB 的 Llama 3 / DeepSeek)时, 由于网络波动、断电或机器重启, 下载被迫中断在 80%.
* 默认机制的灾难:
  * 因为模型还没下载完, `manifests/` 中尚未生成最终索引. 此时如果 Ollama 服务重启(比如系统定时重启、或 Docker 容器挂掉重新拉起), Ollama 扫描发现磁盘上躺着好几十 GB 未注册的临时分块, 会把它们全部视作"垃圾孤儿数据"并在开机时直接彻底删光!
  * 当你再次执行 `ollama pull` 时, 只能从 0% 重新绝望开跑.
* 解决: 配置 `OLLAMA_NOPRUNE=true`. 开机时坚决不删任何残余分块, 下次执行 `ollama pull` 时, 系统能成功匹配本地已有的 SHA256 切片, 实现真正的断点续传(Resume Download)!

#### 场景 2: Modelfile 本地自建实验与版本回退(防误删)

* 痛点: 模型工程师经常通过 `Modelfile` 频繁微调或构建本地模型(`ollama create`).
* 风险: 如果你删除了某个临时模型 Tag(`ollama rm test-model`), 底层几十 GB 的 GGUF 权重 Blob 会暂时游离. 如果你突然反悔想重新用原来的 Blob 构建, 或者在排障时不希望大文件被开机自动清退.
* 解决: 开启此开关, 即使删除了 Tag, 物理数据分块依然常驻磁盘, 方便随时快速重新绑定或回退.

#### 场景 3: 磁盘损坏取证与脱机排障

* 需求: 怀疑磁盘上有部分 GGUF 分块发生了静默数据损坏(Bit Rot), 或者需要提取未完成拉取的底层原始二进制层进行分析.
* 解决: 禁用修剪, 防止重启时证据被系统自动抹除.

---

### 三、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(长期开启断点保护)

如果你的网络环境较弱, 经常在拉取大模型时中断, 建议将该保护长期开启:

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启参数(`true` 或 `1` 均可):

```ini
[Service]
# 阻止开机自动修剪未完成的模型分块, 确保断点续传生效
Environment="OLLAMA_NOPRUNE=true"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行(拯救中断的下载)

假设一个大模型下载到一半网络中断, 服务重启:

```bash
# 1. 声明禁止清理
export OLLAMA_NOPRUNE=true

# 2. 启动服务(此时孤立的半成品分块不会被删除)
ollama serve

# 3. 在另一终端重新发起拉取, 自动续传
ollama pull deepseek-r1:70b
```

---

#### 示例 3: Windows 本地部署环境

* PowerShell 启动测试:

```powershell
$env:OLLAMA_NOPRUNE="true"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_NOPRUNE`
  * 变量值: `true`
  重启任务栏右下角的 Ollama 桌面程序即可.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_NOPRUNE=true \
  -v ollama_storage:/root/.ollama \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 四、架构师级关键避坑与权衡

| 设定值        | 核心行为                                        | 核心优势                              | 潜在风险                                                        |
| :------------ | :---------------------------------------------- | :------------------------------------ | :-------------------------------------------------------------- |
| `false`(默认) | 开机自动进行 GC 垃圾回收, 删除所有游离的 Blobs. | 保持磁盘整洁, 绝不浪费哪怕 1MB 存储.  | 服务重启后, 未下完的超大模型断点丢失, 必须从头下载.             |
| `true`        | 永远不执行开机修剪, 保留所有未引用的 Blobs.     | 完美保护断点续传, 杜绝大文件重复拉取. | 磁盘静默膨胀: 失败过很多次的废弃分块会永久积压, 需定期人工清理. |

> 最佳运维建议:
> * 在下载频繁或网络脆弱的开发测试期: 设置 `OLLAMA_NOPRUNE=true`, 能极大降低下载超大模型时的挫败感.
> * 在磁盘空间告急时: 临时将变量改回 `false`(或直接去掉), 并执行一次 `sudo systemctl restart ollama`, 系统就会在启动时自动把所有积压的陈年垃圾 Blobs 一扫而空, 瞬间释放大量磁盘空间!

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_NO_CLOUD:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的安全合规与混合云架构中, `OLLAMA_NO_CLOUD:false` 是一个用于强制开启"纯本地隔离模式(Local-Only Mode)", 切断一切云端托管推理与云检索的数据防外流安全开关.

日志中显示的 `false` 是官方默认值, 代表当前服务处于"未禁止云端功能"的缺省状态.

---

### 一、核心含义与技术演进背景

#### 1. 为什么本地运行的 Ollama 会有"云端功能"?

随着生态演进, Ollama 引入了混合云服务特性(Ollama Cloud):

* 用户无需在本地下载几十 GB 的大模型, 只要通过客户端调用带 `:cloud` 后缀的模型(如 `gemma4:cloud`), 本地的 Ollama 服务就会通过 API 密钥自动将请求转发到官方云端(`ollama.com`)执行远程推理.
* 同时, Ollama 还集成了基于云端的网络搜索增强(Web Search)能力.

#### 2. `OLLAMA_NO_CLOUD` 的底层行为

* 当为 `false`(默认)时:
  云端通道保持开启. 如果上层应用向 `http://localhost:11434` 请求了一个云端模型, 本地的 Ollama 守护进程会将用户的 Prompt 发送至远端 `ollama.com` 执行, 并将生成的答案流式传回本地.
* 当设为 `true` 或 `1` 时:
  强制激活纯本地硬隔离模式(Local-Only Mode).
  * 彻底注销并屏蔽所有远程推理接口与云端 Web 搜索;
  * 开机日志会明确打印: `Ollama cloud disabled: true`;
  * 如果任何客户端试图调用云端模型, 本地服务会在第一道防线直接拦截拒绝, 抛出错误: `ollama cloud is disabled`.

---

### 二、核心痛点与使用场景

很多开发者选择 Ollama, 本质诉求就是数据不出本地. 但在默认状态下, 存在一个巨大的安全与隐私陷阱:

#### 场景 1: 防范"假本地、真外流"的数据合规陷阱(最核心痛点)

* 痛点:
  你在公司内网把 Ollama 跑在 `http://127.0.0.1:11434`, 开发团队以为所有请求都在这台物理机内部消化. 但如果在接入 Open WebUI、Dify、Cursor 或私有代码助手时, 某位员工不小心在配置中选了一个带 `:cloud` 标识的模型名称:
  * 即便你的应用请求地址写的是 `localhost:11434`, 用户的输入(包含内部敏感商业代码、商业合同、财务流水)依然会被本地进程自动转交到外网第三方服务器!
* 解决: 在企业部署模板中固化 `OLLAMA_NO_CLOUD=1`, 从协议层彻底剥离云端路由逻辑, 杜绝任何意外或恶意的数据外溢.

#### 场景 2: 金融、医疗、军工等严苛审计环境(Zero-Data-Exfiltration)

* 需求: 满足 HIPAA、GDPR、数据安全法等合规要求. 合规审计人员需要证明: 大模型推理服务即使遭遇配置漂移, 也在代码级无法向外发送对话载荷.
* 解决: 提供该环境变量配置证据, 向审计系统证明系统处于无云模式(No Cloud Mode).

#### 场景 3: 纯内网 / 离线机房环境(Air-Gapped Networks)

* 痛点: 算力集群部署在没有任何外网访问权限的专网中. 如果配置误触发了云端搜索或云端模型, 请求会在长时间等待握手超时后报错.
* 解决: 关闭云端功能, 使非法请求在毫秒级就地快速失败(Fail-Fast).

---

### 三、具体配置与使用示例

该开关支持通过环境变量或服务配置文件两种方式激活:

#### 方式 1: 通过环境变量配置(最推荐)

##### 示例 1: Linux 生产系统服务(systemd 守护进程部署)
1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启参数(将值设为 `1` 或 `true`):

```ini
[Service]
# 彻底切断任何云端推理和外部搜索通道
Environment="OLLAMA_NO_CLOUD=1"
```

3. 保存重载并重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 示例 2: Linux / macOS 终端临时运行

```bash
export OLLAMA_NO_CLOUD=1
ollama serve
```

##### 示例 3: Windows 本地部署

* PowerShell 启动:

```powershell
$env:OLLAMA_NO_CLOUD="1"
ollama serve
```

* 系统环境变量配置:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_NO_CLOUD`
  * 变量值: `1`

##### 示例 4: Docker 容器化生产部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_NO_CLOUD=1 \
  -p 11434:11434 \
  --name ollama-secure \
  ollama/ollama
```

---

#### 方式 2: 通过服务端配置文件(`server.json`)

除了环境变量, Ollama 还支持在配置目录写入 JSON 配置:

* Linux / macOS 路径: `~/.ollama/server.json`
* Windows 路径: `%USERPROFILE%\.ollama\server.json`

编辑该文件加入:

```json
{
    "disable_ollama_cloud": true
}
```

效果与 `OLLAMA_NO_CLOUD=1` 完全等价.

---

### 四、验证生效与边界认知

#### 1. 如何确认它真正生效了?

重启服务后, 查看系统输出日志:

```bash
journalctl -u ollama.service -e | grep -i "cloud"
```

只要看到类似如下日志输出, 即代表已进入绝对安全模式:

> `Ollama cloud disabled: true`
>

#### 2. 行为边界辨析: 它会阻止下载模型吗?

* 不会阻断: 它绝对不会阻止你执行 `ollama pull` 从开源模型库(`registry.ollama.ai`)正常下载开源 GGUF 权重.
* 专门阻断: 它仅阻断以"租用远程算力"为目的的端到端推理数据外发(即向 `ollama.com` 上传 Prompt 获取回复的过程)以及外网 Web 搜索.

> 研究员建议:
> 如果你的部署初衷是为了打造一个私有化、不依赖第三方、完全掌控数据生命周期的本地 AI 基础设施, 强烈建议将 `OLLAMA_NO_CLOUD=1` 作为生产环境的强制基线标配.
>

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_ORIGINS:[
    http://localhost
    https://localhost
    http://localhost:*
    https://localhost:*
    http://127.0.0.1
    https://127.0.0.1
    http://127.0.0.1:*
    https://127.0.0.1:*
    http://0.0.0.0
    https://0.0.0.0
    http://0.0.0.0:*
    https://0.0.0.0:*
    app://*
    file://*
    tauri://*
    vscode-webview://*
    vscode-file://*
]
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Web 安全架构与前后端通信规范中, `OLLAMA_ORIGINS` 是一个专门用于控制 CORS(Cross-Origin Resource Sharing, 跨域资源共享)白名单的核心应用层安全变量.

你在日志中看到的这长串默认列表, 正是 Ollama 服务端向浏览器声明的"允许跨域直接调用其 HTTP API 的前端源(Origins)清单".

---

### 一、核心含义与默认白名单拆解

#### 1. 为什么浏览器需要 CORS?

现代浏览器出于安全考虑, 严格遵循同源策略(Same-Origin Policy, SOP).

* 如果你的前端网页运行在 `https://chat.mycompany.com`;
* 而该网页试图在用户浏览器中直接通过 JavaScript 发送 `fetch("http://192.168.1.100:11434/api/generate")`;
* 浏览器会首先发起一个 `OPTIONS` 预检请求询问 Ollama: "你允许来自 `https://chat.mycompany.com` 的前端直接调用你吗?"
* 如果该域名不在 `OLLAMA_ORIGINS` 白名单中, 浏览器就会在控制台报错并拦截数据:
  > `Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource... (Reason: CORS header 'Access-Control-Allow-Origin' missing)`

#### 2. 日志中默认白名单的"精妙设计"

Ollama 在未配置该变量时, 默认输出的列表覆盖了本地绝大多数桌面与开发场景:

| 默认放行的 Origin 规则                     | 对应的实际前端客户端场景                                                  |
| :----------------------------------------- | :------------------------------------------------------------------------ |
| `http://localhost:*`、`http://127.0.0.1:*` | 本地运行在任何端口的 Web 界面(如本地 Vite/Node/Docker 开发服务).          |
| `app://*`、`file://*`                      | 基于 Electron 壳开发的跨平台桌面客户端(如 Chatbox、Obsidian 插件).        |
| `tauri://*`                                | 基于 Rust Tauri 框架开发的超轻量桌面客户端(如 NextChat 桌面版).           |
| `vscode-webview://*`、`vscode-file://*`    | VS Code 内部插件的侧边栏大模型交互视图(如 Continue.dev、Cline、Roo Code). |

> 这正是为什么你在本地安装 VS Code 插件或桌面客户端时, 从来不用配 CORS 就能直接连上 Ollama 的根本原因!
>

---

### 二、核心痛点与使用场景

既然默认列表已经这么完善, 为什么在生产或团队协作中常常必须修改它?

#### 场景 1: 公网 / 托管部署的第三方 Web 客户端调用(最常撞墙场景)

* 痛点: 很多团队为了轻量化, 直接使用托管在 Vercel、GitHub Pages 或外部服务器上的静态 Web 客户端(例如网页版 NextChat、LibreChat, 访问地址形如 `https://my-chat.vercel.app`).
* 冲突: 当用户在浏览器打开该网页, 填入你内网服务器的 IP 调用模型时, `https://my-chat.vercel.app` 绝不在上面的默认白名单中! 浏览器当场拦截, 报红 CORS 错误.
* 解决: 必须通过 `OLLAMA_ORIGINS` 显式放行该前端域名, 或直接设为通配符 `*`.

#### 场景 2: 局域网(LAN)多机前后端分离部署

* 痛点:
  * 前端服务部署在 `http://192.168.1.50:8080`;
  * Ollama 服务运行在 GPU 算力机 `http://192.168.1.100:11434`.
* 冲突: 默认的白名单只认 `localhost` 和 `127.0.0.1`, 根本没有放行任何局域网 IP(`192.168.*`)! 虽然网络在 TCP 层面通了, 但浏览器依然会执行 CORS 拦截.
* 解决: 将局域网前端来源追加到白名单中.

#### 场景 3: 企业内网安全合规(收紧白名单)

* 需求: 虽然粗暴设置 `*` 能解决一切跨域报错, 但出于安全审计要求, 生产集群绝对禁止完全开放 CORS, 必须明确限定只能由公司专属的内网统一门户(如 `https://ai.internal.corp`)访问.

---

### 三、架构师级关键辨析: `OLLAMA_HOST` 与 `OLLAMA_ORIGINS`

这是 Ollama 初学者最常混淆的一对环境变量:

```bash
                    客户端发起请求
                          │
  [网络层 / Socket 监听] ── 依赖 OLLAMA_HOST=0.0.0.0
                          │ (决定物理数据包能否连进 11434 端口)
                          ▼
  [应用层 / 浏览器安全]   ── 依赖 OLLAMA_ORIGINS
                          │ (决定浏览器是否允许读取返回的响应数据)
                          ▼
                     成功获得模型回复
```

* `OLLAMA_HOST=0.0.0.0`: 解决的是网络通不通的问题(是否允许外部机器的 IP 建立 TCP 连接);
* `OLLAMA_ORIGINS`: 解决的是浏览器认不认的问题(针对由浏览器发起的网页端跨域通信);
* 结论: 只要你是在另一台机器的浏览器里访问 Ollama, 这两个变量必须同时配置才能正常通信!

---

### 四、具体配置与使用示例

该变量支持传入单个域名、逗号分隔的多域名列表, 或通配符通配:

#### 示例 1: Linux 生产系统服务(推荐团队开放配置)

##### 方案 A: 完全放开通配符(适合纯内网、开发测试环境)

允许任意网站、任意前端无限制跨域调用:

1. 编辑系统服务:

```bash
sudo systemctl edit ollama.service
```

2. 注入全局通配:

```ini
[Service]
# 绑定所有网卡, 允许局域网访问
Environment="OLLAMA_HOST=0.0.0.0"
# 允许所有前端来源跨域调用
Environment="OLLAMA_ORIGINS=*"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

##### 方案 B: 严格安全模式(仅允许指定的内网及托管域名)

```ini
[Service]
Environment="OLLAMA_HOST=0.0.0.0"
# 仅允许公司指定的前端域名和局域网前端
Environment="OLLAMA_ORIGINS=https://ai.mycompany.com,http://192.168.1.*"
```

---

#### 示例 2: Linux / macOS 终端临时运行验证

```bash
# 允许任意来源跨域访问
export OLLAMA_ORIGINS="*"
export OLLAMA_HOST="0.0.0.0"

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置

* PowerShell 启动测试:

```powershell
$env:OLLAMA_ORIGINS="*"
$env:OLLAMA_HOST="0.0.0.0"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_ORIGINS`
  * 变量值: `*`
  重启任务栏右下角的 Ollama 桌面程序.

---

#### 示例 4: Docker 容器化生产部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_HOST="0.0.0.0" \
  -e OLLAMA_ORIGINS="*" \
  -p 11434:11434 \
  --name ollama-cors \
  ollama/ollama
```

---

### 五、避坑与安全审计风险(CSRF 与路过式攻击)

设置 `OLLAMA_ORIGINS="*"` 虽然极度省心, 但你必须知晓其带来的安全攻防风险:

1. 路过式攻击(Drive-by Local Exploitation):
   * 假设你的本地或内网运行着包含敏感知识库或无鉴权的 Ollama, 且设置了 `OLLAMA_ORIGINS=*`.
   * 当内网员工在同一个浏览器里访问了一个包含恶意脚本的外部网页时, 该网页的恶意 JavaScript 就可以神不知鬼不觉地在后台向 `http://localhost:11434/api/chat` 发送请求!
   * 恶意网站可以偷取你的本地对话模型、窃取未授权的提示词输出, 或者用海量请求恶意打满你的 GPU 算力.
2. 生产环境建议:
   * 开发测试 / 纯封闭离线局域网: 使用 `OLLAMA_ORIGINS="*"` 追求最高效率;
   * 生产环境 / 可连接公网的办公网: 强烈建议采用白名单制度, 精确枚举允许的域名(如 `https://chat.example.com`), 并将未受保护的 11434 端口置于带有 API Key 鉴权的反向代理(如 Nginx、Envoy)之后.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_REMOTES:[ollama.com]
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 的网络安全与远程模型路由体系中, `OLLAMA_REMOTES:[ollama.com]` 是一个控制"远程模型(Remote Models / Cloud Models)允许连接的外部目标主机白名单"的核心安全环境变量.

日志中输出的 `[ollama.com]` 是系统官方预设的缺省白名单, 代表当前服务默认只信任并允许与官方的 `ollama.com` 进行远程模型通信.

---

### 一、核心含义与源码工作机制

#### 1. 源码定义

在 Ollama 源码(`envconfig/config.go`)中, 该变量定义如下:

```go
"OLLAMA_REMOTES": {"OLLAMA_REMOTES", Remotes(), "Allowed hosts for remote models (default \"ollama.com\")"}
```

当环境变量未设置时, 函数 `Remotes()` 会默认返回一个包含单个元素的切片: `[]string{"ollama.com"}`.

#### 2. 底层运行拦截机制(Guardrail)

在请求路由层(`server/routes.go`), 当客户端请求运行一个带有远程主机配置的模型(例如企业自建的远程模型或 Ollama Cloud 模型)时, Ollama 会在发起网络外联之前, 执行严格的主机名校验:

```go
// 检查目标远端主机是否在白名单切片中
if !slices.Contains(envconfig.Remotes(), remoteURL.Hostname()) {
    slog.Info("remote model", "remotes", envconfig.Remotes(), "remoteURL", m.Config.RemoteHost, "hostname", remoteURL.Hostname())
    c.JSON(http.StatusBadRequest, gin.H{"error": "this server cannot run this remote model"})
    return
}
```

* 如果目标域名在 `OLLAMA_REMOTES` 中: 请求被允许向远端发起连接并流式传输.
* 如果目标域名不在该白名单中: Ollama 服务端会直接在本地中断请求, 返回 HTTP 400 错误:
  > `{"error": "this server cannot run this remote model"}`

---

### 二、核心使用场景

虽然官方默认填入了 `ollama.com`, 但在企业私有化部署、混合云推理和零信任安全架构中, 该变量至关重要:

#### 场景 1: 企业自建模型网关(Private AI Gateway / Proxy)

* 背景: 大型企业通常会在内部搭建专有的大模型统一中台(如 `ai-gateway.internal.corp` 或内部算力集群), 并希望通过 Ollama 的远程模型机制将本地轻量客户端的请求透明路由至内网中台.
* 痛点: 默认白名单只有 `ollama.com`, 任何指向企业内部远端主机 `ai-gateway.internal.corp` 的远程模型请求, 都会被本地 Ollama 报错拦截(`cannot run this remote model`).
* 解决: 配置 `OLLAMA_REMOTES="ai-gateway.internal.corp"`, 将内网网关加入信任列表.

#### 场景 2: 安全合规下的"官方云端剥离"(只留私有远端)

* 痛点: 某些保密单位允许将请求发往内部私有托管节点, 但严禁连接公网的 `ollama.com`, 以防员工误调用官方公有云模型导致数据出境.
* 解决: 显式覆盖该变量为企业私有节点, 例如 `OLLAMA_REMOTES="private-llm.mycompany.com"`. 此时 `ollama.com` 会被自动踢出白名单, 任何尝试连往 Ollama 官方公有云的操作都会在本地秒级被拒.

#### 场景 3: 多信任域混合云接入(Multi-Remote Setup)

* 需求: 算力机需要同时具备连接官方公共生态、战略合作伙伴算力池、以及企业自有推理中心的能力.
* 解决: 以逗号分隔传入多个域名, 构建多源可信远端白名单.

---

### 三、具体配置与使用示例

该变量接收以逗号分隔的域名/主机名列表:

#### 示例 1: Linux 生产系统服务(企业私网网关场景)

假设企业内部有统一的大模型推理网关 `llm-node.corp.local`, 并且希望保留官方 `ollama.com`:

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入多域名白名单:

```ini
[Service]
# 允许官方云端 + 企业内网专有推理网关
Environment="OLLAMA_REMOTES=ollama.com,llm-node.corp.local"
```

3. 保存并重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

4. 验证日志:
   重启后日志中会显示:
   `OLLAMA_REMOTES:[ollama.com llm-node.corp.local]`

---

#### 示例 2: 严格内网隔离(彻底踢出 `ollama.com`, 仅信任私有网关)

```bash
# 覆盖默认的 ollama.com, 仅放行公司内部私有服务
export OLLAMA_REMOTES="internal-ai.mycompany.net"

# 启动服务
ollama serve
```

此时如果有人尝试调用 `ollama run xxx:cloud` 访问公网官方服务, 本地将立即报错拒绝.

---

#### 示例 3: Windows 本地部署环境

* PowerShell 启动测试:

```powershell
$env:OLLAMA_REMOTES="ollama.com,ai.internal.lan"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_REMOTES`
  * 变量值: `ollama.com,ai.internal.lan`
  保存后重启右下角任务栏的 Ollama 桌面程序.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_REMOTES="ollama.com,192.168.10.200" \
  -p 11434:11434 \
  --name ollama \
  ollama/ollama
```

---

### 四、架构师级核心辨析: `OLLAMA_REMOTES` vs `OLLAMA_NO_CLOUD`

这是 Ollama 远程治理体系中经常配合使用的两个变量, 二者分工明确:

| 环境变量          | 治理层级                   | 核心角色与行为                                                                               |
| :---------------- | :------------------------- | :------------------------------------------------------------------------------------------- |
| `OLLAMA_NO_CLOUD` | 全局总闸(Kill-Switch)      | 一票否决权. 只要它为 `true`, 无论白名单配了什么, 系统都会彻底关闭所有远程推理与搜索引擎模块. |
| `OLLAMA_REMOTES`  | 细粒度放行名单(Allow-List) | 域名门禁. 在允许使用远程模型的前提下, 精细化规定哪些特定的 FQDN / 主机名是合法且受信任的.    |

> 最佳实践建议:
> * 如果你的机器是纯离线、完全单机运行, 建议直接使用 `OLLAMA_NO_CLOUD=1`, 干脆利落地关闭整个远端模块;
> * 如果你的机器处于企业混合云/私有网关架构中, 需要让本地 Ollama 充当路由跳板访问公司机房的超大算力池, 则保持 `OLLAMA_NO_CLOUD=false` 并通过 `OLLAMA_REMOTES` 严格填入公司内部的授权主机名, 构建起可靠的零信任推理通道.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_SCHED_SPREAD:false
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在多 GPU(Multi-GPU)异构算力调度体系中, `OLLAMA_SCHED_SPREAD:false` 是一个控制"多显卡环境下模型层切分与显存装载策略(Pack vs. Spread)"的核心调度环境变量.

日志中显示的 `false` 是官方默认值, 代表系统默认采用"单卡紧凑打包(Pack Strategy)"优先原则.

---

### 一、核心含义与调度哲学对比

当你的机器配备了多张显卡(如两张 RTX 4090, 或 4 张计算卡)时, Ollama 面对一个模型有两套截然相反的装载策略:

```bash
                ┌───────────────────────────────────────────────┐
                │ 策略 1: Pack 紧凑打包 (OLLAMA_SCHED_SPREAD=false) │ ── 默认
                │ 优先填满单张卡, 单卡能装下就绝不碰第二张卡    │
                └───────────────────────────────────────────────┘
                                       VS
                ┌───────────────────────────────────────────────┐
                │ 策略 2: Spread 均匀切分 (OLLAMA_SCHED_SPREAD=true)  │ ── 开启
                │ 无论模型大小, 强制把模型层均匀切分打散到所有显卡  │
                └───────────────────────────────────────────────┘
```

#### 1. 默认行为: `false`(紧凑装载 Pack)

* 逻辑: 当加载一个模型时, 调度器会计算该模型的体量. 如果单张显卡的显存足以容纳它, Ollama 会把 100% 的模型层装进 GPU 0, 保持 GPU 1 处于完全空闲状态.
* 自动触发切分的唯一条件: 只有当模型的体积超过了任何一张单卡物理显存上限(例如在两张 24GB 显卡上加载一个 40GB 的 70B 模型), Ollama 才会自动触发跨卡切分.

#### 2. 开启行为: `true` / `1`(强制均匀铺开 Spread)

* 源码注释: `"Always schedule model across all GPUs"`(强制将模型均匀分摊调度到所有可用显卡上).
* 逻辑: 无论模型多么轻量, 强制剥夺单卡独占权.
  * 示例: 一个只有 10GB 的 Qwen-14B 模型, 在两张 24GB 显卡上:
    * 默认(`false`): GPU 0 占 10GB(40 层全部放入), GPU 1 占 0GB;
    * 开启(`true`): GPU 0 占 5GB(装载前 20 层), GPU 1 占 5GB(装载后 20 层).

---

### 二、为什么 Ollama 默认选择 `false`(不打散)?

很多开发者直觉认为"把计算分摊到两张卡上肯定比单卡跑得快", 但从大语言模型的底层推理机制来看, 情况往往恰恰相反:

1. 自回归生成的串行物理瓶颈(PCIe 延迟墙):
   * LLM 的前向传播是严格层级依赖的(Layer 1 算完把隐藏状态传给 Layer 2, 以此类推).
   * 如果一张卡能装下, 所有数据直接在 GPU 内部高达 $1000\text{ GB/s}+$ 的片上高速显存(HBM/GDDR)中完成交换.
   * 如果强行切到两张卡上, 第 20 层的计算结果必须跨越主板的 PCIe 插槽传给第 21 层. 在缺乏专业 NVLink 高速桥接线的消费级主板上, PCIe 通信延迟非常大, 强行把小模型打散到两张卡上, 推理速度往往反而会下降 10% ~ 30%!
2. 多模型独立共存效率更高:
   * 将单卡留白, 可以让 GPU 0 运行 14B 对话模型, GPU 1 同时运行一个 Embedding 向量模型或代码助手, 彼此互不干扰, 资源利用率最高.

---

### 三、核心使用场景(何时推荐开启 `true`?)

尽管单卡优先更符合通用逻辑, 但在以下特定场景中, 配置 `OLLAMA_SCHED_SPREAD=1` 具有极其重要的工程价值:

#### 场景 1: 为"超长大文本(Massive Context)"腾出充足的 KV Cache 空间

* 痛点: 一个 14B 模型本体占 10GB 显存, 在一张 16GB 的显卡上能勉强塞下. 但如果你需要将上下文拉到 32K 或 64K, 单卡剩余的 6GB 显存根本不够存放庞大的 KV Cache, 导致模型被硬生生挤下 CPU.
* 对策: 开启 `OLLAMA_SCHED_SPREAD=1`. 模型权重被均分(两张卡各吃 5GB), 此时两张卡各自空出了 11GB 的海量显存, 可以轻松塞下高达 64K 的超长对话缓存!

#### 场景 2: 工作站温控与风噪平衡(避免单卡过热降频)

* 痛点: 深度学习工作站插了双卡, 如果全压在 GPU 0 上, 该卡功耗持续飙至 450W, 风扇狂暴啸叫且容易温度过热触碰降频墙(Thermal Throttling); 而一旁的 GPU 1 却低温闲置.
* 对策: 开启打散策略, 让两张卡各自以半载功耗(如各 200W)协同工作, 机箱整体散热更均衡, 风扇更安静, 大幅延长硬件寿命.

#### 场景 3: 双卡平摊高精度量化模型(如两张低配卡合力跑 Q8/FP16)

* 痛点: 拥有两张 12GB 显卡(如双 RTX 4070 / 3060). 想跑一个 14B 的 Q8 量化版本(需要约 16GB 显存). 任何单张卡都装不下.
* 对策: 开启均匀切分, 两张卡各装载 8GB, 合力无缝吃下高精度模型, 获得比 Q4 更好的生成质量.

---

### 四、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(systemd 守护进程部署)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启参数(`true` 或 `1` 均可):

```ini
[Service]
# 开启强制多卡均匀切分分摊
Environment="OLLAMA_SCHED_SPREAD=1"
```

3. 保存并重载服务:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Linux / macOS 终端临时运行验证

```bash
# 激活打散调度
export OLLAMA_SCHED_SPREAD=1

# 启动服务
ollama serve
```

---

#### 示例 3: Windows 本地配置(多卡工作站)

* PowerShell 启动测试:

```powershell
$env:OLLAMA_SCHED_SPREAD="1"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_SCHED_SPREAD`
  * 变量值: `1`
  重启 Ollama 任务栏托盘程序生效.

---

#### 示例 4: Docker 容器化部署

```bash
docker run -d \
  --gpus all \
  -e OLLAMA_SCHED_SPREAD=1 \
  -p 11434:11434 \
  --name ollama-dual-gpu \
  ollama/ollama
```

---

### 五、进阶验证与架构师避坑指南

#### 1. 如何肉眼验证模型已经被均匀切分?

运行模型并发起一次问答, 在另一个终端打开显卡监控:

```bash
watch -n 1 nvidia-smi
# 或者 AMD 用户运行
rocm-smi
```

* 当为 `false`(默认)且模型较小时: 你会看到 GPU 0 显存占用 12GB、GPU 算力利用率 95%, 而 GPU 1 显存为 0MB、利用率 0%.
* 当为 `true`(Spread 成功)时: 你会看到 GPU 0 和 GPU 1 的显存占用完全对等(例如各占 6GB), 且两张卡的 GPU 利用率指针同频跳动.

#### 2. 致命陷阱: 开启后导致后续模型报 OOM

这是开发者社区中最著名的踩坑点(GitHub Issue #7253):
* 现象: 开启 `OLLAMA_SCHED_SPREAD=1` 后, 你先调用了 Model A, 随后调用 Model B 时系统报错 OOM 崩溃!
* 原因剖析:
  * 如果采用默认的 `false`, Model A 只占 GPU 0, GPU 1 是完全纯净的, Model B 随时可以去 GPU 1 独立运行.
  * 一旦开启 `true`, Model A 会像摊煎饼一样, 把两张卡各自霸占一半. 如果 `OLLAMA_KEEP_ALIVE` 还没有到期释放, 当新模型想要加载时, 会发现两张卡都残存着前序模型的碎片, 由于没有整块连续的空闲卡可用, 系统便会直接抛出显存不足异常.

> 总结选型法则:
> * 追求极致低延迟(Latency-sensitive)、单卡装得下、且多任务共存: 保持日志中的默认值 `false`;
> * 追求超大 Context 显存缓冲、机箱散热均衡、或是低配置多卡合力: 主动设置为 `1`.

-------------------------------------------------------------------------------------------------------------------

Q: 假设你是一位精通 LLM 和 ollama 的高级研究人员, 我使用 ollama 在本地部署模型服务, 从日志中看到 ollama 使用了如下环境变量:
```bash
OLLAMA_VULKAN:true
```
请详细说明一下该环境变量的含义, 使用场景, 使用具体的示例说明该环境的使用方法?

在 Ollama 异构计算与硬件抽象层架构中, `OLLAMA_VULKAN:true` 是一个具有里程碑意义的跨平台通用 GPU 加速总开关.

你在日志中看到该变量为 `true`, 意味着你的 Ollama 服务已经成功激活了基于 Khronos Vulkan Compute API(计算着色器) 的推理后端, 彻底摆脱了对厂商专有生态(如 NVIDIA CUDA、AMD ROCm)的强依赖.

它与你在最开始看到的 `GGML_VK_VISIBLE_DEVICES` 环境变量互为表里, 共同构成了完整的 Vulkan 推理控制闭环.

---

### 一、核心含义与底层算法原理

#### 1. 变量功能

* `OLLAMA_VULKAN`: 告诉 Ollama 在硬件探测与后端初始化时, 加载并启用编译了 `ggml-vulkan` 的底层推理子进程(Runner).
* 物理实现: 它将大语言模型前向推理中的所有密集矩阵乘法(GEMM、Softmax、RMSNorm 等算子), 编译为底层的 SPIR-V 中间表示代码, 并通过操作系统的 Vulkan 显示驱动下发给 GPU 的计算着色器(Compute Shaders)并发执行.

#### 2. 各硬件平台主流加速后端生态位对比

| 厂商 / 硬件          | 官方原生专有栈                                     | Vulkan 后端的生态位                             |
| :------------------- | :------------------------------------------------- | :---------------------------------------------- |
| NVIDIA 显卡          | CUDA(算子高度手工汇编调优, 极致性能)               | 兜底方案(通常慢于 CUDA 15%~30%, 非必要不开).    |
| AMD 显卡(Linux)      | ROCm / HIP(性能强大, 但驱动体积庞大且仅支持部分卡) | 轻量化免配置方案, 通杀所有 RDNA / GCN 架构显卡. |
| AMD 显卡(Windows)    | 官方 ROCm 支持极弱(仅适配极少数卡, 需装巨大 SDK)   | 绝对的主力主力方案! 插卡装官方驱动即跑.         |
| Intel 独显 / 核显    | oneAPI / SYCL(部署依赖环境重)                      | 首选主力方案(Arc A770、B580、Core Ultra 标配).  |
| AMD APU 核显(780M等) | 经常被 ROCm 识别为不支持的 GFX                     | 首选主力方案, 配合核显变量直接满血加速.         |

---

### 二、核心使用场景(为什么它是"跨平台救星"?)

对于 NVIDIA 以外的硬件生态, Vulkan 彻底解决了"没有 CUDA 怎么跑大模型"的世纪难题:

#### 场景 1: Windows 平台下的 AMD Radeon 用户(摆脱 ROCm 噩梦)

* 痛点: 在 Windows 上, AMD 官方的 ROCm 生态长期缺失或体验极差(只对 RX 7900 XTX 等极个别卡开放有限支持, 且要配置复杂的 HIP SDK). 千万级的 RX 6600、RX 6700 XT、RX 7800 XT 用户在 Windows 下只能眼睁睁看着模型跑在极慢的 CPU 上.
* 解决: 开启 `OLLAMA_VULKAN=true` 后, Ollama 直接调用显卡自带的标准游戏显卡驱动(Adrenalin), 无需安装任何庞大的开发包, 直接让 AMD 显卡以 50~80 Tokens/s 的高帧率跑满算力!

#### 场景 2: Intel 独立显卡(Arc A770 / A750 / B580 Battlemage)

* 痛点: Intel Arc 显卡性价比极高(如 16GB 显存的 A770), 但它原生不支持 CUDA 或 ROCm.
* 解决: 开启 Vulkan 是目前让 Intel 蓝戟/公版独立显卡在 Ollama 中以 100% GPU 满载跑大模型的最通用、开箱即用的黄金解法.

#### 场景 3: 高性能迷你主机 / 掌机 APU(配合核显放开)

* 硬件: ROG Ally 掌机、Minisforum / Beelink 搭载的 AMD Ryzen 780M / 890M 核显.
* 组合拳: 配合我们之前讲过的核显解除变量:

```bash
OLLAMA_IGPU_ENABLE=1
OLLAMA_VULKAN=true
```

  即可将集成显卡直接变身为强大的本地大模型推理芯片, 从原本 100% CPU 的 6 Tokens/s 暴增到 30+ Tokens/s.

#### 场景 4: Linux 开源驱动生态(Mesa RADV / NVK)

* 许多追求极致纯净的 Linux 用户不想安装厂商臃肿闭源的驱动(如不想装 20GB+ 的 ROCm 库), 只需安装轻量级的 Mesa 开源驱动包, 开启该变量即可享受硬件推理加速.

---

### 三、具体配置与使用示例

#### 示例 1: Linux 生产系统服务(推荐 Intel / AMD 独显环境)

1. 编辑系统单元文件:

```bash
sudo systemctl edit ollama.service
```

2. 注入开启参数(结合我们之前讲的 Vulkan 设备控制):

```ini
[Service]
# 1. 强制启用 Vulkan 推理引擎
Environment="OLLAMA_VULKAN=true"

# 2. 如果是核显, 放开核显屏蔽
Environment="OLLAMA_IGPU_ENABLE=1"

# 3. 如果有多张卡, 指定使用 0 号 Vulkan 设备
Environment="GGML_VK_VISIBLE_DEVICES=0"
```

3. 保存并重启生效:

```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```

---

#### 示例 2: Windows 本地配置(拯救 AMD Windows 玩家)

* PowerShell 启动测试:

```powershell
$env:OLLAMA_VULKAN="true"
ollama serve
```

* 系统环境变量持久化:
  在"系统属性 -> 环境变量 -> 系统变量"中新建:
  * 变量名: `OLLAMA_VULKAN`
  * 变量值: `true`
  重启 Ollama 桌面程序后, 打开任务管理器即可看到专有 GPU 的 3D / Compute 引擎被模型吃满.

---

#### 示例 3: Linux / macOS 终端临时运行验证

```bash
# 激活 Vulkan 计算
export OLLAMA_VULKAN=true

# 启动服务
ollama serve
```

---

#### 示例 4: Docker 容器化直通显卡部署

在 Docker 中使用 Vulkan, 只需映射主机的 Direct Rendering 驱动节点(`/dev/dri`), 无需复杂的 NVIDIA 容器工具包:

```bash
docker run -d \
  --device /dev/dri \
  -e OLLAMA_VULKAN=true \
  -p 11434:11434 \
  --name ollama-vulkan \
  ollama/ollama
```

---

### 四、性能表现与避坑指南

#### 1. 首次推理时的"微卡顿"(Shader 预编译现象)

* 现象: 刚启动模型并发起第一次提问时, 模型在吐出第一个字之前可能会停顿 2~4 秒; 之后的提问却非常迅速.
* 原因: 这是 Vulkan 架构的正常物理特性. 在首次接收张量形状时, Vulkan 驱动需要将 SPIR-V 着色器编译并链接为当前物理 GPU 专用的硬件管线状态对象(PSO/Pipeline Cache). 编译完成后被驱动缓存, 后续便可顺畅流式生成.

#### 2. NVIDIA 用户请勿强开

* 如果你的设备是 NVIDIA RTX 显卡(如 3060/4090), Ollama 默认调用的 CUDA 后端经过了极致的底层张量核心汇编手工打磨. 强行设置 `OLLAMA_VULKAN=true` 虽然也能跑通, 但推理吞吐量(Tokens/s)会出现 20% 左右的负优化反向下降.

#### 3. 运行前置条件

* 宿主机操作系统必须安装了支持 Vulkan 1.2 或 1.3 的标准显卡驱动(对于近 7 年内发布的显卡驱动, 厂商均已内置了该支持). 可以通过系统命令 `vulkaninfo --summary` 来快速验证你的显卡驱动是否就绪.

-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------

