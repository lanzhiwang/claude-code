# Best Practices for Claude Code

* https://code.claude.com/docs/en/best-practices

Tips and patterns for getting the most out of Claude Code, from configuring your environment to scaling across parallel sessions.
从配置环境到跨并行会话扩展, 如何充分利用 Claude Code 的技巧和模式.

Claude Code is an agentic coding environment. Unlike a chatbot that answers questions and waits, Claude Code can read your files, run commands, make changes, and autonomously work through problems while you watch, redirect, or step away entirely.
Claude Code 是一个智能体编码环境. 与只会回答问题并等待的聊天机器人不同, Claude Code 可以读取你的文件、运行命令、进行修改, 并在你观看、引导或完全离开的情况下自主解决问题.

This changes how you work. Instead of writing code yourself and asking Claude to review it, you describe what you want and Claude figures out how to build it. Claude explores, plans, and implements.
这改变了你的工作方式. 你不再需要自己编写代码然后请 Claude 审查, 而是描述你的需求, 然后由 Claude 来决定如何实现. Claude 负责探索、规划和实施.

But this autonomy still comes with a learning curve. Claude works within certain constraints you need to understand.
但这种自主性仍然需要一个学习过程. Claude 的工作受到一些限制, 你需要了解这些限制.

This guide covers patterns that have proven effective across Anthropic's internal teams and for engineers using Claude Code across various codebases, languages, and environments. For how the agentic loop works under the hood, see [How Claude Code works](https://code.claude.com/docs/en/how-claude-code-works).
本指南涵盖了在 Anthropic 内部团队以及使用 Claude Code 的工程师在各种代码库、语言和环境中实践证明行之有效的模式. 有关代理循环的底层工作原理, 请参阅 "Claude Code 的工作原理".

---

Most best practices are based on one constraint: Claude's context window fills up fast, and performance degrades as it fills.
大多数最佳实践都基于一个限制: Claude 的上下文窗口很快就会填满, 并且随着窗口的填满, 性能会下降.

Claude's context window holds your entire conversation, including every message, every file Claude reads, and every command output. However, this can fill up fast. A single debugging session or codebase exploration might generate and consume tens of thousands of tokens.
Claude 的上下文窗口会显示你的所有对话, 包括每条消息、Claude 读取的每个文件以及每个命令输出. 但是, 这个窗口很快就会被填满. 一次调试会话或代码库探索就可能生成并消耗数万个 tokens.

