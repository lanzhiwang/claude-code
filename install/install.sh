#!/bin/bash

set -e

# Parse command line arguments
TARGET="$1" # Optional target parameter

# Validate target if provided
if [[ -n "$TARGET" ]] && [[ ! "$TARGET" =~ ^(stable|latest|[0-9]+\.[0-9]+\.[0-9]+(-[^[:space:]]+)?)$ ]]; then
    echo "Usage: $0 [stable|latest|VERSION]" >&2
    exit 1
fi

GCS_BUCKET="https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases"
DOWNLOAD_DIR="$HOME/.claude/downloads"
# DOWNLOAD_DIR=/home/codespace/.claude/downloads

# Check for required dependencies
DOWNLOADER=""
if command -v curl >/dev/null 2>&1; then
    DOWNLOADER="curl"
elif command -v wget >/dev/null 2>&1; then
    DOWNLOADER="wget"
else
    echo "Either curl or wget is required but neither is installed" >&2
    exit 1
fi
# DOWNLOADER=curl

# Check if jq is available (optional)
HAS_JQ=false
if command -v jq >/dev/null 2>&1; then
    HAS_JQ=true
fi
# HAS_JQ=true

# Download function that works with both curl and wget
download_file() {
    # download_file https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest
    # download_file https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/manifest.json
    # download_file https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/linux-x64/claude /home/codespace/.claude/downloads/claude-2.1.76-linux-x64

    local url="$1"
    local output="$2"

    # local url=https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest
    # local output=

    # local url=https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/manifest.json
    # local output=

    # local url=https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/linux-x64/claude
    # local output=/home/codespace/.claude/downloads/claude-2.1.76-linux-x64

    if [ "$DOWNLOADER" = "curl" ]; then
        if [ -n "$output" ]; then
            curl -fsSL -o "$output" "$url"
            # curl -fsSL -o /home/codespace/.claude/downloads/claude-2.1.76-linux-x64 https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/linux-x64/claude

        else
            curl -fsSL "$url"
            # curl -fsSL https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest
            # curl -fsSL https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.76/manifest.json

        fi
    elif [ "$DOWNLOADER" = "wget" ]; then
        if [ -n "$output" ]; then
            wget -q -O "$output" "$url"
        else
            wget -q -O - "$url"
        fi
    else
        return 1
    fi
}

# Simple JSON parser for extracting checksum when jq is not available
get_checksum_from_manifest() {
    local json="$1"
    local platform="$2"

    # Normalize JSON to single line and extract checksum
    json=$(echo "$json" | tr -d '\n\r\t' | sed 's/ \+/ /g')

    # Extract checksum for platform using bash regex
    if [[ $json =~ \"$platform\"[^}]*\"checksum\"[[:space:]]*:[[:space:]]*\"([a-f0-9]{64})\" ]]; then
        echo "${BASH_REMATCH[1]}"
        return 0
    fi

    return 1
}

# Detect platform
case "$(uname -s)" in
Darwin) os="darwin" ;;
Linux) os="linux" ;;
MINGW* | MSYS* | CYGWIN*)
    echo "Windows is not supported by this script. See https://code.claude.com/docs for installation options." >&2
    exit 1
    ;;
*)
    echo "Unsupported operating system: $(uname -s). See https://code.claude.com/docs for supported platforms." >&2
    exit 1
    ;;
esac
# os=linux

case "$(uname -m)" in
x86_64 | amd64) arch="x64" ;;
arm64 | aarch64) arch="arm64" ;;
*)
    echo "Unsupported architecture: $(uname -m)" >&2
    exit 1
    ;;
esac
# arch=x64

# Detect Rosetta 2 on macOS: if the shell is running as x64 under Rosetta on an ARM Mac,
# download the native arm64 binary instead of the x64 one
if [ "$os" = "darwin" ] && [ "$arch" = "x64" ]; then
    if [ "$(sysctl -n sysctl.proc_translated 2>/dev/null)" = "1" ]; then
        arch="arm64"
    fi
fi

# Check for musl on Linux and adjust platform accordingly
if [ "$os" = "linux" ]; then
    if [ -f /lib/libc.musl-x86_64.so.1 ] || [ -f /lib/libc.musl-aarch64.so.1 ] || ldd /bin/ls 2>&1 | grep -q musl; then
        platform="linux-${arch}-musl"
    else
        platform="linux-${arch}"
    fi
else
    platform="${os}-${arch}"
fi
# platform=linux-x64

mkdir -p "$DOWNLOAD_DIR"
# mkdir -p /home/codespace/.claude/downloads

