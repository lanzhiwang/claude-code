# ollama

* https://docs.ollama.com/linux#manual-install

```bash
$ mkdir ollama
$ tar x -C ./ollama/ -f ollama-linux-amd64.tar.zst
$ tree -a ./ollama
./ollama
├── bin
│   └── ollama
└── lib
    └── ollama
        ├── cuda_v12
        │   ├── libcublas.so.12 -> libcublas.so.12.8.4.1
        │   ├── libcublas.so.12.8.4.1
        │   ├── libcublasLt.so.12 -> libcublasLt.so.12.8.4.1
        │   ├── libcublasLt.so.12.8.4.1
        │   ├── libcudart.so.12 -> libcudart.so.12.8.90
        │   ├── libcudart.so.12.8.90
        │   └── libggml-cuda.so
        ├── cuda_v13
        │   ├── libcublas.so.13 -> libcublas.so.13.1.0.3
        │   ├── libcublas.so.13.1.0.3
        │   ├── libcublasLt.so.13 -> libcublasLt.so.13.1.0.3
        │   ├── libcublasLt.so.13.1.0.3
        │   ├── libcudart.so.13 -> libcudart.so.13.0.96
        │   ├── libcudart.so.13.0.96
        │   └── libggml-cuda.so
        ├── libggml-base.so -> libggml-base.so.0
        ├── libggml-base.so.0 -> libggml-base.so.0.0.0
        ├── libggml-base.so.0.0.0
        ├── libggml-cpu-alderlake.so
        ├── libggml-cpu-haswell.so
        ├── libggml-cpu-icelake.so
        ├── libggml-cpu-sandybridge.so
        ├── libggml-cpu-skylakex.so
        ├── libggml-cpu-sse42.so
        ├── libggml-cpu-x64.so
        ├── mlx_cuda_v13
        │   ├── libcublas.so -> libcublas.so.13
        │   ├── libcublas.so.13 -> ./libcublas.so.13.1.0.3
        │   ├── libcublas.so.13.1.0.3 -> ../cuda_v13/libcublas.so.13.1.0.3
        │   ├── libcublasLt.so.13 -> libcublasLt.so.13.1.0.3
        │   ├── libcublasLt.so.13.1.0.3 -> ../cuda_v13/libcublasLt.so.13.1.0.3
        │   ├── libcudart.so -> libcudart.so.13
        │   ├── libcudart.so.13 -> libcudart.so.13.0.96
        │   ├── libcudart.so.13.0.96 -> ../cuda_v13/libcudart.so.13.0.96
        │   ├── libcudnn.so.9 -> libcudnn.so.9.18.1
        │   ├── libcudnn.so.9.18.1
        │   ├── libcudnn_adv.so.9 -> libcudnn_adv.so.9.18.1
        │   ├── libcudnn_adv.so.9.18.1
        │   ├── libcudnn_cnn.so.9 -> libcudnn_cnn.so.9.18.1
        │   ├── libcudnn_cnn.so.9.18.1
        │   ├── libcudnn_engines_precompiled.so.9 -> libcudnn_engines_precompiled.so.9.18.1
        │   ├── libcudnn_engines_precompiled.so.9.18.1
        │   ├── libcudnn_engines_runtime_compiled.so.9 -> libcudnn_engines_runtime_compiled.so.9.18.1
        │   ├── libcudnn_engines_runtime_compiled.so.9.18.1
        │   ├── libcudnn_graph.so.9 -> libcudnn_graph.so.9.18.1
        │   ├── libcudnn_graph.so.9.18.1
        │   ├── libcudnn_heuristic.so.9 -> libcudnn_heuristic.so.9.18.1
        │   ├── libcudnn_heuristic.so.9.18.1
        │   ├── libcudnn_ops.so.9 -> libcudnn_ops.so.9.18.1
        │   ├── libcudnn_ops.so.9.18.1
        │   ├── libgfortran.so.5 -> libgfortran.so.5.0.0
        │   ├── libgfortran.so.5.0.0
        │   ├── libmlx.so
        │   ├── libmlxc.so
        │   ├── libnccl.so.2 -> libnccl.so.2.29.2
        │   ├── libnccl.so.2.29.2
        │   ├── libnvrtc.so.13 -> libnvrtc.so.13.0.88
        │   ├── libnvrtc.so.13.0.88
        │   ├── libopenblas-r0.3.15.so
        │   └── libopenblas.so.0 -> libopenblas-r0.3.15.so
        └── vulkan
            ├── libggml-vulkan.so
            ├── libvulkan.so.1 -> libvulkan.so.1.4.321
            └── libvulkan.so.1.4.321

7 directories, 62 files
$
$ ollama serve

$ ollama -v
ollama version is 0.15.2
$

$ tree -a ~/.ollama/
/root/.ollama/
├── id_ed25519
├── id_ed25519.pub
└── models
    └── blobs

2 directories, 2 files
$
$ ollama pull modelscope.cn/Qwen/Qwen3-32B-GGUF
$ ollama pull qwen3:0.6b
$ tree -a ~/.ollama/
/root/.ollama/
├── history
├── id_ed25519
├── id_ed25519.pub
└── models
    ├── blobs
    │   ├── sha256-1371455c41da08c55c676052f690d19c4c28ab749e94238cb7a582f2e22d7efc
    │   ├── sha256-7f4030143c1c477224c5434f8272c662a8b042079a0a584f0a27a1684fe2e1fa
    │   ├── sha256-9d538c9a828efaf67641eab0661d7167873f13b6efcf2f1513b39f6055fc8015
    │   ├── sha256-ae370d884f108d16e7cc8fd5259ebc5773a0afa6e078b11f4ed7e39a27e0dfc4
    │   ├── sha256-b0830f4ff6a0220cfd995455206353b0ed23c0aee865218b154b7a75087b4e55
    │   ├── sha256-cff3f395ef3756ab63e58b0ad1b32bb6f802905cae1472e6a12034e4246fbbdb
    │   ├── sha256-d18a5cc71b84bc4af394a31116bd3932b42241de70c77d2b76d69a314ec8aa12
    │   └── sha256-efd971561896866f0e910cce52761ca77b1b138090c7f15fe284676d57d1f689
    └── manifests
        ├── modelscope.cn
        │   └── Qwen
        │       └── Qwen3-32B-GGUF
        │           └── latest
        └── registry.ollama.ai
            └── library
                └── qwen3
                    └── 0.6b

9 directories, 13 files
$

# env:
# CUDA_VISIBLE_DEVICES:
# GGML_VK_VISIBLE_DEVICES:
# GPU_DEVICE_ORDINAL:
# HIP_VISIBLE_DEVICES:
# HSA_OVERRIDE_GFX_VERSION:
# HTTPS_PROXY:
# HTTP_PROXY:
# NO_PROXY:
# OLLAMA_CONTEXT_LENGTH:4096
# OLLAMA_DEBUG:INFO
# OLLAMA_FLASH_ATTENTION:false
# OLLAMA_GPU_OVERHEAD:0
# OLLAMA_HOST:http://127.0.0.1:11434
# OLLAMA_KEEP_ALIVE:5m0s
# OLLAMA_KV_CACHE_TYPE:
# OLLAMA_LLM_LIBRARY:
# OLLAMA_LOAD_TIMEOUT:5m0s
# OLLAMA_MAX_LOADED_MODELS:0
# OLLAMA_MAX_QUEUE:512
# OLLAMA_MODELS:/root/.ollama/models
# OLLAMA_MULTIUSER_CACHE:false
# OLLAMA_NEW_ENGINE:false
# OLLAMA_NOHISTORY:false
# OLLAMA_NOPRUNE:false
# OLLAMA_NUM_PARALLEL:1
# OLLAMA_ORIGINS:[
#     http://localhost
#     https://localhost
#     http://localhost:*
#     https://localhost:*
#     http://127.0.0.1
#     https://127.0.0.1
#     http://127.0.0.1:*
#     https://127.0.0.1:*
#     http://0.0.0.0
#     https://0.0.0.0
#     http://0.0.0.0:*
#     https://0.0.0.0:*
#     app://*
#     file://*
#     tauri://*
#     vscode-webview://*
#     vscode-file://*
# ]
# OLLAMA_REMOTES:[ollama.com]
# OLLAMA_SCHED_SPREAD:false
# OLLAMA_VULKAN:false
# ROCR_VISIBLE_DEVICES:
# http_proxy:
# https_proxy:
# no_proxy:

CUDA_VISIBLE_DEVICES="0,1,2,3" OLLAMA_DEBUG=1 OLLAMA_HOST=http://0.0.0.0:11434 ollama serve

# Get version
$ curl http://localhost:11434/api/version
{"version":"0.15.2"}
$

# List models
$ curl http://localhost:11434/api/tags
{
    "models": [
        {
            "name": "qwen3:0.6b",
            "model": "qwen3:0.6b",
            "modified_at": "2026-01-31T13:48:55.648463429+08:00",
            "size": 522653767,
            "digest": "7df6b6e09427a769808717c0a93cadc4ae99ed4eb8bf5ca557c90846becea435",
            "details": {
                "parent_model": "",
                "format": "gguf",
                "family": "qwen3",
                "families": [
                    "qwen3"
                ],
                "parameter_size": "751.63M",
                "quantization_level": "Q4_K_M"
            }
        },
        {
            "name": "modelscope.cn/Qwen/Qwen3-32B-GGUF:latest",
            "model": "modelscope.cn/Qwen/Qwen3-32B-GGUF:latest",
            "modified_at": "2026-01-31T13:34:45.468574313+08:00",
            "size": 19762162513,
            "digest": "8d16791f371fd7e0a8a965a0e7192c049d4bf2b63451832cf88247afb74b5d69",
            "details": {
                "parent_model": "",
                "format": "gguf",
                "family": "qwen3",
                "families": [
                    "qwen3"
                ],
                "parameter_size": "32.8B",
                "quantization_level": "Q4_K_M"
            }
        }
    ]
}
$

# List running models
$ curl http://localhost:11434/api/ps
{
    "models": [
        {
            "name": "modelscope.cn/Qwen/Qwen3-32B-GGUF:latest",
            "model": "modelscope.cn/Qwen/Qwen3-32B-GGUF:latest",
            "size": 21029145600,
            "digest": "8d16791f371fd7e0a8a965a0e7192c049d4bf2b63451832cf88247afb74b5d69",
            "details": {
                "parent_model": "",
                "format": "gguf",
                "family": "qwen3",
                "families": [
                    "qwen3"
                ],
                "parameter_size": "32.8B",
                "quantization_level": "Q4_K_M"
            },
            "expires_at": "2026-01-31T13:52:15.727517235+08:00",
            "size_vram": 0,
            "context_length": 4096
        }
    ]
}
$

# Show model details
$ curl http://localhost:11434/api/show -d '{"model":"modelscope.cn/Qwen/Qwen3-32B-GGUF:latest", "verbose":true}'
$ curl http://localhost:11434/api/show -d '{"model":"qwen3:0.6b", "verbose":true}'

# Generate a response
$ curl http://localhost:11434/api/generate -d '{"model":"qwen3-coder:30b", "prompt":"Why is the sky blue?"}'

useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
usermod -a -G ollama $(whoami)



# docker pull ollama/ollama:0.15.2
ctr images pull docker.io/library/python:3.12.12
ctr images pull docker.io/ollama/ollama:0.15.2

ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]

# docker run -d --gpus '"device=0, 1, 2, 3, 4, 5, 6"' -v /root/ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:0.12.9
nerdctl run -d --network host --gpus '"device=0, 1, 2, 3"' -v /root/huzhi:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:0.15.2

# docker exec -it ollama /bin/bash
nerdctl exec -it ollama /bin/bash

# 必须使用 ollama pull 方法下载模型
export OLLAMA_MODELS=/root/.ollama/models && /bin/ollama pull modelscope.cn/Qwen/Qwen3-32B-GGUF
export OLLAMA_MODELS=/root/.ollama/models && /bin/ollama run modelscope.cn/Qwen/Qwen3-32B-GGUF

root@e4a4e908e793:/# export OLLAMA_MODELS=/root/.ollama/models && /bin/ollama list
NAME                                         ID              SIZE      MODIFIED
modelscope.cn/Qwen/Qwen3-32B-GGUF:latest     8d16791f371f    19 GB     48 seconds ago
modelscope.cn/Qwen/Qwen3-0.6B-GGUF:latest    ff73df262dfb    639 MB    24 minutes ago
root@e4a4e908e793:/#

env
CUDA_VISIBLE_DEVICES:
GGML_VK_VISIBLE_DEVICES:
GPU_DEVICE_ORDINAL:
HIP_VISIBLE_DEVICES:
HSA_OVERRIDE_GFX_VERSION:
HTTPS_PROXY:
HTTP_PROXY:
NO_PROXY:
OLLAMA_CONTEXT_LENGTH:4096
OLLAMA_DEBUG:INFO
OLLAMA_FLASH_ATTENTION:false
OLLAMA_GPU_OVERHEAD:0
OLLAMA_HOST:http://0.0.0.0:11434
OLLAMA_INTEL_GPU:false
OLLAMA_KEEP_ALIVE:5m0s
OLLAMA_KV_CACHE_TYPE:
OLLAMA_LLM_LIBRARY:
OLLAMA_LOAD_TIMEOUT:5m0s
OLLAMA_MAX_LOADED_MODELS:0
OLLAMA_MAX_QUEUE:512
OLLAMA_MODELS:/root/.ollama/models
OLLAMA_MULTIUSER_CACHE:false
OLLAMA_NEW_ENGINE:false
OLLAMA_NOHISTORY:false
OLLAMA_NOPRUNE:false
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
ROCR_VISIBLE_DEVICES:
http_proxy:
https_proxy:
no_proxy:


$ ctr run  --help
NAME:
   ctr run - Run a container

USAGE:
   ctr run [command options] [flags] Image|RootFS ID [COMMAND] [ARG...]

OPTIONS:
   --rm                                                                               Remove the container after running, cannot be used with --detach (default: false)
   --null-io                                                                          Send all IO to /dev/null (default: false)
   --log-uri value                                                                    Log uri
   --detach, -d                                                                       Detach from the task after it has started execution, cannot be used with --rm (default: false)
   --fifo-dir value                                                                   Directory used for storing IO FIFOs
   --cgroup value                                                                     Cgroup path (To disable use of cgroup, set to "" explicitly)
   --platform value                                                                   Run image for specific platform
   --cni                                                                              Enable cni networking for the container (default: false)
   --sync-fs                                                                          Synchronize the underlying filesystem containing files when unpack images, false by default (default: false)
   --uidmap container-uid:host-uid:length [ --uidmap container-uid:host-uid:length ]  Run inside a user namespace with the specified UID mapping ranges; specified with the format container-uid:host-uid:length
   --gidmap container-gid:host-gid:length [ --gidmap container-gid:host-gid:length ]  Run inside a user namespace with the specified GID mapping ranges; specified with the format container-gid:host-gid:length
   --remap-labels                                                                     Provide the user namespace ID remapping to the snapshotter via label options; requires snapshotter support (default: false)
   --privileged-without-host-devices                                                  Don't pass all host devices to privileged container (default: false)
   --cpus value                                                                       Set the CFS cpu quota (default: 0)
   --cpu-shares value                                                                 Set the cpu shares (default: 1024)
   --cpuset-cpus value                                                                Set the CPUs the container will run in (e.g., 1-2,4)
   --cpuset-mems value                                                                Set the memory nodes the container will run in (e.g., 1-2,4)
   --runtime value                                                                    Runtime name or absolute path to runtime binary (default: "io.containerd.runc.v2")
   --runtime-config-path value                                                        Optional runtime config path
   --runc-binary value                                                                Specify runc-compatible binary
   --runc-root value                                                                  Specify runc-compatible root
   --runc-systemd-cgroup                                                              Start runc with systemd cgroup manager (default: false)
   --snapshotter value                                                                Snapshotter name. Empty value stands for the default value. [$CONTAINERD_SNAPSHOTTER]
   --snapshotter-label value [ --snapshotter-label value ]                            Labels added to the new snapshot for this container.
   --config value, -c value                                                           Path to the runtime-specific spec config file
   --cwd value                                                                        Specify the working directory of the process
   --env value [ --env value ]                                                        Specify additional container environment variables (e.g. FOO=bar)
   --env-file value                                                                   Specify additional container environment variables in a file(e.g. FOO=bar, one per line)
   --label value [ --label value ]                                                    Specify additional labels (e.g. foo=bar)
   --annotation value [ --annotation value ]                                          Specify additional OCI annotations (e.g. foo=bar)
   --mount value [ --mount value ]                                                    Specify additional container mount (e.g. type=bind,src=/tmp,dst=/host,options=rbind:ro)
   --net-host                                                                         Enable host networking for the container (default: false)
   --privileged                                                                       Run privileged container (default: false)
   --read-only                                                                        Set the containers filesystem as readonly (default: false)
   --sandbox value                                                                    Create the container in the given sandbox
   --tty, -t                                                                          Allocate a TTY for the container (default: false)
   --with-ns value [ --with-ns value ]                                                Specify existing Linux namespaces to join at container runtime (format '<nstype>:<path>')
   --pid-file value                                                                   File path to write the task's pid
   --gpus value [ --gpus value ]                                                      Add gpus to the container
   --allow-new-privs                                                                  Turn off OCI spec's NoNewPrivileges feature flag (default: false)
   --memory-limit value                                                               Memory limit (in bytes) for the container (default: 0)
   --cap-add value [ --cap-add value ]                                                Add Linux capabilities (Set capabilities with 'CAP_' prefix)
   --cap-drop value [ --cap-drop value ]                                              Drop Linux capabilities (Set capabilities with 'CAP_' prefix)
   --seccomp                                                                          Enable the default seccomp profile (default: false)
   --seccomp-profile value                                                            File path to custom seccomp profile. seccomp must be set to true, before using seccomp-profile
   --apparmor-default-profile value                                                   Enable AppArmor with the default profile with the specified name, e.g. "cri-containerd.apparmor.d"
   --apparmor-profile value                                                           Enable AppArmor with an existing custom profile
   --blockio-config-file value                                                        File path to blockio class definitions. By default class definitions are not loaded.
   --blockio-class value                                                              Name of the blockio class to associate the container with
   --rdt-class value                                                                  Name of the RDT class to associate the container with. Specifies a Class of Service (CLOS) for cache and memory bandwidth management.
   --hostname value                                                                   Set the container's host name
   --user value, -u value                                                             Username or user id, group optional (format: <name|uid>[:<group|gid>])
   --rootfs                                                                           Use custom rootfs that is not managed by containerd snapshotter (default: false)
   --no-pivot                                                                         Disable use of pivot-root (linux only) (default: false)
   --cpu-quota value                                                                  Limit CPU CFS quota (default: -1)
   --cpu-period value                                                                 Limit CPU CFS period (default: 0)
   --rootfs-propagation value                                                         Set the propagation of the container rootfs
   --device value [ --device value ]                                                  File path to a device to add to the container; or a path to a directory tree of devices to add to the container
   --help, -h                                                                         Show help (default: false)
$

```
