# Claude Code

## Help General

```bash
  Help  General   Commands   Custom commands


  Claude understands your codebase, makes edits with your permission, and executes commands — right from your terminal.
  Claude 能够理解你的代码库，经你许可执行修改，并直接在你的终端中运行命令。

  New here? Run /powerup to learn the features most people miss.
  初来乍到？运行 `/powerup` 即可了解那些常被用户忽略的实用功能。

  Shortcuts
  ! for shell mode          double tap esc to clear input        ctrl + shift + _ to undo
  / for commands            shift + tab to auto-accept edits     ctrl + z to suspend
  @ for file paths          ctrl + o for verbose output          ctrl + v to paste images
  & for background          ctrl + t to toggle tasks             ctrl + s to stash prompt
  /btw for side question    backslash (\) + return (⏎) for       ctrl + g to edit in $EDITOR
                            newline                              /keybindings to customize

  `!` 进入 Shell 模式       双击 `Esc` 清空输入                       `Ctrl + shift + _` 撤销操作
  `/` 执行命令              `Shift + tab` 自动接受修改                `Ctrl + z` 挂起会话
  `@` 引用文件路径           `Ctrl + o` 切换详细输出                   `Ctrl + v` 粘贴图片
  `&` 后台运行              `Ctrl + t` 切换任务                      `Ctrl + s` 暂存提示词
  `/btw` 提出旁注问题        反斜杠 `\` + 回车 `⏎` 换行（插入新行）      `Ctrl + g` 在 `$EDITOR` 中编辑
                                                                   `/keybindings` 自定义快捷键

```

## Help Commands

```bash
  Help  General   Commands   Custom commands


  Browse default commands

    /add-dir
      Add a new working directory
    /agents
      Manage agent configurations
    /background
      Send this session to the background and free the terminal
    /branch
      Create a branch of the current conversation at this point
    /btw
      Ask a quick side question without interrupting the main conversation
    /clear
      Start a new session with empty context; previous session stays on disk (resumable with /resume)
    /color
      Set the prompt bar color for this session
    /compact
      Free up context by summarizing the conversation so far
    /config
      Open config panel
    /context
      Visualize current context usage as a colored grid
    /copy
      Copy Claude's last response to clipboard (or /copy N for the Nth-latest)
    /diff
      View uncommitted changes and per-turn diffs
    /doctor
      Diagnose and verify your Claude Code installation and settings
    /effort
      Set effort level for model usage
    /exit
      Exit the CLI
    /export
      Export the current conversation to a file or clipboard
    /fast
      Toggle fast mode (Opus 4.7)
    /feedback
      Submit feedback, report a bug, or share your conversation
    /focus
      Toggle focus view (show only your prompt, a tool summary, and the final response)
    /goal
      Set a goal — keep working until the condition is met
    /help
      Show help and available commands
    /hooks
      View hook configurations for tool events
    /ide
      Manage IDE integrations and show status
    /init
      Initialize a new CLAUDE.md file with codebase documentation
    /insights
      Generate a report analyzing your Claude Code sessions
    /keybindings
      Open or create your keybindings configuration file
    /login
      Sign in with your Anthropic account
    /logout
      Sign out from your Anthropic account
    /mcp
      Manage MCP servers
    /memory
      Edit Claude memory files
    /mobile
      Show QR code to download the Claude mobile app
    /model
      Set the AI model for Claude Code (currently deepseek-v4-pro)
    /permissions
      Manage allow & deny tool permission rules
    /plan
      Enable plan mode or view the current session plan
    /plugin
      Manage Claude Code plugins
    /powerup
      Discover Claude Code features through quick interactive lessons
    /recap
      Generate a one-line session recap now
    /release-notes
      View release notes
    /reload-plugins
      Activate pending plugin changes in the current session
    /rename
      Rename the current conversation
    /resume
      Resume a previous conversation
    /review
      Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes — Standards (does the code follow this repo's documented coding st…
    /rewind
      Restore the code and/or conversation to a previous point
    /sandbox
      ⚠ sandbox disabled (⏎ to configure)
    /security-review
      Complete a security review of the pending changes on the current branch
    /skills
      List available skills
    /status
      Show Claude Code status including version, model, account, API connectivity, and tool statuses
    /statusline
      Set up Claude Code's status line UI
    /stickers
      Order Claude Code stickers
    /tasks
      List and manage background tasks
    /team-onboarding
      Help teammates ramp on Claude Code with a guide from your usage
    /terminal-setup
      Install Shift+Enter key binding for newlines
    /theme
      Change the theme
    /tui
      Set the terminal UI renderer (default | fullscreen)

```

## help --help

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
