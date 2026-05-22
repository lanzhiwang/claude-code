# ai-dynamo aiperf

* https://github.com/ai-dynamo/aiperf

```bash
conda env list
conda create --name litellm python=3.12 -y

conda activate litellm

conda deactivate
conda env remove -n litellm -y

pip -v install uv -i https://pypi.tuna.tsinghua.edu.cn/simple

uv pip -v install --index https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple aiperf modelscope

$ pip freeze | grep aiperf
aiperf==0.8.0
$

# ollama
CUDA_VISIBLE_DEVICES="0,1,2,5" OLLAMA_DEBUG=1 OLLAMA_HOST=http://0.0.0.0:11434 ./ollama/bin/ollama serve
./ollama/bin/ollama pull granite4:350m

# model
git clone https://huggingface.co/ibm-granite/granite-4.0-micro
modelscope download --model AI-ModelScope/granite-4.0-h-micro --local_dir ./

# aiperf
# aiperf profile \
#   --model "granite4:350m" \
#   --streaming \
#   --endpoint-type chat \
#   --tokenizer ibm-granite/granite-4.0-micro \
#   --url http://localhost:11434 \
#   --request-count 10

$ aiperf profile \
  --model "granite4:350m" \
  --streaming \
  --endpoint-type chat \
  --tokenizer /root/huzhi/granite \
  --url http://localhost:11434 \
  --request-count 10
No concurrency value provided, setting to 1


                                              NVIDIA AIPerf | LLM Metrics
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━┳━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━┳━━━━━━━━━━┓
┃                                        Metric ┃    avg ┃    min ┃      max ┃      p99 ┃      p90 ┃    p50 ┃      std ┃
┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━╇━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━╇━━━━━━━━━━┩
│                      Time to First Token (ms) │ 520.35 │ 131.98 │ 3,689.72 │ 3,374.74 │   539.95 │ 174.20 │ 1,056.60 │
│                     Time to Second Token (ms) │   6.86 │   5.15 │    13.07 │    12.59 │     8.30 │   6.01 │     2.21 │
│               Time to First Output Token (ms) │ 520.35 │ 131.98 │ 3,689.72 │ 3,374.74 │   539.95 │ 174.20 │ 1,056.60 │
│                          Request Latency (ms) │ 846.90 │ 303.66 │ 3,922.37 │ 3,648.37 │ 1,182.36 │ 455.03 │ 1,039.72 │
│                      Inter Token Latency (ms) │   4.00 │   3.69 │     4.75 │     4.71 │     4.35 │   3.95 │     0.32 │
│              Output Token Throughput Per User │ 251.66 │ 210.62 │   271.27 │   271.25 │   271.07 │ 253.11 │    18.67 │
│                             (tokens/sec/user) │        │        │          │          │          │        │          │
│ E2E Output Token Throughput (tokens/sec/user) │ 147.20 │  12.75 │   218.62 │   216.39 │   196.39 │ 157.56 │    55.00 │
│               Output Sequence Length (tokens) │  83.20 │  33.00 │   169.00 │   166.84 │   147.40 │  63.00 │    45.20 │
│                Input Sequence Length (tokens) │ 550.00 │ 550.00 │   550.00 │   550.00 │   550.00 │ 550.00 │     0.00 │
│          Output Token Throughput (tokens/sec) │  97.27 │    N/A │      N/A │      N/A │      N/A │    N/A │      N/A │
│             Request Throughput (requests/sec) │   1.17 │    N/A │      N/A │      N/A │      N/A │    N/A │      N/A │
│                      Request Count (requests) │  10.00 │    N/A │      N/A │      N/A │      N/A │    N/A │      N/A │
└───────────────────────────────────────────────┴────────┴────────┴──────────┴──────────┴──────────┴────────┴──────────┘

CLI Command: aiperf profile --model 'granite4:350m' --streaming --endpoint-type 'chat' --tokenizer '/root/huzhi/granite' --url 'http://localhost:11434' --request-count 10
Benchmark Duration: 8.55 sec
CSV Export: /root/huzhi/granite/artifacts/granite4:350m-openai-chat-concurrency1/profile_export_aiperf.csv
JSON Export: /root/huzhi/granite/artifacts/granite4:350m-openai-chat-concurrency1/profile_export_aiperf.json
Log File: /root/huzhi/granite/artifacts/granite4:350m-openai-chat-concurrency1/logs/aiperf.log

$

```