This matters since LLM performance degrades as context fills. When the context window is getting full, Claude may start "forgetting" earlier instructions or making more mistakes. The context window is the most important resource to manage. To see how a session fills up in practice, [watch an interactive walkthrough](https://code.claude.com/docs/en/context-window) of what loads at startup and what each file read costs. Track context usage continuously with a [custom status line](https://code.claude.com/docs/en/statusline), and see [Reduce token usage](https://code.claude.com/docs/en/costs#reduce-token-usage) for strategies on reducing token usage.
这一点很重要, 因为随着上下文填充, LLM 的性能会下降. 当上下文窗口接近满格时, Claude 可能会开始"忘记"之前的指令或出现更多错误. 上下文窗口是需要管理的最重要资源. 要了解会话在实践中是如何被填满的, 请观看交互式演示, 了解启动时加载的内容以及每次文件读取的成本. 使用自定义状态行持续跟踪上下文使用情况, 并参阅 "减少 tokens 使用" 了解减少 tokens 使用的策略.

---

## Give Claude a way to verify its work
给 Claude 一种方法来验证它的工作.

Include tests, screenshots, or expected outputs so Claude can check itself. This is the single highest-leverage thing you can do.
请提供测试用例、屏幕截图或预期输出, 以便 Claude 可以进行自我检查. 这是你能做的最有价值的事情.

Claude performs dramatically better when it can verify its own work, like run tests, compare screenshots, and validate outputs.
当 Claude 能够验证自己的工作时, 例如运行测试、比较屏幕截图和验证输出, 它的表现会好得多.

Without clear success criteria, it might produce something that looks right but actually doesn't work. You become the only feedback loop, and every mistake requires your attention.
如果没有明确的成功标准, 最终可能会产生看起来正确但实际上行不通的结果. 你将成为唯一的反馈机制, 每一个错误都需要你关注.

| Strategy                                                                 | Before                                                                                    | After                                                                                                                                                                                                                                                                                                                      |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Provide verification criteria** <br> 提供验证标准                      | "implement a function that validates email addresses" <br> 实现一个验证电子邮件地址的功能 | "write a validateEmail function. example test cases: [user@example.com](mailto:user@example.com) is true, invalid is false, [user@.com](mailto:user@.com) is false. run the tests after implementing" <br> 编写一个 validateEmail 函数. 示例测试用例: user@example.com 为真, invalid 为假, user@.com 为假. 实现后运行测试. |
| Verify UI changes visually <br> 直观地验证用户界面变化                   | "make the dashboard look better" <br> "让仪表盘看起来更美观"                              | "[paste screenshot] implement this design. take a screenshot of the result and compare it to the original. list differences and fix them" <br> [粘贴截图] 实现此设计. 截取结果截图并与原图进行比较. 列出差异并进行修复.                                                                                                    |
| Address root causes, not symptoms <br> 找出根本原因, 而不是仅仅关注症状. | "the build is failing" <br> "构建失败"                                                    | "the build fails with this error: [paste error]. fix it and verify the build succeeds. address the root cause, don't suppress the error" <br> 构建失败, 出现以下错误: [粘贴错误信息]. 请修复此错误并验证构建是否成功. 请找出根本原因, 不要忽略错误.                                                                        |

UI changes can be verified using the [Claude in Chrome extension](https://code.claude.com/docs/en/chrome). It opens new tabs in your browser, tests the UI, and iterates until the code works.
可以使用 Chrome 扩展程序 Claude 来验证 UI 更改. 它会在浏览器中打开新标签页, 测试 UI, 并不断迭代直到代码正常工作.

Your verification can also be a test suite, a linter, or a Bash command that checks output. Invest in making your verification rock-solid.
你的验证方法可以是测试套件、代码检查工具或检查输出的 Bash 命令. 务必确保你的验证方法万无一失.

---

## Explore first, then plan, then code
先探索, 再计划, 最后编码

> Separate research and planning from implementation to avoid solving the wrong problem.
> 将研究和规划与实施分开, 以避免解决错误的问题.
>

Letting Claude jump straight to coding can produce code that solves the wrong problem. Use [Plan Mode](https://code.claude.com/docs/en/common-workflows#use-plan-mode-for-safe-code-analysis) to separate exploration from execution.
让 Claude 直接开始编写代码可能会导致代码解决错误的问题. 使用计划模式可以将探索过程与执行过程分开.

The recommended workflow has four phases:
推荐的工作流程分为四个阶段:

1. Explore
探索

Enter Plan Mode. Claude reads files and answers questions without making changes.
进入计划模式. Claude 会读取文件并回答问题, 但不会进行任何更改.

```claude (Plan Mode)
read /src/auth and understand how we handle sessions and login.
also look at how we manage environment variables for secrets.
```

2. Plan
计划

Ask Claude to create a detailed implementation plan.
请 Claude 制定一份详细的实施计划.

```claude (Plan Mode)
I want to add Google OAuth. What files need to change?
What's the session flow? Create a plan.
```

Press `Ctrl+G` to open the plan in your text editor for direct editing before Claude proceeds.
在 Claude 继续之前, 请按 `Ctrl+G` 在文本编辑器中打开计划进行直接编辑.

3. Implement
实施

Switch back to Normal Mode and let Claude code, verifying against its plan.
切换回正常模式, 让 Claude 编写代码, 并根据其计划进行验证.

```claude (Normal Mode)
implement the OAuth flow from your plan. write tests for the
callback handler, run the test suite and fix any failures.
```

4. Commit

Ask Claude to commit with a descriptive message and create a PR.
请 Claude 提交一份包含描述性信息的 PR.

```claude (Normal Mode)
commit with a descriptive message and open a PR
```

> Plan Mode is useful, but also adds overhead.
> 计划模式虽然有用, 但也会增加系统开销.
> For tasks where the scope is clear and the fix is small (like fixing a typo, adding a log line, or renaming a variable) ask Claude to do it directly.
> 对于范围明确且修复工作量较小的任务(例如修复拼写错误、添加日志行或重命名变量), 请直接让 Claude 执行.
> Planning is most useful when you're uncertain about the approach, when the change modifies multiple files, or when you're unfamiliar with the code being modified. If you could describe the diff in one sentence, skip the plan.
> 当你不确定该如何操作、更改涉及多个文件或对要修改的代码不熟悉时, 制定计划最为有用. 如果可以用一句话描述差异, 则可以省略计划.
>

---

## Provide specific context in your prompts
请在提示中提供具体背景信息

> The more precise your instructions, the fewer corrections you'll need.
> 你的指示越精确, 需要修改的地方就越少.
>

Claude can infer intent, but it can't read your mind. Reference specific files, mention constraints, and point to example patterns.
Claude 可以推断意图, 但它无法读懂你的心思. 请引用具体文件, 说明限制条件, 并指出示例模式.

| Strategy                                                                                                                                                    | Before                                                                                             | After                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Scope the task.** Specify which file, what scenario, and testing preferences. <br> 明确任务范围. 具体说明目标文件、测试场景和测试偏好.                    | "add tests for foo.py" <br> "为 foo.py 添加测试"                                                   | "write a test for foo.py covering the edge case where the user is logged out. avoid mocks." <br> "为 foo.py 编写一个测试, 覆盖用户已登出的极端情况. 避免使用模拟对象."                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **Point to sources.** Direct Claude to the source that can answer a question. <br> 指出信息来源. 引导 Claude 找到能够回答问题的资料来源.                    | "why does ExecutionFactory have such a weird api?" <br> "为什么 ExecutionFactory 的 API 这么奇怪?" | "look through ExecutionFactory's git history and summarize how its api came to be" <br> "查看 ExecutionFactory 的 git 历史记录, 并总结其 API 的创建过程."                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **Reference existing patterns.** Point Claude to patterns in your codebase. <br> 参考现有模式. 引导 Claude 关注代码库中的模式.                              | "add a calendar widget" <br> "添加日历小部件"                                                      | "look at how existing widgets are implemented on the home page to understand the patterns. HotDogWidget.php is a good example. follow the pattern to implement a new calendar widget that lets the user select a month and paginate forwards/backwards to pick a year. build from scratch without libraries other than the ones already used in the codebase." <br> "查看首页上现有组件的实现方式, 了解其模式. HotDogWidget.php 就是一个很好的例子. 遵循这种模式, 实现一个新的日历组件, 允许用户选择月份, 并向前/向后翻页选择年份. 从零开始构建, 除了代码库中已使用的库之外, 不使用任何其他库." |
| **Describe the symptom.** Provide the symptom, the likely location, and what "fixed" looks like. <br> 描述症状. 提供症状、可能出现的部位以及"缓解"后的状态. | "fix the login bug" <br> "修复登录漏洞"                                                            | "users report that login fails after session timeout. check the auth flow in src/auth/, especially token refresh. write a failing test that reproduces the issue, then fix it" <br> 用户报告称, 会话超时后登录失败. 请检查 src/auth/ 目录下的身份验证流程, 特别是 tokens 刷新部分. 编写一个能够重现此问题的失败测试用例, 然后修复它.                                                                                                                                                                                                                                                            |

Vague prompts can be useful when you're exploring and can afford to course-correct. A prompt like `"what would you improve in this file?"` can surface things you wouldn't have thought to ask about.
当你还在探索阶段, 并且有余力调整方向时, 模糊的提示语可能很有用. 例如, 像 "what would you improve in this file?" 这样的提示语可以引出一些你原本不会想到要问的问题.

### Provide rich content
提供丰富的内容

> Use `@` to reference files, paste screenshots/images, or pipe data directly.
> 使用 `@` 符号引用文件、粘贴屏幕截图/图像或直接传输数据.
>

You can provide rich data to Claude in several ways:
您可以通过多种方式向 Claude 提供丰富的数据:

- Reference files with `@` instead of describing where code lives. Claude reads the file before responding.
  使用 `@` 引用文件, 而不是直接描述代码所在位置. Claude 会先读取文件再做出响应.

- Paste images directly. Copy/paste or drag and drop images into the prompt.
  直接粘贴图片. 复制/粘贴或拖放图片到提示框中.

- Give URLs for documentation and API references. Use `/permissions` to allowlist frequently-used domains.
  提供文档和 API 参考的 URL. 使用 `/permissions` 将常用域名添加到允许列表.

- Pipe in data by running `cat error.log | claude` to send file contents directly.
  通过运行 `cat error.log | claude` 将数据通过管道直接发送文件内容.

- Let Claude fetch what it needs. Tell Claude to pull context itself using Bash commands, MCP tools, or by reading files.
  让 Claude 获取它需要的内容. 告诉 Claude 使用 Bash 命令、MCP 工具或读取文件来获取上下文信息.

---

## Configure your environment
配置您的环境

A few setup steps make Claude Code significantly more effective across all your sessions. For a full overview of extension features and when to use each one, see [Extend Claude Code](https://code.claude.com/docs/en/features-overview).
只需几个简单的设置步骤, 即可显著提升 Claude Code 在所有会话中的效率. 如需全面了解扩展功能及其使用时机, 请参阅 "扩展 Claude Code"部分.

### Write an effective CLAUDE.md
编写一份有效的 CLAUDE.md

> Run `/init` to generate a starter CLAUDE.md file based on your current project structure, then refine over time.
> 运行 `/init` 以根据您当前的项目结构生成一个初始的 CLAUDE.md 文件, 然后随着时间的推移进行完善.
>

CLAUDE.md is a special file that Claude reads at the start of every conversation. Include Bash commands, code style, and workflow rules. This gives Claude persistent context it can't infer from code alone.
CLAUDE.md 是一个特殊文件, Claude 会在每次对话开始时读取该文件. 其中包含 Bash 命令、代码风格和工作流程规则. 这为 Claude 提供了仅凭代码无法推断出的持久上下文信息.

The `/init` command analyzes your codebase to detect build systems, test frameworks, and code patterns, giving you a solid foundation to refine.
`/init` 命令会分析您的代码库, 以检测构建系统、测试框架和代码模式, 从而为您提供一个坚实的基础来进行改进.

There's no required format for CLAUDE.md files, but keep it short and human-readable. For example:
CLAUDE.md 文件没有固定格式, 但请保持简洁易读. 例如:

```CLAUDE.md
# Code style
- Use ES modules (import/export) syntax, not CommonJS (require)
- Destructure imports when possible (eg. import { foo } from 'bar')

# Workflow
- Be sure to typecheck when you're done making a series of code changes
- Prefer running single tests, and not the whole test suite, for performance
```

CLAUDE.md is loaded every session, so only include things that apply broadly. For domain knowledge or workflows that are only relevant sometimes, use [skills](https://code.claude.com/docs/en/skills) instead. Claude loads them on demand without bloating every conversation.
CLAUDE.md 会在每次会话中加载, 因此请仅包含适用范围广泛的内容. 对于仅有时相关的领域知识或工作流程, 请使用技能代替. Claude 会按需加载它们, 而不会使每次对话都变得臃肿.

Keep it concise. For each line, ask: *"Would removing this cause Claude to make mistakes?"* If not, cut it. Bloated CLAUDE.md files cause Claude to ignore your actual instructions!
务必简洁. 每删除一行, 都要问自己: "删除这行会导致 Claude 出错吗?" 如果不会, 就删掉它. 臃肿的 CLAUDE.md 文件会导致 Claude 忽略你的实际指令!

| ✅ Include                                                                                  | ❌ Exclude                                                                                   |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| Bash commands Claude can't guess <br> Claude 猜不到的 Bash 命令                            | Anything Claude can figure out by reading code <br> Claude 可以通过阅读代码弄明白的任何事情 |
| Code style rules that differ from defaults <br> 与默认值不同的代码风格规则                 | Standard language conventions Claude already knows <br> Claude 已经知道的标准语言规范       |
| Testing instructions and preferred test runners <br> 测试说明和首选测试运行程序            | Detailed API documentation (link to docs instead) <br> 详细的 API 文档(链接至文档)          |
| Repository etiquette (branch naming, PR conventions) <br> 代码仓库礼仪(分支命名、PR 规范)  | Information that changes frequently <br> 经常变化的信息                                     |
| Architectural decisions specific to your project <br> 针对您项目的具体建筑设计决策         | Long explanations or tutorials <br> 冗长的解释或教程                                        |
| Developer environment quirks (required env vars) <br> 开发者环境的特殊要求(必需的环境变量) | File-by-file descriptions of the codebase <br> 代码库逐文件描述                             |
| Common gotchas or non-obvious behaviors <br> 常见的陷阱或不易察觉的行为                    | Self-evident practices like "write clean code" <br> 诸如"编写简洁代码"之类的不言而喻的实践  |

If Claude keeps doing something you don't want despite having a rule against it, the file is probably too long and the rule is getting lost. If Claude asks you questions that are answered in CLAUDE.md, the phrasing might be ambiguous. Treat CLAUDE.md like code: review it when things go wrong, prune it regularly, and test changes by observing whether Claude's behavior actually shifts.
如果 Claude 总是做出你不希望他做的事情, 即使你已经设置了规则禁止, 那可能是因为文件太长, 导致规则被忽略了. 如果 Claude 问了一些问题, 而这些问题在 CLAUDE.md 文件中已经有了答案, 那么可能是措辞含糊不清. 请像对待代码一样对待 CLAUDE.md 文件: 出现问题时要检查它, 定期进行精简, 并通过观察 Claude 的行为是否发生变化来测试更改的效果.

You can tune instructions by adding emphasis (e.g., "IMPORTANT" or "YOU MUST") to improve adherence. Check CLAUDE.md into git so your team can contribute. The file compounds in value over time.
你可以通过添加强调(例如, "重要"或"必须")来优化说明, 以提高执行率. 将 CLAUDE.md 文件提交到 Git, 以便你的团队可以参与贡献. 随着时间的推移, 该文件的价值会不断增长.

CLAUDE.md files can import additional files using `@path/to/import` syntax:
CLAUDE.md 文件可以使用 `@path/to/import` 语法导入其他文件:

```CLAUDE.md
See @README.md for project overview and @package.json for available npm commands.

# Additional Instructions
- Git workflow: @docs/git-instructions.md
- Personal overrides: @~/.claude/my-project-instructions.md
```

You can place CLAUDE.md files in several locations:
您可以将 CLAUDE.md 文件放置在以下多个位置:

- Home folder (`~/.claude/CLAUDE.md`): applies to all Claude sessions
  主文件夹( `~/.claude/CLAUDE.md` ): 适用于所有 Claude 会话

- Project root (`./CLAUDE.md`): check into git to share with your team
  项目根目录( `./CLAUDE.md` ): 将其提交到 Git 以便与您的团队共享.

- Parent directories: useful for monorepos where both `root/CLAUDE.md` and `root/foo/CLAUDE.md` are pulled in automatically
  父目录: 适用于单体仓库, 其中 `root/CLAUDE.md` 和 `root/foo/CLAUDE.md` 都会自动加载.

- Child directories: Claude pulls in child CLAUDE.md files on demand when working with files in those directories
  子目录: 当处理这些目录中的文件时, Claude 会按需拉取子目录 CLAUDE.md 文件.

### Configure permissions

> Use [auto mode](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode) to let a classifier handle approvals, `/permissions` to allowlist specific commands, or `/sandbox` for OS-level isolation. Each reduces interruptions while keeping you in control.
> 使用自动模式可以让分类器处理审批, 使用 `/permissions` 允许特定命令, 或使用 `/sandbox` 实现操作系统级别的隔离. 这些方法都能减少干扰, 同时让您保持控制.
>

By default, Claude Code requests permission for actions that might modify your system: file writes, Bash commands, MCP tools, etc. This is safe but tedious. After the tenth approval you're not really reviewing anymore, you're just clicking through. There are three ways to reduce these interruptions:
默认情况下, Claude Code 会请求可能修改系统的操作权限, 例如文件写入、Bash 命令、MCP 工具等. 这虽然安全, 但却很繁琐. 十次审批之后, 你实际上已经不是在审核, 而只是在点击通过. 有三种方法可以减少这些干扰:

- Auto mode: a separate classifier model reviews commands and blocks only what looks risky: scope escalation, unknown infrastructure, or hostile-content-driven actions. Best when you trust the general direction of a task but don't want to click through every step
  自动模式: 一个独立的分类器模型会审查命令, 并仅阻止那些看起来有风险的操作, 例如范围扩大、未知基础设施或恶意内容驱动的操作. 当您信任任务的大致方向, 但不想逐个点击操作时, 此模式最为理想.

- Permission allowlists: permit specific tools you know are safe, like `npm run lint` or `git commit`
  权限允许列表: 允许使用您确定安全的特定工具, 例如 `npm run lint` 或 `git commit`

- Sandboxing: enable OS-level isolation that restricts filesystem and network access, allowing Claude to work more freely within defined boundaries
  沙盒: 启用操作系统级别的隔离, 限制文件系统和网络访问, 使 Claude 能够在定义的边界内更自由地工作.

Read more about [permission modes](https://code.claude.com/docs/en/permission-modes), [permission rules](https://code.claude.com/docs/en/permissions), and [sandboxing](https://code.claude.com/docs/en/sandboxing).
阅读更多关于权限模式、权限规则和沙盒的内容.

### Use CLI tools

> Tell Claude Code to use CLI tools like `gh`, `aws`, `gcloud`, and `sentry-cli` when interacting with external services.
> 告诉 Claude Code 在与外部服务交互时使用 `gh`、`aws`、`gcloud` 和 `sentry-cli` 等 CLI 工具.
>

CLI tools are the most context-efficient way to interact with external services. If you use GitHub, install the `gh` CLI. Claude knows how to use it for creating issues, opening pull requests, and reading comments. Without `gh`, Claude can still use the GitHub API, but unauthenticated requests often hit rate limits.
命令行工具是与外部服务交互最高效的方式. 如果您使用 GitHub, 请安装 `gh` CLI. Claude 知道如何使用它来创建 issue、提交 pull request 和阅读评论. 如果没有 `gh`, Claude 仍然可以使用 GitHub API, 但未经身份验证的请求经常会遇到速率限制.

Claude is also effective at learning CLI tools it doesn't already know. Try prompts like `Use 'foo-cli-tool --help' to learn about foo tool, then use it to solve A, B, C.`
Claude 还能有效地学习它原本不知道的命令行工具. 尝试输入类似 `Use 'foo-cli-tool --help' to learn about foo tool, then use it to solve A, B, C.` 的提示符.

### Connect MCP servers

> Run `claude mcp add` to connect external tools like Notion, Figma, or your database.
> 运行 `claude mcp add` 以连接 Notion、Figma 或数据库等外部工具.
>

With [MCP servers](https://code.claude.com/docs/en/mcp), you can ask Claude to implement features from issue trackers, query databases, analyze monitoring data, integrate designs from Figma, and automate workflows.
借助 MCP 服务器, 您可以要求 Claude 实现问题跟踪器中的功能、查询数据库、分析监控数据、集成 Figma 中的设计以及自动化工作流程.

### Set up hooks

> Use hooks for actions that must happen every time with zero exceptions.
> 使用钩子来处理那些必须每次都执行且不允许任何例外的操作.
>

[Hooks](https://code.claude.com/docs/en/hooks-guide) run scripts automatically at specific points in Claude's workflow. Unlike CLAUDE.md instructions which are advisory, hooks are deterministic and guarantee the action happens.
钩子会在 Claude 工作流程中的特定节点自动运行脚本. 与仅供参考的 CLAUDE.md 指令不同, 钩子是确定性的, 能够保证操作的执行.

Claude can write hooks for you. Try prompts like *"Write a hook that runs eslint after every file edit"* or *"Write a hook that blocks writes to the migrations folder."* Edit `.claude/settings.json` directly to configure hooks by hand, and run `/hooks` to browse what's configured.
Claude 可以帮你编写钩子. 你可以尝试类似 "编写一个钩子, 在每次文件编辑后运行 eslint" 或 "编写一个钩子, 阻止对 migrations 文件夹的写入"这样的提示. 你也可以直接编辑 `.claude/settings.json` 文件来手动配置钩子, 然后运行 `/hooks` 来浏览已配置的内容.

### Create skills

> Create `SKILL.md` files in `.claude/skills/` to give Claude domain knowledge and reusable workflows.
> 在 `.claude/skills/` 下创建 `SKILL.md` 文件, 为 Claude 提供领域知识和可重用的工作流程.
>

[Skills](https://code.claude.com/docs/en/skills) extend Claude's knowledge with information specific to your project, team, or domain. Claude applies them automatically when relevant, or you can invoke them directly with `/skill-name`.
技能可以扩展 Claude 的知识库, 提供与您的项目、团队或领域相关的特定信息. Claude 会在相关时自动应用这些技能, 或者您也可以使用 `/skill-name` 直接调用它们.

Create a skill by adding a directory with a `SKILL.md` to `.claude/skills/`:
通过在 `.claude/skills/` 目录下添加包含 `SKILL.md` 文件的目录来创建技能:

```.claude/skills/api-conventions/SKILL.md
---
name: api-conventions
description: REST API design conventions for our services
---
# API Conventions
- Use kebab-case for URL paths
- Use camelCase for JSON properties
- Always include pagination for list endpoints
- Version APIs in the URL path (/v1/, /v2/)
```

Skills can also define repeatable workflows you invoke directly:
技能还可以定义您可以直接调用的可重复工作流程:

```.claude/skills/fix-issue/SKILL.md
---
name: fix-issue
description: Fix a GitHub issue
disable-model-invocation: true
---
Analyze and fix the GitHub issue: $ARGUMENTS.

1. Use `gh issue view` to get the issue details
2. Understand the problem described in the issue
3. Search the codebase for relevant files
4. Implement the necessary changes to fix the issue
5. Write and run tests to verify the fix
6. Ensure code passes linting and type checking
7. Create a descriptive commit message
8. Push and create a PR
```

Run `/fix-issue 1234` to invoke it. Use `disable-model-invocation: true` for workflows with side effects that you want to trigger manually.
运行 `/fix-issue 1234` 即可触发此修复. 对于需要手动触发副作用的工作流, 请使用 `disable-model-invocation: true`.

### Create custom subagents

> Define specialized assistants in `.claude/agents/` that Claude can delegate to for isolated tasks.
> 在 `.claude/agents/` 中定义专门的助手, Claude 可以将特定任务委托给这些助手.
>

[Subagents](https://code.claude.com/docs/en/sub-agents) run in their own context with their own set of allowed tools. They're useful for tasks that read many files or need specialized focus without cluttering your main conversation.
subagent 在独立的上下文中运行, 并使用其自身的一组可用工具. 它们适用于读取大量文件或需要特定功能的任务, 而不会干扰您的主对话.

```.claude/agents/security-reviewer.md
---
name: security-reviewer
description: Reviews code for security vulnerabilities
tools: Read, Grep, Glob, Bash
model: opus
---
You are a senior security engineer. Review code for:
- Injection vulnerabilities (SQL, XSS, command injection)
- Authentication and authorization flaws
- Secrets or credentials in code
- Insecure data handling

Provide specific line references and suggested fixes.
```

Tell Claude to use subagents explicitly: *"Use a subagent to review this code for security issues."*
告诉 Claude 明确使用 subagent: "使用 subagent 来审查这段代码是否存在安全问题."

### Install plugins

> Run `/plugin` to browse the marketplace. Plugins add skills, tools, and integrations without configuration.
> 运行 `/plugin` 浏览市场. 插件无需配置即可添加技能、工具和集成.
>

[Plugins](https://code.claude.com/docs/en/plugins) bundle skills, hooks, subagents, and MCP servers into a single installable unit from the community and Anthropic. If you work with a typed language, install a [code intelligence plugin](https://code.claude.com/docs/en/discover-plugins#code-intelligence) to give Claude precise symbol navigation and automatic error detection after edits.
插件将技能、钩子、subagent 和 MCP 服务器打包成一个可安装的单元, 这些组件来自社区和 Anthropic. 如果您使用类型化语言, 请安装代码智能插件, 以便 Claude 能够精确地导航符号并在编辑后自动检测错误.

For guidance on choosing between skills, subagents, hooks, and MCP, see [Extend Claude Code](https://code.claude.com/docs/en/features-overview#match-features-to-your-goal).
有关在技能、subagent、钩子和 MCP 之间进行选择的指导, 请参阅扩展 Claude 代码.

---

## Communicate effectively
有效沟通

The way you communicate with Claude Code significantly impacts the quality of results.
你与 Claude Code 的沟通方式会对结果质量产生重大影响.

### Ask codebase questions
询问代码库相关问题

> Ask Claude questions you'd ask a senior engineer.
> 向 Claude 提出你会问高级工程师的问题.
>

When onboarding to a new codebase, use Claude Code for learning and exploration. You can ask Claude the same sorts of questions you would ask another engineer:
在接触新的代码库时, 可以使用 Claude Code 进行学习和探索. 你可以向 Claude 提出与向其他工程师提问时类似的问题:

- How does logging work?
  日志记录是如何工作的?

- How do I make a new API endpoint?
  如何创建新的 API 端点?

- What does `async move { ... }` do on line 134 of `foo.rs`?
  `foo.rs` 文件第 134 行的 `async move { ... }` 做了什么?

- What edge cases does `CustomerOnboardingFlowImpl` handle?
  `CustomerOnboardingFlowImpl` 处理哪些特殊情况?

- Why does this code call `foo()` instead of `bar()` on line 333?
  为什么这段代码在第 333 行调用的是 `foo()` 而不是 `bar()` ?

Using Claude Code this way is an effective onboarding workflow, improving ramp-up time and reducing load on other engineers. No special prompting required: ask questions directly.
使用 Claude Code 的这种方式是一种高效的新员工入职流程, 可以缩短上手时间并减轻其他工程师的工作负担. 无需特别提示: 直接提问即可.

### Let Claude interview you
让 Claude 采访你

> For larger features, have Claude interview you first. Start with a minimal prompt and ask Claude to interview you using the `AskUserQuestion` tool.
> 对于篇幅较长的功能介绍, 请先让 Claude 对您进行面试. 先提供一个最简单的问题, 然后请 Claude 使用 `AskUserQuestion` 工具对您进行面试.
>

Claude asks about things you might not have considered yet, including technical implementation, UI/UX, edge cases, and tradeoffs.
Claude 会问一些你可能还没有考虑过的事情, 包括技术实现、用户界面/用户体验、极端情况和权衡取舍.

```
I want to build [brief description]. Interview me in detail using the AskUserQuestion tool.
我想开发一个[简要描述]. 请使用 AskUserQuestion 工具对我进行详细访谈.

Ask about technical implementation, UI/UX, edge cases, concerns, and tradeoffs. Don't ask obvious questions, dig into the hard parts I might not have considered.
请询问技术实现、UI/UX、边界情况、顾虑和权衡取舍等方面的问题. 不要问显而易见的问题, 深入探讨我可能没有考虑到的难点.

Keep interviewing until we've covered everything, then write a complete spec to SPEC.md.
持续访谈, 直到涵盖所有内容, 然后将完整的规格说明写入 SPEC.md 文件.
```

Once the spec is complete, start a fresh session to execute it. The new session has clean context focused entirely on implementation, and you have a written spec to reference.
规范编写完成后, 启动一个新的会话来执行它. 新会话的上下文干净整洁, 完全专注于实现, 而且您还有一份已编写的规范可供参考.

---

## Manage your session

Conversations are persistent and reversible. Use this to your advantage!
对话是持续的, 也是可逆的. 利用这一点!

### Course-correct early and often
及早且经常纠正方向

> Correct Claude as soon as you notice it going off track.
> 一旦发现 Claude 偏离轨道, 就立即纠正他.
>

The best results come from tight feedback loops. Though Claude occasionally solves problems perfectly on the first attempt, correcting it quickly generally produces better solutions faster.
最佳结果源于紧密的反馈循环. 虽然 Claude 偶尔能在第一次尝试时就完美解决问题, 但快速纠正错误通常能更快地产生更好的解决方案.

- `Esc`: stop Claude mid-action with the `Esc` key. Context is preserved, so you can redirect.
  `Esc`: 按下 `Esc` 键可停止 Claude 的操作. 上下文会被保留, 因此您可以进行重定向.

- `Esc + Esc` or `/rewind`: press `Esc` twice or run `/rewind` to open the rewind menu and restore previous conversation and code state, or summarize from a selected message.
  `Esc + Esc` 或 `/rewind`: 按两次 `Esc` 或运行 `/rewind` 可打开回放菜单, 恢复之前的对话和代码状态, 或从选定的消息中总结.

- `"Undo that"`: have Claude revert its changes.
  `"Undo that"`: 让 Claude 撤销更改.

- `/clear`: reset context between unrelated tasks. Long sessions with irrelevant context can reduce performance.
  `/clear`: 重置不相关任务之间的上下文. 长时间处于无关上下文中会降低性能.

If you've corrected Claude more than twice on the same issue in one session, the context is cluttered with failed approaches. Run `/clear` and start fresh with a more specific prompt that incorporates what you learned. A clean session with a better prompt almost always outperforms a long session with accumulated corrections.
如果你在一次会话中就同一个问题纠正了 Claude 超过两次, 那么上下文中就会充斥着失败的尝试. 运行 `/clear`, 然后使用一个更具体的提示重新开始, 这个提示应该包含你学到的知识. 一个干净的、提示更清晰的会话几乎总是比一个积累了无数次纠正的长时间会话效果更好.

### Manage context aggressively
积极主动地管理背景

> Run `/clear` between unrelated tasks to reset context.
> 在执行不相关的任务之间运行 `/clear` 以重置上下文.
>

Claude Code automatically compacts conversation history when you approach context limits, which preserves important code and decisions while freeing space.
当您接近上下文限制时, Claude Code 会自动压缩对话历史记录, 从而在释放空间的同时保留重要的代码和决策.

During long sessions, Claude's context window can fill with irrelevant conversation, file contents, and commands. This can reduce performance and sometimes distract Claude.
长时间使用后, Claude 的上下文窗口可能会被无关的对话、文件内容和命令填满. 这会降低性能, 有时还会分散 Claude 的注意力.

- Use `/clear` frequently between tasks to reset the context window entirely
  在执行任务之间频繁使用 `/clear` 来完全重置上下文窗口.

- When auto compaction triggers, Claude summarizes what matters most, including code patterns, file states, and key decisions
  当自动压缩触发时, Claude 会总结最重要的信息, 包括代码模式、文件状态和关键决策.

- For more control, run `/compact <instructions>`, like `/compact Focus on the API changes`
  如需更多控制, 请运行 `/compact <instructions>`, 例如 `/compact Focus on the API changes`

- To compact only part of the conversation, use `Esc + Esc` or `/rewind`, select a message checkpoint, and choose **Summarize from here**. This condenses messages from that point forward while keeping earlier context intact.
  要仅压缩部分对话, 请使用 `Esc + Esc` 或 `/rewind` 组合键, 选择一个消息节点, 然后选择 "从此处开始摘要". 这样会从该节点开始压缩消息, 同时保留之前的上下文.

- Customize compaction behavior in CLAUDE.md with instructions like `"When compacting, always preserve the full list of modified files and any test commands"` to ensure critical context survives summarization
  在 CLAUDE.md 中使用类似 `"When compacting, always preserve the full list of modified files and any test commands"` 的指令自定义压缩行为, 以确保关键上下文在摘要后仍然存在.

- For quick questions that don't need to stay in context, use [`/btw`](https://code.claude.com/docs/en/interactive-mode#side-questions-with-btw). The answer appears in a dismissible overlay and never enters conversation history, so you can check a detail without growing context.
  对于无需考虑上下文的​​简短问题, 请使用 `/btw`. 答案会显示在可关闭的弹出窗口中, 并且不会记录在对话中, 因此您可以查看细节而无需了解上下文.

### Use subagents for investigation
利用 subagents 进行调查

> Delegate research with `"use subagents to investigate X"`. They explore in a separate context, keeping your main conversation clean for implementation.
> 委托 `"use subagents to investigate X"` 进行研究. 他们会在单独的背景下进行探索, 从而保持你的主要讨论清晰明了, 便于实施.
>

Since context is your fundamental constraint, subagents are one of the most powerful tools available. When Claude researches a codebase it reads lots of files, all of which consume your context. Subagents run in separate context windows and report back summaries:
由于上下文是根本约束, subagent 是目前最强大的工具之一. 当 Claude 研究代码库时, 它会读取大量文件, 而所有这些文件都会消耗上下文信息. subagent 在独立的上下文窗口中运行, 并返回摘要信息:

```
Use subagents to investigate how our authentication system handles token
refresh, and whether we have any existing OAuth utilities I should reuse.
利用 subagent 来探究我们的认证系统是如何处理令牌刷新的, 并查明是否存在任何可供我复用的现有 OAuth 工具.
```

The subagent explores the codebase, reads relevant files, and reports back with findings, all without cluttering your main conversation.
subagent 会探索代码库, 读取相关文件, 并将发现的结果报告回来, 所有这些都不会干扰您的主要对话.

You can also use subagents for verification after Claude implements something:
在 Claude 实现某些功能后, 您还可以使用 subagent 进行验证:

```
use a subagent to review this code for edge cases
```

### Rewind with checkpoints
回溯功能(带检查点)

`Every action Claude makes creates a checkpoint`. You can restore conversation, code, or both to any previous checkpoint.
Claude 的每一个操作都会创建一个检查点. 您可以将对话、代码或两者都恢复到任何之前的检查点.

Claude automatically checkpoints before changes. Double-tap `Escape` or run `/rewind` to open the rewind menu. You can restore conversation only, restore code only, restore both, or summarize from a selected message. See [Checkpointing](https://code.claude.com/docs/en/checkpointing) for details.
Claude 会在更改前自动创建检查点. 双击 `Escape` 或运行 `/rewind` 即可打开回溯菜单. 您可以仅恢复对话、仅恢复代码、同时恢复对话和代码, 或从选定的消息中获取摘要. 有关详细信息, 请参阅 "检查点" 部分.

Instead of carefully planning every move, you can tell Claude to try something risky. If it doesn't work, rewind and try a different approach. Checkpoints persist across sessions, so you can close your terminal and still rewind later.
与其精心计划每一步, 不如让 Claude 尝试一些冒险的策略. 如果失败了, 可以回溯并尝试其他方法. 检查点会在会话之间保留, 因此即使关闭终端, 之后仍然可以回溯.

> Checkpoints only track changes made *by Claude*, not external processes. This isn't a replacement for git.
> 检查点仅跟踪 Claude 所做的更改, 不跟踪外部进程所做的更改. 它不能替代 Git.
>

### Resume conversations
恢复对话

> Run `claude --continue` to pick up where you left off, or `--resume` to choose from recent sessions.
> 运行 `claude --continue` 继续从上次中断的地方继续, 或 `--resume` 从最近的会话中选择.

Claude Code saves conversations locally. When a task spans multiple sessions, you don't have to re-explain the context:
Claude Code 会将对话保存在本地. 当一项任务跨越多个会话时, 您无需重新解释上下文:

```bash
claude --continue    # Resume the most recent conversation
claude --resume      # Select from recent conversations
```

Use `/rename` to give sessions descriptive names like `"oauth-migration"` or `"debugging-memory-leak"` so you can find them later. Treat sessions like branches: different workstreams can have separate, persistent contexts.
使用 `/rename` 为会话赋予描述性名称, 例如 `"oauth-migration"` 或 `"debugging-memory-leak"` 以便日后查找. 将会话视为分支: 不同的工作流可以拥有独立的、持久的上下文.

---

## Automate and scale
自动化和规模化

Once you're effective with one Claude, multiply your output with parallel sessions, non-interactive mode, and fan-out patterns.
一旦你能够有效地使用一个 Claude, 就可以通过并行会话、非交互模式和扇出模式来倍增你的产量.

Everything so far assumes one human, one Claude, and one conversation. But Claude Code scales horizontally. The techniques in this section show how you can get more done.
到目前为止, 所有内容都假设只有一个人、一个 Claude 和一个对话. 但 Claude Code 可以横向扩展. 本节中的技巧将展示如何提高效率.

### Run non-interactive mode
以非交互模式运行

> Use `claude -p "prompt"` in CI, pre-commit hooks, or scripts. Add `--output-format stream-json` for streaming JSON output.
> 在 CI、pre-commit hooks 或脚本中使用 `claude -p "prompt"`. 添加 `--output-format stream-json` 参数可输出流式 JSON 数据.
>

With `claude -p "your prompt"`, you can run Claude non-interactively, without a session. Non-interactive mode is how you integrate Claude into CI pipelines, pre-commit hooks, or any automated workflow. The output formats let you parse results programmatically: plain text, JSON, or streaming JSON.
使用 `claude -p "your prompt"`, 你可以以非交互方式运行 Claude, 无需会话. 非交互模式是将 Claude 集成到 CI 流水线、pre-commit 钩子或任何自动化工作流中的关键. 输出格式支持以编程方式解析结果: 纯文本、JSON 或流式 JSON.

```bash
# One-off queries
claude -p "Explain what this project does"

# Structured output for scripts
claude -p "List all API endpoints" --output-format json

# Streaming for real-time processing
claude -p "Analyze this log file" --output-format stream-json
```

### Run multiple Claude sessions
运行多个 Claude 会话

> Run multiple Claude sessions in parallel to speed up development, run isolated experiments, or start complex workflows.
> 并行运行多个 Claude 会话以加快开发速度、运行独立实验或启动复杂的工作流程.
>

There are three main ways to run parallel sessions:
并行运行主要有三种方式:

- [Claude Code desktop app](https://code.claude.com/docs/en/desktop#work-in-parallel-with-sessions): Manage multiple local sessions visually. Each session gets its own isolated worktree.
  Claude Code 桌面应用程序: 以可视化方式管理多个本地会话. 每个会话都有其独立的独立工作树.

- [Claude Code on the web](https://code.claude.com/docs/en/claude-code-on-the-web): Run on Anthropic's secure cloud infrastructure in isolated VMs.

- [Agent teams](https://code.claude.com/docs/en/agent-teams): Automated coordination of multiple sessions with shared tasks, messaging, and a team lead.
  代理团队: 通过共享任务、消息传递和团队领导, 自动协调多个会话.

Beyond parallelizing work, multiple sessions enable quality-focused workflows. A fresh context improves code review since Claude won't be biased toward code it just wrote.
除了并行处理工作之外, 多会话还能实现以质量为中心的流程. 全新的上下文有助于改进代码审查, 因为 Claude 不会对它刚刚编写的代码抱有偏见.

For example, use a Writer/Reviewer pattern:
例如, 可以使用作者/审阅者模式:

| Session A (Writer)                                                    | Session B (Reviewer)                                                                                                                                                   |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Implement a rate limiter for our API endpoints                        |                                                                                                                                                                        |
|                                                                       | Review the rate limiter implementation in @src/middleware/rateLimiter.ts. Look for edge cases, race conditions, and consistency with our existing middleware patterns. |
| Here's the review feedback: [Session B output]. Address these issues. |                                                                                                                                                                        |

You can do something similar with tests: have one Claude write tests, then another write code to pass them.
你也可以对测试做类似的事情: 让一个 Claude 编写测试, 然后让另一个 Claude 编写代码来通过这些测试.

### Fan out across files
跨文件扇出

> Loop through tasks calling `claude -p` for each. Use `--allowedTools` to scope permissions for batch operations.
> 循环遍历每个任务, 并调用 `claude -p` 命令. 使用 `--allowedTools` 来限定批量操作的权限范围.

For large migrations or analyses, you can distribute work across many parallel Claude invocations:
对于大型迁移或分析, 您可以将工作分配到多个并行的 Claude 调用中:

1. Generate a task list
生成任务列表

Have Claude list all files that need migrating (e.g., `list all 2,000 Python files that need migrating`)
请 Claude 列出所有需要迁移的文件(例如, `list all 2,000 Python files that need migrating` )

2. Write a script to loop through the list
编写一个脚本来遍历列表.

```bash
for file in $(cat files.txt); do
    claude -p "Migrate $file from React to Vue. Return OK or FAIL." --allowedTools "Edit,Bash(git commit *)"
done
```

3. Test on a few files, then run at scale
先用少量文件进行测试, 然后再大规模运行.

Refine your prompt based on what goes wrong with the first 2-3 files, then run on the full set. The `--allowedTools` flag restricts what Claude can do, which matters when you're running unattended.
根据前两三个文件出现的问题改进提示符, 然后再处理所有文件. `--allowedTools` 标志限制了 Claude 可以执行的操作, 这在无人值守运行时非常重要.

You can also integrate Claude into existing data/processing pipelines:
您还可以将 Claude 集成到现有的数据/处理管道中:

```bash
claude -p "<your prompt>" --output-format json | your_command
```

Use `--verbose` for debugging during development, and turn it off in production.
开发过程中使用 `--verbose` 进行调试, 生产过程中关闭此功能.

### Run autonomously with auto mode
自动模式下自主运行

For uninterrupted execution with background safety checks, use [auto mode](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode). A classifier model reviews commands before they run, blocking scope escalation, unknown infrastructure, and hostile-content-driven actions while letting routine work proceed without prompts.
为了确保程序在后台安全检查下不间断执行, 请使用自动模式. 分类器模型会在命令运行前对其进行审查, 阻止范围升级、未知基础设施攻击和恶意内容驱动的操作, 同时允许常规工作无需提示即可继续进行.

```bash
claude --permission-mode auto -p "fix all lint errors"
```

For non-interactive runs with the `-p` flag, auto mode aborts if the classifier repeatedly blocks actions, since there is no user to fall back to. See [when auto mode falls back](https://code.claude.com/docs/en/permission-modes#when-auto-mode-falls-back) for thresholds.
对于使用 `-p` 标志的非交互式运行, 如果分类器反复阻塞操作, 自动模式将中止, 因为没有可回退的用户. 请参阅阈值设置中自动模式回退的条件.

---

## Avoid common failure patterns
避免常见的故障模式

These are common mistakes. Recognizing them early saves time:
这些都是常见的错误. 及早发现这些错误可以节省时间:

- **The kitchen sink session.** You start with one task, then ask Claude something unrelated, then go back to the first task. Context is full of irrelevant information.
  就像厨房水槽一样, 你先布置一个任务, 然后问 Claude 一个毫不相关的问题, 然后再回到最初的任务. 整个过程充满了无关信息.

  > Fix: `/clear` between unrelated tasks.
  > 修复: 在不相关的任务之间使用 `/clear`.

- **Correcting over and over.** Claude does something wrong, you correct it, it's still wrong, you correct again. Context is polluted with failed approaches.
  反复纠正. Claude 做错了, 你纠正他, 还是错的, 你再纠正一次. 错误的方法充斥着整个语境.

  > Fix: After two failed corrections, `/clear` and write a better initial prompt incorporating what you learned.
  > 解决方法: 两次修改失败后, `/clear` 并根据所学到的知识编写一个更好的初始提示.

- **The over-specified CLAUDE.md.** If your CLAUDE.md is too long, Claude ignores half of it because important rules get lost in the noise.
  CLAUDE.md 文件内容过多. 如果您的 CLAUDE.md 文件过长, Claude 会忽略其中一半的内容, 因为重要的规则会被淹没在冗杂的信息中.

  > Fix: Ruthlessly prune. If Claude already does something correctly without the instruction, delete it or convert it to a hook.
  > 修复方法: 果断精简. 如果 Claude 无需指令就能正确完成某项操作, 则删除该指令或将其转换为钩子.

- **The trust-then-verify gap.** Claude produces a plausible-looking implementation that doesn't handle edge cases.
  先信任后验证的鸿沟. Claude 提出了一种看似合理的实现方案, 但它无法处理极端情况.

  > Fix: Always provide verification (tests, scripts, screenshots). If you can't verify it, don't ship it.
  > 解决方法: 务必提供验证(测试、脚本、屏幕截图). 如果无法验证, 就不要发布.

- **The infinite exploration.** You ask Claude to "investigate" something without scoping it. Claude reads hundreds of files, filling the context.
  无尽的探索. 你让 Claude "调查"某件事, 却不给他设定范围. Claude 会阅读数百份文件, 填补上下文.

  > Fix: Scope investigations narrowly or use subagents so the exploration doesn't consume your main context.
  > 解决方法: 缩小调查范围或使用 subagent, 以免探索占用您的主要上下文.

---

## Develop your intuition
培养你的直觉

The patterns in this guide aren't set in stone. They're starting points that work well in general, but might not be optimal for every situation.
本指南中的模式并非一成不变. 它们是总体上行之有效的起点, 但可能并不适用于所有情况.

Sometimes you *should* let context accumulate because you're deep in one complex problem and the history is valuable. Sometimes you should skip planning and let Claude figure it out because the task is exploratory. Sometimes a vague prompt is exactly right because you want to see how Claude interprets the problem before constraining it.
有时候, 你应该让背景信息慢慢积累, 因为你正深陷于一个复杂的问题中, 而过往的经验至关重要. 有时候, 你应该跳过计划阶段, 让 Claude 自己去探索, 因为这项任务本身就具有探索性. 有时候, 一个模糊的提示恰恰恰到好处, 因为你想在限制问题范围之前, 先看看 Claude 是如何理解它的.

Pay attention to what works. When Claude produces great output, notice what you did: the prompt structure, the context you provided, the mode you were in. When Claude struggles, ask why. Was the context too noisy? The prompt too vague? The task too big for one pass?
注意哪些方法有效. 当 Claude 产出高质量的成果时, 留意你做了什么: 提示的结构、你提供的背景信息、你当时的状态. 当 Claude 遇到困难时, 问问自己为什么. 是背景信息太杂乱? 提示太模糊? 还是任务量太大, 一次无法完成?

Over time, you'll develop intuition that no guide can capture. You'll know when to be specific and when to be open-ended, when to plan and when to explore, when to clear context and when to let it accumulate.
随着时间的推移, 你会培养出一种任何指导都无法捕捉到的直觉. 你会知道何时该具体明确, 何时该保持开放心态; 何时该制定计划, 何时该探索未知; 何时该厘清背景, 何时该让信息自然积累.
