# Environment variables

* https://code.claude.com/docs/en/env-vars

Complete reference for environment variables that control Claude Code behavior.
控制 Claude Code 行为的环境变量完整参考.

Claude Code supports the following environment variables to control its behavior. Set them in your shell before launching `claude`, or configure them in [`settings.json`](https://code.claude.com/docs/en/settings#available-settings) under the `env` key to apply them to every session or roll them out across your team.
Claude Code 支持以下环境变量来控制其行为. 您可以在启动 `claude` 之前在 shell 中设置这些变量, 或者在 [`settings.json`](https://code.claude.com/docs/en/settings#available-settings) 中的 `env` 键下进行配置, 以便将它们应用于每个会话或在整个团队中推广.

- `ANTHROPIC_API_KEY`

  API key sent as `X-Api-Key` header. When set, this key is used instead of your Claude Pro, Max, Team, or Enterprise subscription even if you are logged in. In non-interactive mode (`-p`), the key is always used when present. In interactive mode, you are prompted to approve the key once before it overrides your subscription. To use your subscription instead, run `unset ANTHROPIC_API_KEY`

  API 密钥以 `X-Api-Key` 标头的形式发送. 设置此密钥后, 即使您已登录, 系统也会使用此密钥代替您的 Claude Pro、Max、Team 或 Enterprise 订阅. 在非交互模式( `-p` )下, 如果密钥存在, 则始终使用该密钥. 在交互模式下, 系统会提示您批准密钥一次, 然后密钥才会覆盖您的订阅. 要使用您的订阅, 请运行 `unset ANTHROPIC_API_KEY`

- `ANTHROPIC_AUTH_TOKEN`

  Custom value for the `Authorization` header (the value you set here will be prefixed with `Bearer` )

  `Authorization` 标头的自定义值(您在此处设置的值将以 `Bearer` 为前缀)

- `ANTHROPIC_BASE_URL`

  Override the API endpoint to route requests through a proxy or gateway. When set to a non-first-party host, [MCP tool search](https://code.claude.com/docs/en/mcp#scale-with-mcp-tool-search) is disabled by default. Set `ENABLE_TOOL_SEARCH=true` if your proxy forwards `tool_reference` blocks

  覆盖 API 端点, 以通过代理或网关路由请求. 如果设置为非第一方主机, 则 MCP 工具搜索默认处于禁用状态. 如果您的代理转发 `tool_reference` 块, 请设置 `ENABLE_TOOL_SEARCH=true`

- `ANTHROPIC_CUSTOM_HEADERS`

  Custom headers to add to requests (`Name: Value` format, newline-separated for multiple headers)

  要添加到请求中的自定义标头(`Name: Value` 格式, 多个标头之间用换行符分隔)

- `ANTHROPIC_CUSTOM_MODEL_OPTION`

  Model ID to add as a custom entry in the `/model` picker. Use this to make a non-standard or gateway-specific model selectable without replacing built-in aliases. See [Model configuration](https://code.claude.com/docs/en/model-config#add-a-custom-model-option)

  要将模型 ID 添加为 `/model` 选择器中的自定义条目. 使用此功能可使非标准模型或网关特定模型可供选择, 而无需替换内置别名. 请参阅模型配置.

- `ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION`

  Display description for the custom model entry in the `/model` picker. Defaults to `Custom model (<model-id>)` when not set

  在 `/model` 选择器中显示自定义模型条目的描述. 如果未设置, 则默认为 `Custom model (<model-id>)`

- `ANTHROPIC_CUSTOM_MODEL_OPTION_NAME`

  Display name for the custom model entry in the `/model` picker. Defaults to the model ID when not set

  在 `/model` 选择器中自定义模型条目的显示名称. 如果未设置, 则默认为模型 ID.

- `ANTHROPIC_DEFAULT_HAIKU_MODEL`

  See [Model configuration](https://code.claude.com/docs/en/model-config#environment-variables)

  请参阅模型配置

- `ANTHROPIC_DEFAULT_OPUS_MODEL`

  See [Model configuration](https://code.claude.com/docs/en/model-config#environment-variables)

  请参阅模型配置

- `ANTHROPIC_DEFAULT_SONNET_MODEL`

  See [Model configuration](https://code.claude.com/docs/en/model-config#environment-variables)

  请参阅模型配置

- `ANTHROPIC_FOUNDRY_API_KEY`

  API key for Microsoft Foundry authentication (see [Microsoft Foundry](https://code.claude.com/docs/en/microsoft-foundry))

  用于 Microsoft Foundry 身份验证的 API 密钥请参阅 Microsoft Foundry

- `ANTHROPIC_FOUNDRY_BASE_URL`

  Full base URL for the Foundry resource (for example, `https://my-resource.services.ai.azure.com/anthropic`). Alternative to `ANTHROPIC_FOUNDRY_RESOURCE` (see [Microsoft Foundry](https://code.claude.com/docs/en/microsoft-foundry))

  Foundry 资源的完整基本 URL(例如 `https://my-resource.services.ai.azure.com/anthropic` ). ANTHROPIC_FOUNDRY_RESOURCE `ANTHROPIC_FOUNDRY_RESOURCE` 替代方案参见 Microsoft Foundry.

- `ANTHROPIC_FOUNDRY_RESOURCE`

  Foundry resource name (for example, `my-resource`). Required if `ANTHROPIC_FOUNDRY_BASE_URL` is not set (see [Microsoft Foundry](https://code.claude.com/docs/en/microsoft-foundry))

  Foundry 资源名称(例如, `my-resource` ). 如果未设置 `ANTHROPIC_FOUNDRY_BASE_URL` 则此项为必填项请参阅 Microsoft Foundry.

- `ANTHROPIC_MODEL`

  Name of the model setting to use (see [Model Configuration](https://code.claude.com/docs/en/model-config#environment-variables))

  要使用的模型设置名称参见模型配置

- `ANTHROPIC_SMALL_FAST_MODEL`

  [DEPRECATED] Name of [Haiku-class model for background tasks](https://code.claude.com/docs/en/costs)

  [已弃用] 后台任务的 Haiku 类模型名称

- `ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION`

  Override AWS region for the Haiku-class model when using Bedrock

  使用 Bedrock 时, 请为 Haiku 类模型覆盖 AWS 区域

- `AWS_BEARER_TOKEN_BEDROCK`

  Bedrock API key for authentication (see [Bedrock API keys](https://aws.amazon.com/blogs/machine-learning/accelerate-ai-development-with-amazon-bedrock-api-keys/))

  用于身份验证的 Bedrock API 密钥请参阅 Bedrock API 密钥

- `BASH_DEFAULT_TIMEOUT_MS`

  Default timeout for long-running bash commands

  长时间运行的 bash 命令的默认超时时间

- `BASH_MAX_OUTPUT_LENGTH`

  Maximum number of characters in bash outputs before they are middle-truncated

  bash 输出中被截断前的最大字符数

- `BASH_MAX_TIMEOUT_MS`

  Maximum timeout the model can set for long-running bash commands

  模型可为长时间运行的 bash 命令设置的最大超时时间

- `CLAUDECODE`

  Set to `1` in shell environments Claude Code spawns (Bash tool, tmux sessions). Not set in [hooks](https://code.claude.com/docs/en/hooks) or [status line](https://code.claude.com/docs/en/statusline) commands. Use to detect when a script is running inside a shell spawned by Claude Code

  在 Claude Code 生成的 shell 环境(Bash 工具、tmux 会话)中设置为 `1` 在钩子或状态行命令中不设置. 用于检测脚本何时在 Claude Code 生成的 shell 中运行.

- `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE`

  Set the percentage of context capacity (1-100) at which auto-compaction triggers. By default, auto-compaction triggers at approximately 95% capacity. Use lower values like `50` to compact earlier. Values above the default threshold have no effect. Applies to both main conversations and subagents. This percentage aligns with the `context_window.used_percentage` field available in [status line](https://code.claude.com/docs/en/statusline)

  设置自动压缩触发上下文容量的百分比(1-100). 默认情况下, 自动压缩会在大约 95% 的容量时触发. 使用较低的值例如 `50` 可以更早地进行压缩. 高于默认阈值的值无效. 此设置适用于主对话和 subagent. 此百分比与状态行中的 `context_window.used_percentage` 字段相对应.

- `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR`

  Return to the original working directory after each Bash command
  每个 Bash 命令执行完毕后, 返回到原始工作目录.

- `CLAUDE_CODE_ACCOUNT_UUID`

  Account UUID for the authenticated user. Used by SDK callers to provide account information synchronously, avoiding a race condition where early telemetry events lack account metadata. Requires `CLAUDE_CODE_USER_EMAIL` and `CLAUDE_CODE_ORGANIZATION_UUID` to also be set

  已验证用户的帐户 UUID. SDK 调用者使用此 UUID 同步提供帐户信息, 避免早期遥测事件缺少帐户元数据而导致的竞争条件. 需要同时设置 `CLAUDE_CODE_USER_EMAIL` 和 `CLAUDE_CODE_ORGANIZATION_UUID`

- `CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD`

  Set to `1` to load CLAUDE.md files from directories specified with `--add-dir`. By default, additional directories do not load memory files

  设置为 `1` 可从使用 `--add-dir` 指定的目录加载 CLAUDE.md 文件. 默认情况下, 不会加载其他目录的内存文件.

- `CLAUDE_CODE_AUTO_COMPACT_WINDOW`

  Set the context capacity in tokens used for auto-compaction calculations. Defaults to the model's context window: 200K for standard models or 1M for [extended context](https://code.claude.com/docs/en/model-config#extended-context) models. Use a lower value like `500000` on a 1M model to treat the window as 500K for compaction purposes. The value is capped at the model's actual context window. `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` is applied as a percentage of this value. Setting this variable decouples the compaction threshold from the status line's `used_percentage`, which always uses the model's full context window

  设置用于自动压缩计算的上下文容量(以 token 为单位). 默认值为模型的上下文窗口: 标准模型为 200K, 扩展上下文模型为 1M. 对于 1M 的模型, 可以使用较小的值(例如 `500000` )来将窗口视为 500K 进行压缩. 该值上限为模型的实际上下文窗口大小. `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` 表示该值的百分比. 设置此变量可将压缩阈值与状态行中的 `used_percentage` 解耦, 后者始终使用模型的完整上下文窗口.

- `CLAUDE_CODE_API_KEY_HELPER_TTL_MS`

  Interval in milliseconds at which credentials should be refreshed (when using [`apiKeyHelper`](https://code.claude.com/docs/en/settings#available-settings))

  使用 `apiKeyHelper` 时, 凭据刷新的间隔(以毫秒为单位)

- `CLAUDE_CODE_CLIENT_CERT`

  Path to client certificate file for mTLS authentication

  用于 mTLS 身份验证的客户端证书文件路径

- `CLAUDE_CODE_CLIENT_KEY`

  Path to client private key file for mTLS authentication

  用于 mTLS 身份验证的客户端私钥文件路径

- `CLAUDE_CODE_CLIENT_KEY_PASSPHRASE`

  Passphrase for encrypted CLAUDE_CODE_CLIENT_KEY (optional)

  加密 CLAUDE_CODE_CLIENT_KEY 的密码短语(可选)

- `CLAUDE_CODE_DISABLE_1M_CONTEXT`

  Set to `1` to disable [1M context window](https://code.claude.com/docs/en/model-config#extended-context) support. When set, 1M model variants are unavailable in the model picker. Useful for enterprise environments with compliance requirements

  设置为 `1` 可禁用 1M 上下文窗口支持. 启用后, 模型选择器中将无法使用 1M 模型变体. 适用于有合规性要求的企业环境.

- `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING`

  Set to `1` to disable [adaptive reasoning](https://code.claude.com/docs/en/model-config#adjust-effort-level) for Opus 4.6 and Sonnet 4.6. When disabled, these models fall back to the fixed thinking budget controlled by `MAX_THINKING_TOKENS`

  设置为 `1` 可禁用 Opus 4.6 和 Sonnet 4.6 的自适应推理. 禁用后, 这些模型将回退到由 `MAX_THINKING_TOKENS` 控制的固定思维预算.

- `CLAUDE_CODE_DISABLE_AUTO_MEMORY`

  Set to `1` to disable [auto memory](https://code.claude.com/docs/en/memory#auto-memory). Set to `0` to force auto memory on during the gradual rollout. When disabled, Claude does not create or load auto memory files

  设置为 `1` 可禁用自动内存. 设置为 `0` 可在逐步部署期间强制启用自动内存. 禁用后, Claude 将不会创建或加载自动内存文件.

- `CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS`

  Set to `1` to remove built-in commit and PR workflow instructions from Claude's system prompt. Useful when using your own git workflow skills. Takes precedence over the [`includeGitInstructions`](https://code.claude.com/docs/en/settings#available-settings) setting when set

  设置为 `1` 可从 Claude 的系统提示符中移除内置的提交和 PR 工作流指令. 这在您使用自己的 Git 工作流技能时非常有用. 设置后, 此设置优先于 `includeGitInstructions` 设置.

- `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS`

  Set to `1` to disable all background task functionality, including the `run_in_background` parameter on Bash and subagent tools, auto-backgrounding, and the Ctrl+B shortcut

  设置为 `1` 可禁用所有后台任务功能, 包括 Bash 和 subagent 工具中的 `run_in_background` 参数、自动后台运行以及 Ctrl+B 快捷键.

- `CLAUDE_CODE_DISABLE_CRON`

  Set to `1` to disable [scheduled tasks](https://code.claude.com/docs/en/scheduled-tasks). The `/loop` skill and cron tools become unavailable and any already-scheduled tasks stop firing, including tasks that are already running mid-session

  设置为 `1` 可禁用计划任务. `/loop` 和 cron 工具将不可用, 所有已计划的任务将停止执行, 包括正在运行的任务.

- `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS`

  Set to `1` to strip Anthropic-specific `anthropic-beta` request headers and beta tool-schema fields (such as `defer_loading` and `eager_input_streaming`) from API requests. Use this when a proxy gateway rejects requests with errors like "Unexpected value(s) for the `anthropic-beta` header" or "Extra inputs are not permitted". Standard fields (`name`, `description`, `input_schema`, `cache_control`) are preserved.

  设置为 `1` 可从 API 请求中移除 Anthropic 特有的 `anthropic-beta` 请求头和 beta 工具模式字段(例如 `defer_loading` 和 `eager_input_streaming` ). 当代理网关拒绝请求并出现"`anthropic-beta`请求头的值意外"或"不允许额外输入"之类的错误时, 请使用此选项. 标准字段( `name`、`description`、`input_schema`、`cache_control` )将被保留.

- `CLAUDE_CODE_DISABLE_FAST_MODE`

  Set to `1` to disable [fast mode](https://code.claude.com/docs/en/fast-mode)

  设置为 `1` 可禁用快速模式

- `CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY`

  Set to `1` to disable the "How is Claude doing?" session quality surveys. Surveys are also disabled when `DISABLE_TELEMETRY` or `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` is set. See [Session quality surveys](https://code.claude.com/docs/en/data-usage#session-quality-surveys)

  设置为 `1` 可禁用"Claude 的表现如何?"会话质量调查. 设置 `DISABLE_TELEMETRY` 或 `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` 时, 调查也会被禁用. 请参阅会话质量调查.

- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`

  Equivalent of setting `DISABLE_AUTOUPDATER`, `DISABLE_FEEDBACK_COMMAND`, `DISABLE_ERROR_REPORTING`, and `DISABLE_TELEMETRY`

  相当于设置 `DISABLE_AUTOUPDATER`、`DISABLE_FEEDBACK_COMMAND`、`DISABLE_ERROR_REPORTING` 和 `DISABLE_TELEMETRY`

- `CLAUDE_CODE_DISABLE_TERMINAL_TITLE`
  Set to `1` to disable automatic terminal title updates based on conversation context

  设置为 `1` 可禁用基于对话上下文的终端标题自动更新

- `CLAUDE_CODE_EFFORT_LEVEL`

  Set the effort level for supported models. Values: `low`, `medium`, `high`, `max` (Opus 4.6 only), or `auto` to use the model default. Takes precedence over `/effort` and the `effortLevel` setting. See [Adjust effort level](https://code.claude.com/docs/en/model-config#adjust-effort-level)

  设置受支持模型的开发难度级别. 取值: `low`、`medium`、`high`、`max`(仅限 Opus 4.6)或 `auto`(使用模型默认值). 此设置优先于 `/effort` 和 `effortLevel` 设置. 请参阅 "调整开发难度级别".

- `CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION`

  Set to `false` to disable prompt suggestions (the "Prompt suggestions" toggle in `/config`). These are the grayed-out predictions that appear in your prompt input after Claude responds. See [Prompt suggestions](https://code.claude.com/docs/en/interactive-mode#prompt-suggestions)

  设置为 `false` 可禁用提示建议(位于 `/config` 中的"提示建议"开关). 这些建议是 Claude 响应后显示在提示输入框中的灰色预测. 请参阅提示建议.

- `CLAUDE_CODE_ENABLE_TASKS`

  Set to `true` to enable the task tracking system in non-interactive mode (the `-p` flag). Tasks are on by default in interactive mode. See [Task list](https://code.claude.com/docs/en/interactive-mode#task-list)

  设置为 `true` 可在非交互模式下启用任务跟踪系统(使用 `-p` 标志). 任务在交互模式下默认启用. 请参阅任务列表.

- `CLAUDE_CODE_ENABLE_TELEMETRY`

  Set to `1` to enable OpenTelemetry data collection for metrics and logging. Required before configuring OTel exporters. See [Monitoring](https://code.claude.com/docs/en/monitoring-usage)

  设置为 `1` 以启用 OpenTelemetry 数据收集, 用于指标和日志记录. 配置 OTel 导出器之前必须进行此操作. 请参阅 "监控"部分.

- `CLAUDE_CODE_EXIT_AFTER_STOP_DELAY`

  Time in milliseconds to wait after the query loop becomes idle before automatically exiting. Useful for automated workflows and scripts using SDK mode

  查询循环空闲后自动退出前等待的时间(以毫秒为单位). 适用于使用 SDK 模式的自动化工作流程和脚本.

- `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS`

  Set to `1` to enable [agent teams](https://code.claude.com/docs/en/agent-teams). Agent teams are experimental and disabled by default

  设置为 `1` 可启用代理团队. 代理团队功能目前处于实验阶段, 默认情况下处于禁用状态.

- `CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS`

  Override the default token limit for file reads. Useful when you need to read larger files in full

  覆盖文件读取的默认 tokens 限制. 当您需要完整读取较大的文件时, 此功能非常有用.

- `CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL`

  Skip auto-installation of IDE extensions

  跳过 IDE 扩展的自动安装

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`

  Set the maximum number of output tokens for most requests. Defaults and caps vary by model; see [max output tokens](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison). Increasing this value reduces the effective context window available before [auto-compaction](https://code.claude.com/docs/en/costs#reduce-token-usage) triggers.

  设置大多数请求的最大输出 tokens 数. 默认值和上限因型号而异; 请参阅最大输出 tokens. 增加此值会减少自动压缩触发前可用的有效上下文窗口.

- `CLAUDE_CODE_NEW_INIT`

  Set to `true` to make `/init` run an interactive setup flow. The flow asks which files to generate, including CLAUDE.md, skills, and hooks, before exploring the codebase and writing them. Without this variable, `/init` generates a CLAUDE.md automatically without prompting.

  设置为 `true` 可使 `/init` 运行交互式设置流程. 该流程会询问要生成哪些文件, 包括 CLAUDE.md、skills 和 hooks, 然后再探索代码库并编写这些文件. 如果没有此变量, `/init` 会自动生成 CLAUDE.md 文件, 无需提示.

- `CLAUDE_CODE_ORGANIZATION_UUID`

  Organization UUID for the authenticated user. Used by SDK callers to provide account information synchronously. Requires `CLAUDE_CODE_ACCOUNT_UUID` and `CLAUDE_CODE_USER_EMAIL` to also be set

  已验证用户的组织 UUID. 供 SDK 调用者同步提供帐户信息. 需要同时设置 `CLAUDE_CODE_ACCOUNT_UUID` 和 `CLAUDE_CODE_USER_EMAIL`

- `CLAUDE_CODE_OTEL_HEADERS_HELPER_DEBOUNCE_MS`

  Interval for refreshing dynamic OpenTelemetry headers in milliseconds (default: 1740000 / 29 minutes). See [Dynamic headers](https://code.claude.com/docs/en/monitoring-usage#dynamic-headers)

  刷新动态 OpenTelemetry 标头的间隔时间(以毫秒为单位)(默认值: 1740000 / 29 分钟). 请参阅 "动态标头".

- `CLAUDE_CODE_PLAN_MODE_REQUIRED`

  Auto-set to `true` on [agent team](https://code.claude.com/docs/en/agent-teams) teammates that require plan approval. Read-only: set by Claude Code when spawning teammates. See [require plan approval](https://code.claude.com/docs/en/agent-teams#require-plan-approval-for-teammates)

  自动设置为需要计划审批的特工团队成员为 `true`. 只读: 由 Claude Code 在生成团队成员时设置. 参见"需要计划审批"

- `CLAUDE_CODE_PLUGIN_GIT_TIMEOUT_MS`

  Timeout in milliseconds for git operations when installing or updating plugins (default: 120000). Increase this value for large repositories or slow network connections. See [Git operations time out](https://code.claude.com/docs/en/plugin-marketplaces#git-operations-time-out)

  安装或更新插件时 Git 操作的超时时间(以毫秒为单位)(默认值: 120000). 对于大型仓库或网络连接速度较慢的情况, 请增加此值. 请参阅 Git 操作超时.

- `CLAUDE_CODE_PLUGIN_SEED_DIR`

  Path to one or more read-only plugin seed directories, separated by `:` on Unix or `;` on Windows. Use this to bundle a pre-populated plugins directory into a container image. Claude Code registers marketplaces from these directories at startup and uses pre-cached plugins without re-cloning. See [Pre-populate plugins for containers](https://code.claude.com/docs/en/plugin-marketplaces#pre-populate-plugins-for-containers)

  指向一个或多个只读插件种子目录的路径, 在 Unix 系统上以 `:` 分隔, 在 Windows 系统上以分号 `;` 分隔. 使用此选项可将预填充的插件目录打包到容器镜像中. Claude Code 会在启动时从这些目录中注册市场, 并使用预缓存的插件, 而无需重新克隆. 请参阅 "为容器预填充插件".

- `CLAUDE_CODE_PROXY_RESOLVES_HOSTS`

  Set to `true` to allow the proxy to perform DNS resolution instead of the caller. Opt-in for environments where the proxy should handle hostname resolution

  设置为 `true` 可允许代理服务器代替调用方执行 DNS 解析. 在需要代理服务器处理主机名解析的环境中, 请选择启用此选项.

- `CLAUDE_CODE_SESSIONEND_HOOKS_TIMEOUT_MS`

  Maximum time in milliseconds for [SessionEnd](https://code.claude.com/docs/en/hooks#sessionend) hooks to complete (default: `1500`). Applies to both session exit and `/clear`. Per-hook `timeout` values are also capped by this budget

  SessionEnd 钩子完成的最长时间(以毫秒为单位, 默认值: `1500`). 此设置同时适用于会话退出和 `/clear` 命令. 每个钩子的 `timeout` 值也受此限制.

- `CLAUDE_CODE_SHELL`

  Override automatic shell detection. Useful when your login shell differs from your preferred working shell (for example, `bash` vs `zsh`)

  覆盖自动 shell 检测. 当您的登录 shell 与您首选的工作 shell 不同时(例如, `bash` 与 `zsh`), 此功能非常有用.

- `CLAUDE_CODE_SHELL_PREFIX`

  Command prefix to wrap all bash commands (for example, for logging or auditing). Example: `/path/to/logger.sh` will execute `/path/to/logger.sh <command>`

  用于包装所有 bash 命令的命令前缀(例如, 用于日志记录或审计). 例如: `/path/to/logger.sh` 将执行 `/path/to/logger.sh <command>`

- `CLAUDE_CODE_SIMPLE`

  Set to `1` to run with a minimal system prompt and only the Bash, file read, and file edit tools. Disables MCP tools, attachments, hooks, and CLAUDE.md files

  设置为 `1` 以最小系统提示符运行, 仅使用 Bash、文件读取和文件编辑工具. 禁用 MCP 工具、附件、钩子和 CLAUDE.md 文件.

- `CLAUDE_CODE_SKIP_BEDROCK_AUTH`

  Skip AWS authentication for Bedrock (for example, when using an LLM gateway)

  跳过 Bedrock 的 AWS 身份验证(例如, 在使用 LLM 网关时)

- `CLAUDE_CODE_SKIP_FAST_MODE_NETWORK_ERRORS`

  Set to `1` to allow [fast mode](https://code.claude.com/docs/en/fast-mode) when the organization status check fails due to a network error. Useful when a corporate proxy blocks the status endpoint. The API still enforces organization-level disable separately

  设置为 `1` 可在因网络错误导致组织状态检查失败时启用快速模式. 当企业代理阻止状态端点时非常有用. API 仍会单独强制执行组织级别的禁用.

- `CLAUDE_CODE_SKIP_FOUNDRY_AUTH`

  Skip Azure authentication for Microsoft Foundry (for example, when using an LLM gateway)

  跳过 Microsoft Foundry 的 Azure 身份验证(例如, 在使用 LLM 网关时)

- `CLAUDE_CODE_SKIP_VERTEX_AUTH`

  Skip Google authentication for Vertex (for example, when using an LLM gateway)

  跳过 Vertex 的 Google 身份验证(例如, 在使用 LLM 网关时)

- `CLAUDE_CODE_SUBAGENT_MODEL`

  See [Model configuration](https://code.claude.com/docs/en/model-config)

  请参阅模型配置

- `CLAUDE_CODE_TASK_LIST_ID`

  Share a task list across sessions. Set the same ID in multiple Claude Code instances to coordinate on a shared task list. See [Task list](https://code.claude.com/docs/en/interactive-mode#task-list)

  跨会话共享任务列表. 在多个 Claude Code 实例中设置相同的 ID, 即可协调处理共享的任务列表. 请参阅 "任务列表".

- `CLAUDE_CODE_TEAM_NAME`

  Name of the agent team this teammate belongs to. Set automatically on [agent team](https://code.claude.com/docs/en/agent-teams) members

  该队友所属的代理团队名称. 此设置会自动应用于代理团队成员.

- `CLAUDE_CODE_TMPDIR`

  Override the temp directory used for internal temp files. Claude Code appends `/claude/` to this path. Default: `/tmp` on Unix/macOS, `os.tmpdir()` on Windows

  覆盖用于内部临时文件的临时目录. Claude Code 会在此路径后附加 `/claude/`. 默认值: Unix/macOS 系统为 `/tmp`, Windows 系统为 `os.tmpdir()`

- `CLAUDE_CODE_USER_EMAIL`

  Email address for the authenticated user. Used by SDK callers to provide account information synchronously. Requires `CLAUDE_CODE_ACCOUNT_UUID` and `CLAUDE_CODE_ORGANIZATION_UUID` to also be set

  已验证用户的电子邮件地址. SDK 调用者使用此地址同步提供帐户信息. 需要同时设置 `CLAUDE_CODE_ACCOUNT_UUID` 和 `CLAUDE_CODE_ORGANIZATION_UUID`

- `CLAUDE_CODE_USE_BEDROCK`

  Use [Bedrock](https://code.claude.com/docs/en/amazon-bedrock)

  使用 Bedrock

- `CLAUDE_CODE_USE_FOUNDRY`

  Use [Microsoft Foundry](https://code.claude.com/docs/en/microsoft-foundry)

  使用 Microsoft Foundry

- `CLAUDE_CODE_USE_VERTEX`

  Use [Vertex](https://code.claude.com/docs/en/google-vertex-ai)

  使用 Vertex

- `CLAUDE_CONFIG_DIR`

  Customize where Claude Code stores its configuration and data files

  自定义 Claude Code 存储其配置和数据文件的位置

- `CLAUDE_ENV_FILE`

  Path to a shell script that Claude Code sources before each Bash command. Use to persist virtualenv or conda activation across commands. Also populated dynamically by [SessionStart hooks](https://code.claude.com/docs/en/hooks#persist-environment-variables)

  Claude Code 在每个 Bash 命令执行前都会加载的 shell 脚本路径. 用于在命令之间保持 virtualenv 或 conda 激活状态的持久性. 此外, SessionStart 钩子也会动态填充此路径.

- `DISABLE_AUTOUPDATER`

  Set to `1` to disable automatic updates.

  设置为 `1` 可禁用自动更新.

- `DISABLE_COST_WARNINGS`

  Set to `1` to disable cost warning messages

  设置为 `1` 可禁用费用警告消息

- `DISABLE_ERROR_REPORTING`

  Set to `1` to opt out of Sentry error reporting

  设置为 `1` 可选择退出 Sentry 错误报告

- `DISABLE_FEEDBACK_COMMAND`

  Set to `1` to disable the `/feedback` command. The older name `DISABLE_BUG_COMMAND` is also accepted

  设置为 `1` 可禁用 `/feedback` 命令. 旧名称 `DISABLE_BUG_COMMAND` 也可接受.

- `DISABLE_INSTALLATION_CHECKS`

  Set to `1` to disable installation warnings. Use only when manually managing the installation location, as this can mask issues with standard installations

  设置为 `1` 可禁用安装警告. 仅当手动管理安装位置时才使用此设置, 因为这可能会掩盖标准安装中的问题.

- `DISABLE_PROMPT_CACHING`

  Set to `1` to disable prompt caching for all models (takes precedence over per-model settings)

  设置为 `1` 可禁用所有模型的提示缓存(优先于单个模型的设置)

- `DISABLE_PROMPT_CACHING_HAIKU`

  Set to `1` to disable prompt caching for Haiku models

  设置为 `1` 可禁用 Haiku 模型提示缓存

- `DISABLE_PROMPT_CACHING_OPUS`

  Set to `1` to disable prompt caching for Opus models

  设置为 `1` 可禁用 Opus 型号的提示缓存

- `DISABLE_PROMPT_CACHING_SONNET`

  Set to `1` to disable prompt caching for Sonnet models

  设置为 `1` 可禁用 Sonnet 型号的提示缓存

- `DISABLE_TELEMETRY`

  Set to `1` to opt out of Statsig telemetry (note that Statsig events do not include user data like code, file paths, or bash commands)

  设置为 `1` 可选择退出 Statsig 遥测(请注意, Statsig 事件不包含用户数据, 例如代码、文件路径或 bash 命令)

- `ENABLE_CLAUDEAI_MCP_SERVERS`

  Set to `false` to disable [claude.ai MCP servers](https://code.claude.com/docs/en/mcp#use-mcp-servers-from-claudeai) in Claude Code. Enabled by default for logged-in users

  设置为 `false` 可在 Claude Code 中禁用 claude.ai MCP 服务器. 默认情况下, 已登录用户启用此功能.

- `ENABLE_TOOL_SEARCH`

  Controls [MCP tool search](https://code.claude.com/docs/en/mcp#scale-with-mcp-tool-search). Unset: enabled by default, but disabled when `ANTHROPIC_BASE_URL` points to a non-first-party host. Values: `true` (always on including proxies), `auto` (enables at 10% context), `auto:N` (custom threshold, e.g., `auto:5` for 5%), `false` (disabled)

  控制 MCP 工具搜索. 未设置: 默认启用, 但当 `ANTHROPIC_BASE_URL` 指向非第一方主机时禁用. 值: `true` (始终启用, 包括代理)、`auto` (上下文 10% 时启用)、`auto:N` (自定义阈值, 例如, `auto:5` 表示 5%)、`false` (禁用).

- `FORCE_AUTOUPDATE_PLUGINS`

  Set to `true` to force plugin auto-updates even when the main auto-updater is disabled via `DISABLE_AUTOUPDATER`

  设置为 `true` 可强制插件自动更新, 即使主自动更新程序已通过 `DISABLE_AUTOUPDATER` 禁用.

- `HTTP_PROXY`
  Specify HTTP proxy server for network connections
  为网络连接指定 HTTP 代理服务器

- `HTTPS_PROXY`

  Specify HTTPS proxy server for network connections

  为网络连接指定 HTTPS 代理服务器

- `IS_DEMO`

  Set to `true` to enable demo mode: hides email and organization from the UI, skips onboarding, and hides internal commands. Useful for streaming or recording sessions

  设置为 `true` 可启用演示模式: 隐藏用户界面中的电子邮件和组织信息, 跳过新手引导, 并隐藏内部命令. 适用于直播或录制会话.

- `MAX_MCP_OUTPUT_TOKENS`

  Maximum number of tokens allowed in MCP tool responses. Claude Code displays a warning when output exceeds 10,000 tokens (default: 25000)

  MCP 工具响应中允许的最大 tokens 数. 当输出超过 10,000 个 tokens 时, Claude Code 会显示警告(默认值: 25000).

- `MAX_THINKING_TOKENS`

  Override the [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking) token budget. The ceiling is the model's [max output tokens](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison) minus one. Set to `0` to disable thinking entirely. On models with adaptive reasoning (Opus 4.6, Sonnet 4.6), the budget is ignored unless adaptive reasoning is disabled via `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING`

  覆盖扩展思维 tokens 预算. 上限为模型最大输出 tokens 数减一. 设置为 `0` 可完全禁用思维功能. 对于具有自适应推理功能的模型(Opus 4.6、Sonnet 4.6), 除非通过 `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING` 禁用自适应推理, 否则此预算将被忽略.

- `MCP_CLIENT_SECRET`

  OAuth client secret for MCP servers that require [pre-configured credentials](https://code.claude.com/docs/en/mcp#use-pre-configured-oauth-credentials). Avoids the interactive prompt when adding a server with `--client-secret`

  用于需要预配置凭据的 MCP 服务器的 OAuth 客户端密钥. 使用 `--client-secret` 添加服务器时, 可避免出现交互式提示.

- `MCP_OAUTH_CALLBACK_PORT`

  Fixed port for the OAuth redirect callback, as an alternative to `--callback-port` when adding an MCP server with [pre-configured credentials](https://code.claude.com/docs/en/mcp#use-pre-configured-oauth-credentials)

  为 OAuth 重定向回调固定了端口, 作为在添加带有预配置凭据的 MCP 服务器时 `--callback-port` 的替代方案.

- `MCP_TIMEOUT`

  Timeout in milliseconds for MCP server startup

  MCP 服务器启动超时时间(毫秒)

- `MCP_TOOL_TIMEOUT`

  Timeout in milliseconds for MCP tool execution

  MCP 工具执行超时时间(毫秒)

- `NO_PROXY`

  List of domains and IPs to which requests will be directly issued, bypassing proxy

  请求将直接发送到的域名和 IP 地址列表, 无需通过代理.

- `SLASH_COMMAND_TOOL_CHAR_BUDGET`

  Override the character budget for skill metadata shown to the [Skill tool](https://code.claude.com/docs/en/skills#control-who-invokes-a-skill). The budget scales dynamically at 2% of the context window, with a fallback of 16,000 characters. Legacy name kept for backwards compatibility

  覆盖技能工具中显示的技能元数据的字符预算. 预算会根据上下文窗口的 2% 动态调整, 并设有 16,000 个字符的备用值. 保留旧名称以保持向后兼容性.

- `USE_BUILTIN_RIPGREP`

  Set to `0` to use system-installed `rg` instead of `rg` included with Claude Code

  设置为 `0` 以使用系统安装的 `rg` 而不是 Claude Code 自带的 `rg`

- `VERTEX_REGION_CLAUDE_3_5_HAIKU`

  Override region for Claude 3.5 Haiku when using Vertex AI

  使用顶点 AI 时, 覆盖 Claude 3.5 Haiku 的区域

- `VERTEX_REGION_CLAUDE_3_7_SONNET`

  Override region for Claude 3.7 Sonnet when using Vertex AI

  使用顶点人工智能时, 覆盖 Claude 3.7 Sonnet 的区域

- `VERTEX_REGION_CLAUDE_4_0_OPUS`

  Override region for Claude 4.0 Opus when using Vertex AI

  使用顶点 AI 时, 覆盖 Claude 4.0 Opus 的区域

- `VERTEX_REGION_CLAUDE_4_0_SONNET`

  Override region for Claude 4.0 Sonnet when using Vertex AI

  使用顶点人工智能时, 覆盖 Claude 4.0 Sonnet 的区域

- `VERTEX_REGION_CLAUDE_4_1_OPUS`

  Override region for Claude 4.1 Opus when using Vertex AI

  使用顶点 AI 时, 覆盖 Claude 4.1 Opus 的区域
