# Claude Code

## install

```bash
curl -fsSL https://claude.ai/install.sh | bash -x

./claude --verbose --debug --debug-file ./install.log install

$ docker run -ti --rm -v "$(pwd)":/app -w /app ubuntu:22.04 bash
root@9eb0f8e9e658:/app# ls -al
root@9eb0f8e9e658:/app# ./claude-2.1.137-linux-x64 -v
2.1.137 (Claude Code)
root@9eb0f8e9e658:/app#
root@9eb0f8e9e658:/app# ./claude-2.1.137-linux-x64 --verbose --debug --debug-file ./install.log install

✔ Claude Code successfully installed!

  Version: 2.1.137

  Location: ~/.local/bin/claude


  Next: Run claude --help to get started

⚠ Setup notes:
  ● Native installation exists but ~/.local/bin is not in your PATH. Run:

    echo 'export PATH="$HOME/.local/bin:$PATH"' >> your shell config file && source your shell config file

root@9eb0f8e9e658:/app#

```

## 使用

```bash
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_BASE_URL=http://172.16.10.51:11434
claude --verbose --debug --debug-file ./debug.log --model qwen3-coder:30b

```

## Docs

- [一个 CLAUDE.md, 让 AI 真正懂你的项目: 从配置到长期提效的完整指南](./CLAUDE.md)
- [everything-claude-code](https://github.com/affaan-m/everything-claude-code)

## 调试技巧

启用详细日志

```bash
# 全局调试模式
claude --verbose --debug

# MCP 调试
claude --mcp-debug

# 保存调试日志
claude --debug --debug-file debug.log

```
