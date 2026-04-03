# Claude Code

## help

```bash
$ claude --help
Usage: claude [options] [command] [prompt]

Claude Code - starts an `interactive` `session` by default, use -p/--print for `non-interactive` output

Arguments:
  prompt                                            Your prompt

Options:
  --add-dir <directories...>                        Additional directories to allow tool access to

  --agent <agent>                                   Agent for the current session. Overrides the 'agent' setting.

  --agents <json>                                   JSON object defining custom agents (e.g. '{"reviewer": {"description": "Reviews code", "prompt": "You are a code reviewer"}}')

  --allow-dangerously-skip-permissions              Enable bypassing all permission checks as an option, without it being enabled by default. Recommended only for sandboxes with no internet access.
                                                    启用绕过所有权限检查的选项, 但默认情况下不启用. 建议仅在无法访问互联网的沙箱环境中使用.

  --allowedTools, --allowed-tools <tools...>        Comma or space-separated list of tool names to allow (e.g. "Bash(git:*) Edit")
                                                    以逗号或空格分隔的允许工具名称列表

  --append-system-prompt <prompt>                   Append a system prompt to the default system prompt

  --betas <betas...>                                Beta headers to include in API requests (API key users only)
                                                    测试版 API 请求头(仅限 API 密钥用户)

  --brief                                           Enable SendUserMessage tool for agent-to-user communication

  --chrome                                          Enable Claude in Chrome integration

  -c, --continue                                    Continue the most recent conversation in the current directory

  --dangerously-skip-permissions                    Bypass all permission checks. Recommended only for sandboxes with no internet access.
                                                    绕过所有权限检查. 仅推荐用于无法访问互联网的沙箱环境.

  -d, --debug [filter]                              Enable debug mode with optional category filtering (e.g., "api,hooks" or "!1p,!file")

  --debug-file <path>                               Write debug logs to a specific file path (implicitly enables debug mode)

  --disable-slash-commands                          Disable all skills

  --disallowedTools, --disallowed-tools <tools...>  Comma or space-separated list of tool names to deny (e.g. "Bash(git:*) Edit")

  --effort <level>                                  Effort level for the current session (low, medium, high, max)
                                                    当前会话的努力程度

  --fallback-model <model>                          Enable automatic fallback to specified model when default model is overloaded (only works with --print)
                                                    当默认模型过载时, 启用自动回退到指定模型的功能.

  --file <specs...>                                 File resources to download at startup. Format: file_id:relative_path (e.g., --file file_abc:doc.txt file_def:img.png)

  --fork-session                                    When resuming, create a new session ID instead of reusing the original (use with --resume or --continue)
                                                    恢复会话时, 请创建一个新的会话 ID, 而不是重用原来的会话 ID.

  --from-pr [value]                                 Resume a session linked to a PR by PR number/URL, or open interactive picker with optional search term
                                                    通过 PR 编号/URL 恢复与 PR 关联的会话, 或打开带有可选搜索词的交互式选择器.

  -h, --help                                        Display help for command

  --ide                                             Automatically connect to IDE on startup if exactly one valid IDE is available

  --include-partial-messages                        Include partial message chunks as they arrive (only works with --print and --output-format=stream-json)
                                                    收到部分消息时, 请将其包含在内.

  --input-format <format>                           Input format (only works with --print): "text" (default), or "stream-json" (realtime streaming input) (choices: "text", "stream-json")

  --json-schema <schema>                            JSON Schema for structured output validation. Example: {"type":"object","properties":{"name":{"type":"string"}},"required":["name"]}

  --max-budget-usd <amount>                         Maximum dollar amount to spend on API calls (only works with --print)
                                                    API 调用最高消费金额

  --mcp-config <configs...>                         Load MCP servers from JSON files or strings (space-separated)

  --mcp-debug                                       [DEPRECATED. Use --debug instead] Enable MCP debug mode (shows MCP server errors)

  --model <model>                                   Model for the current session. Provide an alias for the latest model (e.g. 'sonnet' or 'opus') or a model's full name (e.g. 'claude-sonnet-4-6').

  -n, --name <name>                                 Set a display name for this session (shown in /resume and terminal title)

  --no-chrome                                       Disable Claude in Chrome integration

  --no-session-persistence                          Disable session persistence - sessions will not be saved to disk and cannot be resumed (only works with --print)

  --output-format <format>                          Output format (only works with --print): "text" (default), "json" (single result), or "stream-json" (realtime streaming) (choices: "text", "json", "stream-json")

  --permission-mode <mode>                          Permission mode to use for the session (choices: "acceptEdits", "bypassPermissions", "default", "dontAsk", "plan", "auto")

  --plugin-dir <path>                               Load plugins from a directory for this session only (repeatable: --plugin-dir A --plugin-dir B) (default: [])

  -p, --print                                       Print response and exit (useful for pipes). Note: The workspace trust dialog is skipped when Claude is run with the -p mode. Only use this flag in directories you trust.
                                                    打印响应并退出(适用于管道). 注意: 使用 -p 模式运行 Claude 时, 会跳过工作区信任对话框. 仅在您信任的目录中使用此标志.

  --replay-user-messages                            Re-emit user messages from stdin back on stdout for acknowledgment (only works with --input-format=stream-json and --output-format=stream-json)
                                                    将用户消息从标准输入重新发送到标准输出以进行确认.

  -r, --resume [value]                              Resume a conversation by session ID, or open interactive picker with optional search term
                                                    通过会话 ID 恢复对话, 或打开带有可选搜索词的交互式选择器

  --session-id <uuid>                               Use a specific session ID for the conversation (must be a valid UUID)

  --setting-sources <sources>                       Comma-separated list of setting sources to load (user, project, local).

  --settings <file-or-json>                         Path to a settings JSON file or a JSON string to load additional settings from

  --strict-mcp-config                               Only use MCP servers from --mcp-config, ignoring all other MCP configurations

  --system-prompt <prompt>                          System prompt to use for the session

  --tmux                                            Create a tmux session for the worktree (requires --worktree). Uses iTerm2 native panes when available; use --tmux=classic for traditional tmux.

  --tools <tools...>                                Specify the list of available tools from the built-in set. Use "" to disable all tools, "default" to use all tools, or specify tool names (e.g. "Bash,Edit,Read").

  --verbose                                         Override verbose mode setting from config

  -v, --version                                     Output the version number

  -w, --worktree [name]                             Create a new git worktree for this session (optionally specify a name)

Commands:
  agents [options]                                  List configured agents
  auth                                              Manage authentication
  doctor                                            Check the health of your Claude Code auto-updater
  install [options] [target]                        Install Claude Code native build. Use [target] to specify version (stable, latest, or specific version)
  mcp                                               Configure and manage MCP servers
  plugin|plugins                                    Manage Claude Code plugins
  setup-token                                       Set up a long-lived authentication token (requires Claude subscription)
  update|upgrade                                    Check for updates and install if available
$
```
