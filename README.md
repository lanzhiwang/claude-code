# Claude Code

## install

```bash
curl -fsSL https://claude.ai/install.sh | bash -x

./claude --verbose --debug --debug-file ./install.log install
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