# Always download latest version (which has the most up-to-date installer)
version=$(download_file "$GCS_BUCKET/latest")
# version=2.1.76

# Download manifest and extract checksum
manifest_json=$(download_file "$GCS_BUCKET/$version/manifest.json")
# manifest_json='{
#   "version": "2.1.76",
#   "buildDate": "2026-03-14T00:18:17Z",
#   "platforms": {
#     "darwin-arm64": {
#       "binary": "claude",
#       "checksum": "ffe922f4f4ac542f4edbeeabbce2a7492308d034c66a2427caec5c31c39b71c8",
#       "size": 190891760
#     },
#     "darwin-x64": {
#       "binary": "claude",
#       "checksum": "2a13d9a3ca0fe330fd786341897af2e5250066bbbb1fdcb6cfdffa50cf0f90fe",
#       "size": 196972016
#     },
#     "linux-arm64": {
#       "binary": "claude",
#       "checksum": "40f753c07f070df34ca83e400f746a8279a3fd343967a453d9fbfab2f3ca7acd",
#       "size": 232783142
#     },
#     "linux-x64": {
#       "binary": "claude",
#       "checksum": "801a085676c3d54392c42e8e43c44947df7c52132356575f7d9267c4f22d6992",
#       "size": 235555347
#     },
#     "linux-arm64-musl": {
#       "binary": "claude",
#       "checksum": "18fb9e236149bd475d9c5b9ec033f5c93d2dec0dca1f7b34cec96fd42379497c",
#       "size": 223318614
#     },
#     "linux-x64-musl": {
#       "binary": "claude",
#       "checksum": "f17ad0fe5448799cdaa7ae5fd77132e0003942195da91546a4f5e7b2f7bf2f05",
#       "size": 226152835
#     },
#     "win32-x64": {
#       "binary": "claude.exe",
#       "checksum": "bb40de8e810d985698e14eec9935036621bf37c495a609f5b70db7aa9f927b83",
#       "size": 240100000
#     },
#     "win32-arm64": {
#       "binary": "claude.exe",
#       "checksum": "1dac83677e68a48368f945e693a5dd039baff21115871223c622df362c0cd61b",
#       "size": 236293792
#     }
#   }
# }'

# Use jq if available, otherwise fall back to pure bash parsing
if [ "$HAS_JQ" = true ]; then
    checksum=$(echo "$manifest_json" | jq -r ".platforms[\"$platform\"].checksum // empty")
    # jq -r '.platforms["linux-x64"].checksum // empty'
    # checksum=801a085676c3d54392c42e8e43c44947df7c52132356575f7d9267c4f22d6992

else
    checksum=$(get_checksum_from_manifest "$manifest_json" "$platform")
fi

# Validate checksum format (SHA256 = 64 hex characters)
if [ -z "$checksum" ] || [[ ! "$checksum" =~ ^[a-f0-9]{64}$ ]]; then
    echo "Platform $platform not found in manifest" >&2
    exit 1
fi

# Download and verify
binary_path="$DOWNLOAD_DIR/claude-$version-$platform"
# binary_path=/home/codespace/.claude/downloads/claude-2.1.76-linux-x64

if ! download_file "$GCS_BUCKET/$version/$platform/claude" "$binary_path"; then
    echo "Download failed" >&2
    rm -f "$binary_path"
    exit 1
fi

# Pick the right checksum tool
if [ "$os" = "darwin" ]; then
    actual=$(shasum -a 256 "$binary_path" | cut -d' ' -f1)
else
    actual=$(sha256sum "$binary_path" | cut -d' ' -f1)
fi

if [ "$actual" != "$checksum" ]; then
    echo "Checksum verification failed" >&2
    rm -f "$binary_path"
    exit 1
fi

chmod +x "$binary_path"
# chmod +x /home/codespace/.claude/downloads/claude-2.1.76-linux-x64

# Run claude install to set up launcher and shell integration
echo "Setting up Claude Code..."
"$binary_path" --verbose --debug --debug-file ./install.log install ${TARGET:+"$TARGET"}
# /home/codespace/.claude/downloads/claude-2.1.76-linux-x64 install

# ✔ Claude Code successfully installed!

#   Version: 2.1.76

#   Location: ~/.local/bin/claude

#   Next: Run claude --help to get started

# Clean up downloaded file
rm -f "$binary_path"
# rm -f /home/codespace/.claude/downloads/claude-2.1.76-linux-x64

echo ""
echo "✅ Installation complete!"
echo ""
