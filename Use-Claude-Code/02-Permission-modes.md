# Choose a permission mode
选择权限模式

* https://code.claude.com/docs/en/permission-modes

Switch between supervised editing, read-only planning, and auto mode where a background classifier replaces manual permission prompts. Cycle modes with `Shift+Tab` in the CLI or use the mode selector in VS Code, Desktop, and claude.ai.
在监督编辑、只读规划和自动模式之间切换, 自动模式下后台分类器会取代手动权限提示. 在命令行界面 (CLI) 中使用 Shift+Tab 切换模式, 或在 VS Code、桌面版和 claude.ai 中使用模式选择器.

Permission modes control whether Claude asks before acting. Different tasks call for different levels of autonomy: you might want full oversight for sensitive work, minimal interruptions for a long refactor, or read-only access while exploring a codebase.
权限模式控制着 Claude 在执行操作前是否需要询问. 不同的任务需要不同的自主级别: 对于敏感工作, 您可能需要完全的监督; 对于长时间的重构, 您可能需要尽可能减少干扰; 而对于浏览代码库, 您可能需要只读访问权限.

This page covers how to:
本页面涵盖以下操作方法:

- [Switch modes](https://code.claude.com/docs/en/permission-modes#switch-permission-modes) during a session, at startup, or as a default
  在会话期间、启动时或作为默认设置切换模式

- [Choose a mode](https://code.claude.com/docs/en/permission-modes#available-modes) based on what Claude should be able to do without asking
  根据 Claude 无需询问就能做到的事情来选择模式.

- [Run auto mode](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode) with background safety checks, and see what it [blocks by default](https://code.claude.com/docs/en/permission-modes#what-the-classifier-blocks-by-default)
  运行自动模式并启用后台安全检查, 看看它默认会阻止哪些内容.

- [Plan changes read-only](https://code.claude.com/docs/en/permission-modes#analyze-before-you-edit-with-plan-mode) before approving edits
  在批准编辑之前, 计划变更应设置为只读.

- [Restrict Claude to pre-approved tools](https://code.claude.com/docs/en/permission-modes#allow-only-pre-approved-tools-with-dontask-mode) for locked-down environments
  限制 Claude 在封闭环境下只能使用预先批准的工具.

- [Skip checks entirely](https://code.claude.com/docs/en/permission-modes#skip-all-checks-with-bypasspermissions-mode) in isolated environments
  在隔离环境中完全跳过检查

## Switch permission modes
切换权限模式

You can switch modes at any time during a session, at startup, or as a persistent default. The mechanism depends on where you're running Claude Code.
您可以在会话期间的任何时间、启动时或将其设置为永久默认模式来切换模式. 具体机制取决于您运行 Claude Code 的位置.

- CLI  命令行界面

**During a session**: press `Shift+Tab` to cycle through `default` → `acceptEdits` → `plan` → `auto`. The current mode appears in the status bar. `auto` does not appear in the cycle until you pass `--enable-auto-mode` at startup. Auto also requires a Team, Enterprise, or API plan and Claude Sonnet 4.6 or Opus 4.6, so the option may remain unavailable even with the flag. If `bypassPermissions` is also enabled, it appears in the cycle between `plan` and `auto`.
会话期间: 按 `Shift+Tab` 可在 `default` → `acceptEdits` → `plan` → `auto` 之间循环切换. 当前模式会显示在状态栏中. 只有在启动时传递 `--enable-auto-mode` 参数后, `auto` 才会出现在循环列表中. 自动模式还需要团队版、企业版或 API 计划, 以及 Claude Sonnet 4.6 或 Opus 4.6 版本, 因此即使添加了该参数, 该选项也可能仍然不可用. 如果同时启用了 `bypassPermissions`, 它会出现在 `plan` 和 `auto` 之间的循环列表中.

**At startup**: pass the mode as a CLI flag:
启动时: 将模式作为 CLI 标志传递:

```bash
claude --permission-mode plan
```

**As a default**: set `defaultMode` in your [settings file](https://code.claude.com/docs/en/settings#settings-files):
默认情况下: 在设置文件中设置 `defaultMode`:

```json
{
    "permissions": {
        "defaultMode": "acceptEdits"
    }
}
```

**Non-interactively**: the same flag works with `-p` for scripted runs:
非交互式: 同样的标志也适用于 `-p`, 用于脚本运行:

```bash
claude -p "refactor auth" --permission-mode acceptEdits
```

`dontAsk` is never in the `Shift+Tab` cycle. `bypassPermissions` appears in the cycle only if you started the session with `--permission-mode bypassPermissions`, `--dangerously-skip-permissions`, or `--allow-dangerously-skip-permissions`. The third flag adds the mode to the cycle without activating it, so you can compose it with a different starting mode like `--permission-mode plan`. Set any of these at startup or in your settings file.
dontAsk 永远不会出现在 Shift+Tab 循环中. passwayPermissions 仅在您使用 --permission-mode bypassPermissions、--dangerously-skip-permissions 或 --allow-dangerously-skip-permissions 启动会话 `bypassPermissions` 才会出现在循环中. 第三个标志会将该模式添加到循环中, 但不会激活它, 因此您可以将其与其他启动模式(例如 `--permission-mode plan`)组合使用. 您可以在启动时或在配置文件中设置这些选项.

Permission modes are set through the UI, CLI flags, or settings files. Telling Claude "stop asking for permission" in the chat does not change the mode. See [Permissions](https://code.claude.com/docs/en/permissions) for how modes interact with allow, ask, and deny rules.
权限模式可通过用户界面、命令行标志或配置文件进行设置. 在聊天中告诉 Claude "停止请求权限"并不会更改权限模式. 有关权限模式如何与允许、请求和拒绝规则交互, 请参阅"权限"部分.

- JetBrains

- VS Code

- Desktop

- Web and mobile

## Available modes

Each mode makes a different tradeoff between convenience and oversight. Pick the one that matches your task.
每种模式在便利性和监管性之间各有侧重. 请选择最适合您任务的模式.

| Mode                                                                                                                | What Claude can do without asking <br> Claude 不用问就能做到的事                                   | Best for <br> 最适合                                                            |
| ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `default`                                                                                                           | Read files                                                                                         | Getting started, sensitive work <br> 开始, 敏感工作                             |
| `acceptEdits`                                                                                                       | Read and edit files except in protected directories <br> 读取和编辑文件, 但受保护目录中的文件除外. | Iterating on code you're reviewing <br> 迭代你正在审查的代码                    |
| [`plan`](https://code.claude.com/docs/en/permission-modes#analyze-before-you-edit-with-plan-mode)                   | Read files                                                                                         | Exploring a codebase, planning a refactor <br> 探索代码库, 规划重构             |
| [`auto`](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode)                         | All actions, with background safety checks <br> 所有行动均经过背景安全检查                         | Long-running tasks, reducing prompt fatigue <br> 长时间运行的任务, 减少即时疲劳 |
| [`bypassPermissions`](https://code.claude.com/docs/en/permission-modes#skip-all-checks-with-bypasspermissions-mode) | All actions except writes to protected directories <br> 除写入受保护目录之外的所有操作             | Isolated containers and VMs only <br> 仅限隔离容器和虚拟机                      |
| [`dontAsk`](https://code.claude.com/docs/en/permission-modes#allow-only-pre-approved-tools-with-dontask-mode)       | Only pre-approved tools <br> 仅限预先批准的工具                                                    | Locked-down environments <br> 封闭环境                                          |

Regardless of mode, writes to `.git`, `.vscode`, `.idea`, `.husky`, and `.claude` are never auto-approved, except for `.claude/commands`, `.claude/agents`, and `.claude/skills` where Claude routinely creates skills, subagents, and commands. This protects repository state, editor configuration, git hooks, and Claude's own settings from accidental corruption.
无论在何种模式下, 写入 `.git`、`.vscode`、`.idea`、`.husky` 和 `.claude` 的操作都不会自动批准, 但 `.claude/commands`、`.claude/agents` 和 `.claude/skills` 目录除外, Claude 会定期在这些目录中创建技能、子代理和命令. 这可以保护代码库状态、编辑器配置、Git 钩子以及 Claude 自身的设置免受意外损坏.

## Analyze before you edit with plan mode
使用计划模式先进行分析再进行编辑

Plan mode tells Claude to research and propose changes without making them. Claude reads files, runs shell commands to explore, asks clarifying questions, and writes a plan file, but does not edit your source code. Permission prompts work the same as default mode: you still approve Bash commands, network requests, and other actions that would normally prompt.
计划模式指示 Claude 进行研究并提出修改建议, 但不会实际执行任何修改. Claude 会读取文件、运行 shell 命令进行探索、提出澄清问题并生成计划文件, 但不会编辑您的源代码. 权限提示与默认模式相同: 您仍然需要批准 Bash 命令、网络请求以及其他通常会弹出提示的操作.

### When to use plan mode
何时使用计划模式

Plan mode is useful when you want Claude to research and propose an approach before making changes:
当您希望 Claude 在进行更改之前进行研究并提出解决方案时, 计划模式非常有用:

- **Multi-step implementation**: when a feature requires edits across many files
  多步骤实现: 当一个功能需要对多个文件进行编辑时

- **Code exploration**: when you want to research the codebase before changing anything
  代码探索: 在更改任何内容之前, 想要研究代码库.

- **Interactive development**: when you want to iterate on the direction with Claude
  交互式开发: 当你想要和 Claude 一起迭代开发方向时

### Start and use plan mode
启动并使用计划模式

Enter plan mode for a single request by prefixing your prompt with `/plan`, or switch the whole session into plan mode by pressing `Shift+Tab` to [cycle through permission modes](https://code.claude.com/docs/en/permission-modes#switch-permission-modes). You can also start in plan mode from the CLI:
要为单个请求进入计划模式, 请在提示符前加上 `/plan` 或者, 按 `Shift+Tab` 键可在不同的权限模式之间切换, 从而将整个会话切换到计划模式. 您也可以从命令行界面 (CLI) 启动计划模式:

```bash
claude --permission-mode plan
```

This example starts a planning session for a complex refactor:
这个例子开启了一次复杂重构的规划会议:

```
I need to refactor our authentication system to use OAuth2. Create a detailed migration plan.
```

Claude analyzes the current implementation and creates a plan. Refine with follow-ups:
Claude 分析了当前的实施方案并制定了计划. 后续跟进完善了计划:

```
What about backward compatibility?
向后兼容性如何处理?

How should we handle database migration?
我们应该如何处理数据库迁移?
```

When the plan is ready, Claude presents it and asks how to proceed. From that prompt you can:
计划制定完成后, Claude 会提出计划并询问下一步该怎么做. 根据他的提示, 您可以:

- Approve and start in auto mode
  批准并以自动模式启动

- Approve and accept edits
  批准并接受修改

- Approve and manually review each edit
  批准并手动审核每一项修改

- Keep planning, which sends your feedback back to Claude for another round
  继续制定计划, 这样你的反馈就会发送给 Claude, 让他进行下一轮讨论.

Each approve option also offers to clear the planning context first.
每个批准选项都提供了先明确规划背景的功能.

## Eliminate prompts with auto mode
使用自动模式消除提示

Auto mode is available on Team, Enterprise, and API plans. On Team and Enterprise, an admin must enable it in [Claude Code admin settings](https://claude.ai/admin-settings/claude-code) before users can turn it on. It requires Claude Sonnet 4.6 or Claude Opus 4.6, and is not available on Haiku, claude-3 models, or third-party providers (Bedrock, Vertex, Foundry).
自动模式适用于团队版、企业版和 API 版套餐. 在团队版和企业版套餐中, 管理员必须先在 Claude Code 管理设置中启用该功能, 用户才能开启. 该功能需要 Claude Sonnet 4.6 或 Claude Opus 4.6 版本, Haiku、claude-3 型号以及第三方提供商(Bedrock、Vertex、Foundry)不支持此功能.

Auto mode lets Claude execute actions without showing permission prompts. Before each action runs, a separate classifier model reviews the conversation and decides whether the action matches what you asked for. It blocks actions that escalate beyond the task scope, target infrastructure the classifier doesn't recognize as trusted, or appear to be driven by prompt injection: hostile instructions embedded in a file, web page, or tool result that attempt to redirect Claude toward actions you never asked for. The defense is layered: a server-side probe scans incoming tool results and flags suspicious content before Claude reads it, while the classifier itself is never shown tool results, so injected instructions cannot influence its approval decisions. For a deeper look at how these layers work together, see the [auto mode announcement](https://claude.com/blog/auto-mode) and the [engineering deep dive](https://www.anthropic.com/engineering/claude-code-auto-mode).
自动模式允许 Claude 在不显示权限提示的情况下执行操作. 每次操作运行前, 一个独立的分类器模型会审查对话, 并判断该操作是否符合您的请求. 它会阻止超出任务范围的操作、针对分类器未识别为可信基础设施的操作, 或看似由提示注入驱动的操作: 提示注入是指嵌入在文件、网页或工具结果中的恶意指令, 试图将 Claude 重定向到您从未请求过的操作. 该防御机制采用多层防御: 服务器端探测器会扫描传入的工具结果, 并在 Claude 读取之前标记可疑内容; 而分类器本身永远不会看到工具结果, 因此注入的指令无法影响其批准决定. 要深入了解这些层如何协同工作, 请参阅自动模式公告和工程深度解析.

> Auto mode is a research preview. It reduces prompts but does not guarantee safety. It provides more protection than `bypassPermissions` but is not as thorough as manually reviewing each action. Use it for tasks where you trust the general direction, not as a replacement for review on sensitive operations.
> 自动模式是一种研究预览功能. 它减少了提示, 但不能保证安全. 它比 `bypassPermissions` 提供更多保护, 但不如手动审查每个操作彻底. 请将其用于您信任其大致方向的任务, 而不是用来替代对敏感操作的审查.
>

**Model**: the classifier runs on Claude Sonnet 4.6, even if your main session uses a different model.
模型: 分类器在 Claude Sonnet 4.6 上运行, 即使您的主会话使用不同的模型.

**Cost**: classifier calls count toward your token usage the same as main-session calls. Each checked action sends a portion of the conversation transcript plus the pending action to the classifier. The extra cost comes mainly from shell commands and network operations, since read-only actions and file edits in your working directory outside protected directories don't trigger a classifier call.
成本: 分类器调用与主会话调用一样, 都会占用您的 token 使用量. 每次检查操作都会将部分会话记录以及待处理的操作发送给分类器. 额外的成本主要来自 shell 命令和网络操作, 因为在受保护目录之外的工作目录中执行只读操作和文件编辑不会触发分类器调用.

**Latency**: each classifier check adds a round-trip before the action executes.
延迟: 每次分类器检查都会增加一次往返, 然后再执行操作.

### How actions are evaluated
如何评估行动

Each action goes through a fixed decision order. The first matching step wins:
每个动作都要经过固定的决策顺序. 第一个匹配的步骤获胜:

1. Actions matching your [allow or deny rules](https://code.claude.com/docs/en/permissions#manage-permissions) resolve immediately
   符合您允许或拒绝规则的操作会立即生效

2. Read-only actions and file edits in your working directory are auto-approved, except writes to protected directories
   工作目录中的只读操作和文件编辑将自动获得批准, 但写入受保护目录的操作除外.

3. Everything else goes to the classifier
   其他所有内容都交给分类器.

4. If the classifier blocks, Claude receives the reason and attempts an alternative approach
   如果分类器阻塞, Claude 会收到阻塞原因并尝试其他方法.

On entering auto mode, Claude Code drops any allow rule that is known to grant arbitrary code execution: blanket shell access like `Bash(*)`, wildcarded script interpreters like `Bash(python*)` or `Bash(node*)`, package-manager run commands, and any `Agent` allow rule. These rules would auto-approve the commands and subagent delegations most capable of causing damage before the classifier ever sees them. Narrow rules like `Bash(npm test)` carry over. The dropped rules are restored when you leave auto mode.
进入自动模式后, Claude Code 会丢弃所有已知会授予任意代码执行权限的允许规则: 例如 `Bash(*)` 之类的通用 shell 访问权限、`Bash(python*)` 或 `Bash(node*)` 之类的通配符脚本解释器、包管理器运行命令以及任何 `Agent` 允许规则. 这些规则会在分类器识别到这些命令和子代理委托之前, 自动批准它们, 从而造成最大危害. 而像 `Bash(npm test)` 这样的窄规则则会保留. 退出自动模式后, 被丢弃的规则将被恢复.

The classifier receives user messages and tool calls as input, with Claude's own text and tool results stripped out. It also receives your CLAUDE.md content, so actions described in your project instructions are factored into allow and block decisions. Because tool results never reach the classifier, hostile content in a file or web page cannot manipulate it directly. The classifier evaluates the pending action against a customizable set of block and allow rules, checking whether the action is an overeager escalation beyond what you asked for, a mistake about what's safe to touch, or a sudden departure from your stated intent that suggests Claude may have been steered by something it read.
分类器接收用户消息和工具调用作为输入, 其中会移除 Claude 自身的文本和工具结果. 它还会接收您的 CLAUDE.md 文件内容, 因此项目指令中描述的操作会被纳入允许或阻止的决策考量. 由于工具结果不会到达分类器, 因此文件或网页中的恶意内容无法直接操控它. 分类器会根据一组可自定义的允许和阻止规则来评估待处理的操作, 检查该操作是否过于积极地超出您的请求范围、是否错误地判断了哪些内容可以安全操作, 或者是否突然偏离了您声明的意图, 从而表明 Claude 可能受到了某些读取内容的引导.

Unlike your permission rules, which match tool names and argument patterns, the classifier reads prose descriptions of what to block and allow: it reasons about the action in context rather than matching syntax.
与匹配工具名称和参数模式的权限规则不同, 分类器读取要阻止和允许的内容的散文描述: 它在上下文中对操作进行推理, 而不是匹配语法.

### How auto mode handles subagents
自动模式如何处理子代理

When Claude spawns a [subagent](https://code.claude.com/docs/en/sub-agents), the classifier evaluates the delegated task before the subagent starts. A task description that looks dangerous on its own, like "delete all remote branches matching this pattern", is blocked at spawn time.
当 Claude 生成子代理时, 分类器会在子代理启动前评估委托的任务. 像"删除所有与此模式匹配的远程分支"这样看似危险的任务描述会在生成时被阻止.

Inside the subagent, auto mode runs with the same block and allow rules as the parent session. Any `permissionMode` the subagent defines in its own frontmatter is ignored. The subagent's own tool calls go through the classifier independently.
在子代理内部, 自动模式运行与父会话相同的代码块和允许规则. 子代理在其自身 frontmatter 中定义的任何 `permissionMode` 都会被忽略. 子代理自身的工具调用会独立地经过分类器.

When the subagent finishes, the classifier reviews its full action history. A subagent that was benign at spawn could have been compromised mid-run by content it read. If the return check flags a concern, a security warning is prepended to the subagent's results so the main agent can decide how to proceed.
当子代理完成操作后, 分类器会审查其完整的操作历史记录. 一个初始状态良好的子代理, 可能在运行过程中因其读取的内容而受到攻击. 如果返回检查发现问题, 则会在子代理的结果前添加安全警告, 以便主代理决定如何继续执行.

### What the classifier blocks by default
分类器默认会阻止哪些内容?

Out of the box, the classifier trusts your working directory and, if you're in a git repo, that repo's configured remotes. Everything else is treated as external: your company's source control orgs, cloud buckets, and internal services are unknown until you tell the classifier about them.
默认情况下, 分类器信任您的工作目录, 如果您正在使用 Git 仓库, 则信任该仓库配置的远程仓库. 其他所有内容都被视为外部资源: 您公司的源代码控制组织、云存储桶和内部服务在您告知分类器之前都是未知的.

**Blocked by default**:
默认阻止:

- Downloading and executing code, like `curl | bash` or scripts from cloned repos
  从克隆的仓库下载并执行代码, 例如 `curl | bash` 或脚本

- Sending sensitive data to external endpoints
  将敏感数据发送到外部端点

- Production deploys and migrations
  生产环境部署和迁移

- Mass deletion on cloud storage
  云存储中的批量删除

- Granting IAM or repo permissions
  授予 IAM 或存储库权限

- Modifying shared infrastructure
  修改共享基础设施

- Irreversibly destroying files that existed before the session started
  不可逆地销毁会话开始前已存在的文件

- Destructive source control operations like force push or pushing directly to `main`
  破坏性源控制操作, 例如强行推入或直接推入 `main`

**Allowed by default**:
默认允许:

- Local file operations in your working directory
  工作目录中的本地文件操作

- Installing dependencies already declared in your lock files or manifests
  安装已在锁定文件或清单中声明的​​依赖项.

- Reading `.env` and sending credentials to their matching API
  读取 `.env` 文件并将凭据发送到与其匹配的 API

- Read-only HTTP requests
  只读 HTTP 请求

- Pushing to the branch you started on or one Claude created
  推送到你开始创建的分支, 或者推送到 Claude 创建的分支.

To see the full default rule lists as the classifier receives them, run `claude auto-mode defaults`.
要查看分类器接收到的完整默认规则列表, 请运行 `claude auto-mode defaults`.

If auto mode blocks something routine for your team, like pushing to your own org's repo or writing to a company bucket, it's because the classifier doesn't know those are trusted. Administrators can add trusted repos, buckets, and internal services via the `autoMode.environment` setting: see [Configure the auto mode classifier](https://code.claude.com/docs/en/permissions#configure-the-auto-mode-classifier) for the full configuration guide.
如果自动模式阻止了团队的某些常规操作, 例如向组织内部代码库推送代码或向公司存储桶写入数据, 那是因为分类器无法识别这些受信任的资源. 管理员可以通过 `autoMode.environment` 设置添加受信任的代码库、存储桶和内部服务: 有关完整的配置指南, 请参阅 "配置自动模式分类器".

### When auto mode falls back
当自动模式回退时

The fallback design keeps false positives from derailing a session: a mistaken block costs Claude a retry, not your progress. If the classifier blocks an action 3 times in a row or 20 times total in one session, auto mode pauses and Claude Code resumes prompting for each action. These thresholds are not configurable.
备用机制可防止误报中断会话: 误拦截只会导致 Claude 重试一次, 不会影响您的进度. 如果分类器连续拦截某个操作 3 次, 或在同一会话中累计拦截 20 次, 则自动模式暂停, Claude Code 恢复提示, 提示您执行每个操作. 这些阈值不可配置.

- **CLI**: you see a notification in the status area, and the denied action appears in `/permissions` under the Recently denied tab. Approving the prompted action resets the denial counters, so you can continue in auto mode
  CLI: 您会在状态区域看到通知, 被拒绝的操作会显示在 `/permissions` 目录下的"最近拒绝"选项卡中. 批准提示的操作会重置拒绝计数器, 以便您可以继续使用自动模式.

- **Non-interactive mode** with the `-p` flag: aborts the session, since there is no user to prompt
  使用 `-p` 标志的非交互模式: 中止会话, 因为没有用户可供提示.

Repeated blocks usually mean one of two things: the task genuinely requires actions the classifier is built to stop, or the classifier is missing context about your trusted infrastructure and treating safe actions as risky. If the blocks look like false positives, or if the classifier misses something it should have caught, use `/feedback` to report it. If blocks are happening because the classifier doesn't recognize your repos or services as trusted, have an administrator [configure trusted infrastructure](https://code.claude.com/docs/en/permissions#configure-the-auto-mode-classifier) in managed settings.
重复的阻止通常意味着以下两种情况之一: 任务确实需要分类器旨在阻止的操作, 或者分类器缺少关于您受信任基础架构的上下文信息, 从而将安全操作误判为风险操作. 如果阻止看起来像是误报, 或者分类器漏掉了它应该捕获的内容, 请使用 `/feedback` 进行报告. 如果阻止是由于分类器无法识别您的存储库或服务为受信任的, 请管理员在托管设置中配置受信任的基础架构.

## Allow only pre-approved tools with dontAsk mode
仅允许使用预先批准的工具, 并启用"无需询问"模式

`dontAsk` mode auto-denies every tool that is not explicitly allowed. Only actions matching your `/permissions` allow rules or `permissions.allow` settings can execute. If a tool has an explicit `ask` rule, the action is also denied rather than prompting. This makes the mode fully non-interactive, suitable for CI pipelines or restricted environments where you pre-define exactly what Claude is permitted to do.
`dontAsk` 模式会自动拒绝所有未明确允许的工具. 只有符合您 `/permissions` 允许规则或 `permissions.allow` 设置的操作才能执行. 如果某个工具有明确的 `ask` 规则, 则该操作也会被拒绝, 而不会弹出提示. 这使得该模式完全非交互式, 适用于 CI 流水线或受限环境, 在这些环境中, 您可以预先定义 Claude 可以执行的具体操作.

```
claude --permission-mode dontAsk
```

## Skip all checks with bypassPermissions mode
使用 bypassPermissions 模式跳过所有检查

`bypassPermissions` mode disables permission prompts and safety checks. Tool calls execute immediately, except for writes to `.git`, `.vscode`, `.idea`, and `.husky`, which still prompt to prevent accidental corruption of repository state, editor configuration, and git hooks. Writes to `.claude` also prompt, except for `.claude/commands`, `.claude/agents`, and `.claude/skills` where Claude routinely creates skills, subagents, and commands. Only use this mode in isolated environments like containers, VMs, or devcontainers without internet access, where Claude Code cannot cause damage to your host system.
`bypassPermissions` 模式会禁用权限提示和安全检查. 工具调用会立即执行, 但写入 `.git`、`.vscode`、`.idea` 和 `.husky` 目录的操作仍会提示权限, 以防止意外损坏仓库状态、编辑器配置和 Git 钩子. 写入 `.claude` 目录的操作也会提示权限, 但 `.claude/commands`、`.claude/agents` 和 `.claude/skills` 目录除外, 因为 Claude 会定期在这些目录中创建技能、子代理和命令. 仅在隔离环境(例如容器、虚拟机或无法访问互联网的开发容器)中使用此模式, 以确保 Claude Code 不会对主机系统造成损害.

```bash
claude --permission-mode bypassPermissions
```

The `--dangerously-skip-permissions` flag is equivalent to `--permission-mode bypassPermissions`:
`--dangerously-skip-permissions` 标志等价于 `--permission-mode bypassPermissions`:

```bash
claude -p "refactor the auth module" --dangerously-skip-permissions
```

> `bypassPermissions` mode offers no protection against prompt injection or unintended actions. For a safer alternative that still maintains background safety checks, use [auto mode](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode). Administrators can block this mode by setting `permissions.disableBypassPermissionsMode` to `"disable"` in [managed settings](https://code.claude.com/docs/en/permissions#managed-settings).
> `bypassPermissions` 模式无法防止提示注入或意外操作. 如需更安全且仍能进行后台安全检查的替代方案, 请使用自动模式. 管理员可以通过在托管设置中将 `permissions.disableBypassPermissionsMode` 设置为 `"disable"` 来禁用此模式.

## Compare permission approaches
比较许可方式

The table below summarizes the key differences in how each mode handles approvals. `plan` is omitted since it restricts what Claude can do rather than how approvals work.
下表总结了每种模式处理审批方式的主要区别. 由于 `plan` 限制的是 Claude 的操作权限, 而非审批流程, 因此表中省略了"计划"部分.

|                    | `default`                                    | `acceptEdits`                                                                                 | `auto`                                                                                           | `dontAsk`                                                            | `bypassPermissions`                                                    |
| ------------------ | -------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Permission prompts | File edits and commands                      | Commands and protected directories <br> 命令和受保护目录                                      | None unless fallback triggers <br> 除非触发备用方案, 否则不会发生这种情况.                       | None, blocked unless pre-allowed <br> 无, 除非预先允许, 否则将被阻止 | Protected directories only <br> 仅限受保护目录                         |
| Safety checks      | You review each action <br> 你回顾每一项行动 | You review commands and protected-directory writes <br> 您需要审查命令和受保护目录的写入操作. | Classifier reviews commands and protected-directory writes <br> 分类器审查命令和受保护目录的写入 | Your pre-approved rules only <br> 仅限您预先批准的规则               | You review protected-directory writes <br> 您审核受保护目录的写入操作. |
| Token usage        | Standard                                     | Standard                                                                                      | Higher, from classifier calls <br> 来自分类器调用的更高                                          | Standard                                                             | Standard                                                               |

## Customize permissions further
进一步自定义权限

Permission modes set the baseline approval behavior. For control over individual tools or commands, layer additional configuration on top of the active mode.
权限模式设定了基本的审批行为. 要控制单个工具或命令, 可以在当前模式之上叠加额外的配置.

**Permission rules** are the first stop. Add `allow`, `ask`, or `deny` entries to your settings file to pre-approve safe commands, force a prompt for risky ones, or block specific tools entirely. Rules apply in every mode except `bypassPermissions`, and are matched by tool name and argument pattern. See [Manage permissions](https://code.claude.com/docs/en/permissions#manage-permissions) for syntax and examples.
权限规则是第一步. 在设置文件中添加 `allow`、`ask` 或 `deny` 条目, 即可预先批准安全命令、强制提示执行风险命令, 或完全阻止特定工具. 除 `bypassPermissions` 外, 所有模式均适用这些规则, 规则匹配依据工具名称和参数模式. 有关语法和示例, 请参阅"管理权限".

**Hooks** cover logic that pattern-matching rules can't express. A [`PreToolUse` hook](https://code.claude.com/docs/en/hooks#pretooluse-decision-control) runs before every tool call and can allow, deny, or escalate based on command content, file paths, time of day, or a response from an external policy service. A [`PermissionRequest` hook](https://code.claude.com/docs/en/hooks#permissionrequest) intercepts the permission dialog itself and answers on your behalf. See [Hooks](https://code.claude.com/docs/en/hooks) for configuration.
钩子函数涵盖了模式匹配规则无法表达的逻辑. `PreToolUse` 函数会在每次工具调用之前运行, 并可根据命令内容、文件路径、时间或外部策略服务的响应来允许、拒绝或升级权限. `PermissionRequest` 函数会拦截权限对话框并代表您做出响应. 有关配置, 请参阅 "钩子函数"部分.
