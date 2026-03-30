# Common workflows

* https://code.claude.com/docs/en/common-workflows

Step-by-step guides for exploring codebases, fixing bugs, refactoring, testing, and other everyday tasks with Claude Code.
使用 Claude Code 探索代码库、修复错误、重构、测试和其他日常任务的分步指南.

This page covers practical workflows for everyday development: exploring unfamiliar code, debugging, refactoring, writing tests, creating PRs, and managing sessions. Each section includes example prompts you can adapt to your own projects. For higher-level patterns and tips, see [Best practices](https://code.claude.com/docs/en/best-practices).
本页面涵盖日常开发中的实用工作流程: 探索不熟悉的代码、调试、重构、编写测试、创建 PR 以及管理会话. 每个部分都包含示例提示, 您可以根据自己的项目进行调整. 如需了解更高级别的模式和技巧, 请参阅 ["最佳实践"部分](https://code.claude.com/docs/en/best-practices).

## Understand new codebases
了解新的代码库

### Get a quick codebase overview
快速概览代码库

Suppose you've just joined a new project and need to understand its structure quickly.
假设你刚刚加入一个新项目, 需要快速了解它的结构.

1. Navigate to the project root directory
导航到项目根目录

```bash
cd /path/to/project
```

2. Start Claude Code

```bash
claude
```

3. Ask for a high-level overview
请求提供一份概要介绍

```
give me an overview of this codebase
请给我这份代码库的概览.
```

4. Dive deeper into specific components
深入了解具体组成部分

```
explain the main architecture patterns used here
请解释此处采用的主要架构模式.
```

```
what are the key data models?
关键的数据模型有哪些?
```

```
how is authentication handled?
认证是如何处理的?
```

> Tips:
> - Start with broad questions, then narrow down to specific areas
>   先提出宽泛的问题, 然后缩小范围到具体领域.
> - Ask about coding conventions and patterns used in the project
>   询问项目中使用的编码规范和模式.
> - Request a glossary of project-specific terms
>   索取项目特定术语表
>

### Find relevant code
查找相关代码

Suppose you need to locate code related to a specific feature or functionality.
假设你需要查找与特定特性或功能相关的代码.

1. Ask Claude to find relevant files
请 Claude 查找相关文件

```
find the files that handle user authentication
```

2. Get context on how components interact
了解组件如何交互的上下文

```
how do these authentication files work together?
这些认证文件是如何协同工作的?
```

3. Understand the execution flow
了解执行流程

```
trace the login process from front-end to database
追踪从前端到数据库的登录流程
```

> Tips:
> - Be specific about what you're looking for
>   请具体说明您想要寻找什么.
> - Use domain language from the project
>   使用项目中的领域语言
> - Install a [code intelligence plugin](https://code.claude.com/docs/en/discover-plugins#code-intelligence) for your language to give Claude precise "go to definition" and "find references" navigation
>   安装适用于您编程语言的[代码智能插件](https://code.claude.com/docs/en/discover-plugins#code-intelligence) , 让 Claude 能够精确地执行"跳转到定义"和"查找引用"导航操作.
>

---

## Fix bugs efficiently
高效修复漏洞

Suppose you've encountered an error message and need to find and fix its source.
假设你遇到了一个错误信息, 需要找到并修复它的根源.

1. Share the error with Claude

```
I'm seeing an error when I run npm test
```

2. Ask for fix recommendations
寻求修复建议

```
suggest a few ways to fix the @ts-ignore in user.ts
建议几种修复 user.ts 中 @ts-ignore 的方法.
```

3. Apply the fix
应用此修复程序

```
update user.ts to add the null check you suggested
```

> Tips:
> - Tell Claude the command to reproduce the issue and get a stack trace
>   告诉 Claude 重现问题并获取堆栈跟踪的命令
> - Mention any steps to reproduce the error
>   请说明重现该错误的具体步骤.
> - Let Claude know if the error is intermittent or consistent
>   请告知 Claude 该错误是间歇性的还是持续性的.
>

---

## Refactor code
重构代码

Suppose you need to update old code to use modern patterns and practices.
假设你需要更新旧代码, 使其使用现代模式和实践.

1. Identify legacy code for refactoring
识别需要重构的遗留代码

```
find deprecated API usage in our codebase
```

2. Get refactoring recommendations
获取重构建议

```
suggest how to refactor utils.js to use modern JavaScript features
```

3. Apply the changes safely
安全地应用这些更改.

```
refactor utils.js to use ES2024 features while maintaining the same behavior
```

4. Verify the refactoring
验证重构

```
run tests for the refactored code
```

> Tips:
> - Ask Claude to explain the benefits of the modern approach
>   请 Claude 解释一下现代方法的优势
> - Request that changes maintain backward compatibility when needed
>   要求在需要时保持向后兼容性
> - Do refactoring in small, testable increments
> 以小的、可测试的增量进行重构
>

---

## Use specialized subagents
使用专门的 subagents

Suppose you want to use specialized AI subagents to handle specific tasks more effectively.
假设你想使用专门的 AI subagents 来更有效地处理特定任务.

1. View available subagents
查看可用的分代理商

```
/agents
```

This shows all available subagents and lets you create new ones.
这里会显示所有可用的 subagents, 并允许您创建新的 subagents.

2. Use subagents automatically
自动使用 subagents

Claude Code automatically delegates appropriate tasks to specialized subagents:
Claude Code 会自动将适当的任务委派给专门的 subagents:

```
review my recent code changes for security issues
请审查我最近的代码变更, 以查找安全问题.
```

```
run all tests and fix any failures
运行所有测试并修复任何失败
```

3. Explicitly request specific subagents
明确请求特定 subagents

```
use the code-reviewer subagent to check the auth module
使用代码审查 subagent 来检查认证模块.
```

```
have the debugger subagent investigate why users can't log in
让调试 subagent 调查用户无法登录的原因.
```

4. Create custom subagents for your workflow
为您的工作流程创建自定义 subagents

```
/agents
```

Then select "Create New subagent" and follow the prompts to define:
然后选择"创建新 subagents", 并按照提示进行定义:

- A unique identifier that describes the subagent's purpose (for example, `code-reviewer`, `api-designer`).
  描述 subagents 用途的唯一标识符(例如, `code-reviewer`、`api-designer`).
- When Claude should use this agent
  Claude 何时应该使用这种 agent
- Which tools it can access
  它可以访问哪些工具?
- A system prompt describing the agent's role and behavior
  系统提示, 描述代理的角色和行为

> Tips:
> - Create project-specific subagents in `.claude/agents/` for team sharing
>   在 `.claude/agents/` 下创建项目特定的 subagents, 以便团队共享.
> - Use descriptive `description` fields to enable automatic delegation
>   使用描述 `description` 字段启用自动委派
> - Limit tool access to what each subagent actually needs
>   限制每个 subagents 的工具访问权限, 使其仅限于实际需要的权限.
> - Check the [subagents documentation](https://code.claude.com/docs/en/sub-agents) for detailed examples
>   请查看[subagents 文档](https://code.claude.com/docs/en/sub-agents)以获取详细示例.
>

---

## Use Plan Mode for safe code analysis
使用计划模式进行安全的代码分析

Plan Mode instructs Claude to create a plan by analyzing the codebase with read-only operations, perfect for exploring codebases, planning complex changes, or reviewing code safely. In Plan Mode, Claude uses [`AskUserQuestion`](https://code.claude.com/docs/en/tools-reference) to gather requirements and clarify your goals before proposing a plan.
计划模式指示 Claude 通过只读操作分析代码库来创建计划, 非常适合探索代码库、规划复杂变更或安全地审查代码. 在计划模式下, Claude 会使用 [`AskUserQuestion`](https://code.claude.com/docs/en/tools-reference) 来收集需求并明确目标, 然后再提出计划.

### When to use Plan Mode
何时使用计划模式

- **Multi-step implementation**: When your feature requires making edits to many files
  多步骤实现: 当你的功能需要编辑多个文件时
- **Code exploration**: When you want to research the codebase thoroughly before changing anything
  代码探索: 在进行任何更改之前, 想要彻底研究代码库.
- **Interactive development**: When you want to iterate on the direction with Claude
  交互式开发: 当你想要与 Claude 一起迭代开发方向时

### How to use Plan Mode
如何使用计划模式

**Turn on Plan Mode during a session**
在会话期间启用计划模式

You can switch into Plan Mode during a session using `Shift+Tab` to cycle through permission modes.
在会话期间, 您可以使用 Shift+Tab 切换权限模式, 从而切换到计划模式.

If you are in Normal Mode, `Shift+Tab` first switches into Auto-Accept Mode, indicated by `⏵⏵ accept edits on` at the bottom of the terminal. A subsequent `Shift+Tab` will switch into Plan Mode, indicated by `⏸ plan mode on`.
如果您处于普通模式, Shift+Tab 首先会切换到自动接受模式, 终端底部会显示 `⏵⏵ accept edits on`. 再次按下 Shift+Tab 将切换到计划模式, 终端底部会显示 `⏸ plan mode on`.

**Start a new session in Plan Mode**
以计划模式开始新会话

To start a new session in Plan Mode, use the `--permission-mode plan` flag:
要在计划模式下启动新会话, 请使用 `--permission-mode plan` 标志:

```
claude --permission-mode plan
```

**Run "headless" queries in Plan Mode
在计划模式下运行"无头"查询

You can also run a query in Plan Mode directly with `-p` (that is, in ["headless mode"](https://code.claude.com/docs/en/headless)):
您还可以使用 `-p` 直接在计划模式下运行查询(即 ["无头模式"](https://code.claude.com/docs/en/headless)):

```
claude --permission-mode plan -p "Analyze the authentication system and suggest improvements"
```

### Example: Planning a complex refactor
示例: 规划复杂的重构

```
claude --permission-mode plan
```

```
I need to refactor our authentication system to use OAuth2. Create a detailed migration plan.
我需要重构我们的认证系统, 使其采用 OAuth2. 请制定一份详细的迁移计划.
```

Claude analyzes the current implementation and create a comprehensive plan. Refine with follow-ups:
Claude 分析了当前的实施方案, 并制定了一项全面的计划. 后续跟进完善了该计划:

```
What about backward compatibility?
向后兼容性如何?
```

```
How should we handle database migration?
我们应该如何处理数据库迁移?
```

> Press `Ctrl+G` to open the plan in your default text editor, where you can edit it directly before Claude proceeds.
> 按 `Ctrl+G` 在默认文本编辑器中打开计划, 您可以在 Claude 继续操作之前直接对其进行编辑.
>

When you accept a plan, Claude automatically names the session from the plan content. The name appears on the prompt bar and in the session picker. If you've already set a name with `--name` or `/rename`, accepting a plan won't overwrite it.
接受计划后, Claude 会自动根据计划内容为会话命名. 该名称会显示在提示栏和会话选择器中. 如果您已经使用 `--name` 或 `/rename` 设置了名称, 接受计划不会覆盖该名称.

### Configure Plan Mode as default
将计划模式配置为默认值

```
// .claude/settings.json
{
    "permissions": {
        "defaultMode": "plan"
    }
}
```

See [settings documentation](https://code.claude.com/docs/en/settings#available-settings) for more configuration options.
请参阅[设置文档](https://code.claude.com/docs/en/settings#available-settings)以了解更多配置选项.

---

## Work with tests
使用测试

Suppose you need to add tests for uncovered code.
假设你需要为未覆盖的代码添加测试.

1. Identify untested code
找出未经测试的代码

```
find functions in NotificationsService.swift that are not covered by tests
```

2. Generate test scaffolding
生成测试框架

```
add tests for the notification service
```

3. Add meaningful test cases
添加有意义的测试用例

```
add test cases for edge conditions in the notification service
```

4. Run and verify tests
运行并验证测试

```
run the new tests and fix any failures
```

Claude can generate tests that follow your project's existing patterns and conventions. When asking for tests, be specific about what behavior you want to verify. Claude examines your existing test files to match the style, frameworks, and assertion patterns already in use.
Claude 可以生成符合项目现有模式和规范的测试用例. 在请求生成测试用例时, 请具体说明要验证的行为. Claude 会检查您现有的测试文件, 以确保其风格、框架和断言模式与现有文件相匹配.

For comprehensive coverage, ask Claude to identify edge cases you might have missed. Claude can analyze your code paths and suggest tests for error conditions, boundary values, and unexpected inputs that are easy to overlook.
为了获得更全面的测试结果, 请 Claude 帮您找出可能遗漏的边界情况. Claude 可以分析您的代码路径, 并针对容易被忽略的错误情况、边界值和意外输入提出测试建议.

---

## Create pull requests
创建拉取请求

You can create pull requests by asking Claude directly ("create a pr for my changes"), or guide Claude through it step-by-step:
你可以直接向 Claude 提出拉取请求("为我的更改创建一个拉取请求"), 或者一步一步地指导 Claude 完成操作:

1. Summarize your changes
总结你的更改

```
summarize the changes I've made to the authentication module
总结我对认证模块所做的更改.
```

2. Generate a pull request
生成拉取请求

```
create a pr
```

3. Review and refine
审查和完善

```
enhance the PR description with more context about the security improvements
为 PR 描述补充更多关于安全改进的背景信息.
```

When you create a PR using `gh pr create`, the session is automatically linked to that PR. You can resume it later with `claude --from-pr <number>`.
当您使用 `gh pr create` PR 时, 会话会自动链接到该 PR. 您可以稍后使用 `claude --from-pr <number>` 恢复会话.

> Review Claude's generated PR before submitting and ask Claude to highlight potential risks or considerations.
> 在提交之前, 请审核 Claude 撰写的公关稿, 并请 Claude 指出潜在的风险或注意事项.
>

## Handle documentation
处理文档

Suppose you need to add or update documentation for your code.
假设你需要为你的代码添加或更新文档.

1. Identify undocumented code
识别未记录的代码

```
find functions without proper JSDoc comments in the auth module
```

2. Generate documentation
生成文档

```
add JSDoc comments to the undocumented functions in auth.js
```

3. Review and enhance
审查和改进

```
improve the generated documentation with more context and examples
```

4. Verify documentation
核实文件

```
check if the documentation follows our project standards
```

> Tips:
> - Specify the documentation style you want (JSDoc, docstrings, etc.)
>   指定您想要的文档样式(JSDoc、文档字符串等).
> - Ask for examples in the documentation
>   请查阅文档以获取示例.
> - Request documentation for public APIs, interfaces, and complex logic
>   请求提供公共 API、接口和复杂逻辑的文档

---

## Work with images
处理图像

Suppose you need to work with images in your codebase, and you want Claude's help analyzing image content.
假设你需要在代码库中处理图像, 并且你想让 Claude 帮助你分析图像内容.

1. Add an image to the conversation
在对话中添加图片

You can use any of these methods:
您可以使用以下任何一种方法:

1. Drag and drop an image into the Claude Code window
   将图像拖放到 Claude Code 窗口中
2. Copy an image and paste it into the CLI with ctrl+v (Do not use cmd+v)
   复制图片并使用 Ctrl+V 将其粘贴到命令行界面(不要使用 Cmd+V).
3. Provide an image path to Claude. E.g., "Analyze this image: /path/to/your/image.png"
   请向 Claude 提供图像路径. 例如: "分析此图像: /path/to/your/image.png"

2. Ask Claude to analyze the image
请 Claude 分析这张图片

```
What does this image show?
这张图片展示了什么?
```

```
Describe the UI elements in this screenshot
描述此截图中的 UI 元素.
```

```
Are there any problematic elements in this diagram?
这张图中是否存在任何有问题(或不当)的元素?
```

3. Use images for context
使用图片来提供上下文信息.

```
Here's a screenshot of the error. What's causing it?
```

```
This is our current database schema. How should we modify it for the new feature?
```

4. Get code suggestions from visual content
从视觉内容中获取代码建议

```
Generate CSS to match this design mockup
```

```
What HTML structure would recreate this component?
```

> Tips:
> - Use images when text descriptions would be unclear or cumbersome
>   当文字描述不够清晰或过于冗长时, 请使用图片.
> - Include screenshots of errors, UI designs, or diagrams for better context
>   请提供错误截图、用户界面设计图或图表, 以便更好地说明情况.
> - You can work with multiple images in a conversation
>   您可以在对话中使用多张图片.
> - Image analysis works with diagrams, screenshots, mockups, and more
>   图像分析适用于图表、屏幕截图、模型等.
> - When Claude references images (for example, `[Image #1]`), `Cmd+Click` (Mac) or `Ctrl+Click` (Windows/Linux) the link to open the image in your default viewer
>   当 Claude 引用图片时(例如,  `[Image #1]` ),  `Cmd+Click` (Mac)或 `Ctrl+Click` (Windows/Linux)即可在默认查看器中打开该图片链接.
>

---

## Reference files and directories
参考文件和目录

Use `@` to quickly include files or directories without waiting for Claude to read them.
使用 @ 可以快速包含文件或目录, 而无需等待 Claude 读取它们.

1. Reference a single file
引用单个文件

```
Explain the logic in @src/utils/auth.js
```

This includes the full content of the file in the conversation.
这包括对话中文件的全部内容.

2. Reference a directory
参考目录

```
What's the structure of @src/components?
```

This provides a directory listing with file information.
这将提供一个包含文件信息的目录列表.

3. Reference MCP resources
参考 MCP 资源

```
Show me the data from @github:repos/owner/repo/issues
```

This fetches data from connected MCP servers using the format @server:resource. See [MCP resources](https://code.claude.com/docs/en/mcp#use-mcp-resources) for details.
此命令使用 @server:resource 格式从已连接的 MCP 服务器获取数据. 有关详细信息, 请参阅 MCP 资源.

> Tips:
> - File paths can be relative or absolute
>   文件路径可以是相对路径, 也可以是绝对路径.
> - @ file references add `CLAUDE.md` in the file's directory and parent directories to context
>   @文件引用 将 `CLAUDE.md` 文件及其父目录添加到上下文中
> - Directory references show file listings, not contents
>   目录引用显示的是文件列表, 而不是文件内容.
> - You can reference multiple files in a single message (for example, "@file1.js and @file2.js")
>   您可以在一条消息中引用多个文件(例如, "@file1.js 和 @file2.js")
>

---

## Use extended thinking (thinking mode)
运用扩展思维(思考模式)

[Extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking) is enabled by default, giving Claude space to reason through complex problems step-by-step before responding. This reasoning is visible in verbose mode, which you can toggle on with `Ctrl+O`.
默认情况下启用[扩展思考](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)功能, 让 Claude 有时间逐步推演复杂问题, 然后再作答. 这种推理过程在详细模式下可见, 您可以使用 `Ctrl+O` 切换该模式.

Additionally, Opus 4.6 and Sonnet 4.6 support adaptive reasoning: instead of a fixed thinking token budget, the model dynamically allocates thinking based on your [effort level](https://code.claude.com/docs/en/model-config#adjust-effort-level) setting. Extended thinking and adaptive reasoning work together to give you control over how deeply Claude reasons before responding.
此外, Opus 4.6 和 Sonnet 4.6 支持自适应推理: 该模型并非采用固定的思维 tokens 预算, 而是根据您设定的[努力程度](https://code.claude.com/docs/en/model-config#adjust-effort-level)动态分配思维资源. 扩展思维和自适应推理协同工作, 让您可以控制 Claude 在做出回应前进行推理的深度.

Extended thinking is particularly valuable for complex architectural decisions, challenging bugs, multi-step implementation planning, and evaluating tradeoffs between different approaches.
扩展思维对于复杂的架构决策、棘手的 bug、多步骤实施计划以及评估不同方法之间的权衡尤为重要.

> Phrases like "think", "think hard", and "think more" are interpreted as regular prompt instructions and don't allocate thinking tokens.
> "思考"、"认真思考"和"多思考"等短语被解释为常规提示指令, 不分配思考 tokens.
>

### Configure thinking mode
配置思维模式

Thinking is enabled by default, but you can adjust or disable it.
默认情况下启用"思考"功能, 但您可以进行调整或禁用它.

- Scope: Effort level
         努力程度

  How to configure: Run `/effort`, adjust in `/model`, or set [`CLAUDE_CODE_EFFORT_LEVEL`](https://code.claude.com/docs/en/env-vars)
                    运行 `/effort`, 在 `/model` 中进行调整, 或设置 `CLAUDE_CODE_EFFORT_LEVEL`

  Details: Control thinking depth for Opus 4.6 and Sonnet 4.6. See [Adjust effort level](https://code.claude.com/docs/en/model-config#adjust-effort-level)
           控制 Opus 4.6 和 Sonnet 4.6 的思考深度. 参见"调整努力程度".

- Scope: `ultrathink` keyword

  How to configure: Include "ultrathink" anywhere in your prompt
                    提示中任何位置都包含"超思维"一词

  Details: Sets effort to high for that turn on Opus 4.6 and Sonnet 4.6. Useful for one-off tasks requiring deep reasoning without permanently changing your effort setting
           将 Opus 4.6 和 Sonnet 4.6 的该回合难度设置为高. 适用于需要深度推理的一次性任务, 无需永久更改难度设置.

- Scope: Toggle shortcut
         切换快捷方式

  How to configure: Press `Option+T` (macOS) or `Alt+T` (Windows/Linux)

  Details: Toggle thinking on/off for the current session (all models). May require [terminal configuration](https://code.claude.com/docs/en/terminal-config) to enable Option key shortcuts
           切换当前会话的思考模式开启/关闭(所有 models). 可能需要配置终端以启用 Option 键快捷键.

- Scope: Global default

  How to configure: Use `/config` to toggle thinking mode
                    使用 `/config` 切换思考模式

  Details: Sets your default across all projects (all models). Saved as `alwaysThinkingEnabled` in `~/.claude/settings.json`
           设置所有项目(所有模型)的默认值

- Scope: Limit token budget
         限制 tokens 预算

  How to configure: Set [`MAX_THINKING_TOKENS`](https://code.claude.com/docs/en/env-vars) environment variable

  Details: Limit the thinking budget to a specific number of tokens. On Opus 4.6 and Sonnet 4.6, only `0` applies unless adaptive reasoning is disabled. Example: `export MAX_THINKING_TOKENS=10000`
           将思考预算限制在特定数量的词元内. 在 Opus 4.6 和 Sonnet 4.6 中, 除非禁用自适应推理, 否则仅适用 `0` 示例: `export MAX_THINKING_TOKENS=10000`

To view Claude's thinking process, press `Ctrl+O` to toggle verbose mode and see the internal reasoning displayed as gray italic text.
要查看 Claude 的思考过程, 请按 `Ctrl+O` 切换到详细模式, 即可看到以灰色斜体文本显示的内部推理.

### How extended thinking works
扩展思维是如何运作的

Extended thinking controls how much internal reasoning Claude performs before responding. More thinking provides more space to explore solutions, analyze edge cases, and self-correct mistakes.
扩展思维控制着 Claude 在做出反应前进行内部推理的程度. 更多的思考能提供更多空间去探索解决方案、分析极端情况并自我纠正错误.

**With Opus 4.6 and Sonnet 4.6**, thinking uses adaptive reasoning: the model dynamically allocates thinking tokens based on the [effort level](https://code.claude.com/docs/en/model-config#adjust-effort-level) you select. This is the recommended way to tune the tradeoff between speed and reasoning depth.
Opus 4.6 和 Sonnet 4.6 采用自适应推理: 模型会根据您选择的努力程度动态分配思维标记. 这是调整速度和推理深度之间平衡的推荐方法.

**With older models**, thinking uses a fixed token budget drawn from your output allocation. The budget varies by model; see [`MAX_THINKING_TOKENS`](https://code.claude.com/docs/en/env-vars) for per-model ceilings. You can limit the budget with that environment variable, or disable thinking entirely via `/config` or the `Option+T`/`Alt+T` toggle.
**对于较旧的型号** , 思考功能使用从输出分配中抽取的固定 tokens 预算. 预算因型号而异; 请参阅 `MAX_THINKING_TOKENS` 以了解每个型号的上限. 您可以使用该环境变量限制预算, 或者通过 `/config` 或 `Option+T` / `Alt+T` 切换完全禁用思考功能.

On Opus 4.6 and Sonnet 4.6, [adaptive reasoning](https://code.claude.com/docs/en/model-config#adjust-effort-level) controls thinking depth, so `MAX_THINKING_TOKENS` only applies when set to `0` to disable thinking, or when `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1` reverts these models to the fixed budget. See [environment variables](https://code.claude.com/docs/en/env-vars).
在 Opus 4.6 和 Sonnet 4.6 中, 自适应推理控制思维深度, 因此 `MAX_THINKING_TOKENS` 仅在设置为 `0` 以禁用思维时生效, 或者当 `CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1` 将这些模型恢复为固定预算时生效. 请参阅[环境变量](https://code.claude.com/docs/en/env-vars).

> You're charged for all thinking tokens used, even though Claude 4 models show summarized thinking
> 即使 Claude 4 型模型显示的是概括性思维, 您仍需为所有使用的思维 tokens 付费.
>

---

## Resume previous conversations
继续之前的对话

When starting Claude Code, you can resume a previous session:
启动 Claude Code 时, 您可以恢复之前的会话:

- `claude --continue` continues the most recent conversation in the current directory
  `claude --continue` 继续当前目录中的最新对话

- `claude --resume` opens a conversation picker or resumes by name
  `claude --resume` 打开对话选择器或按姓名选择简历

- `claude --from-pr 123` resumes sessions linked to a specific pull request
  `claude --from-pr 123` 恢复与特定拉取请求关联的会话

From inside an active session, use `/resume` to switch to a different conversation.
在当前会话中, 使用 `/resume` 切换到不同的对话.

Sessions are stored per project directory. The `/resume` picker shows sessions from the same git repository, including worktrees.
会话数据按项目目录存储. `/resume` 显示来自同一 Git 仓库的会话数据, 包括工作树.

### Name your sessions
为您的会话命名

Give sessions descriptive names to find them later. This is a best practice when working on multiple tasks or features.
为会话命名时, 请使用描述性名称以便日后查找. 在处理多个任务或功能时, 这是一种最佳实践.

1. Name the session
为会话命名

Name a session at startup with `-n`:
启动时使用 `-n` 指定会话名称:

```
claude -n auth-refactor
```

Or use `/rename` during a session, which also shows the name on the prompt bar:
或者在会话期间使用 `/rename` , 该命令也会在提示栏上显示名称:

```
/rename auth-refactor
```

You can also rename any session from the picker: run `/resume`, navigate to a session, and press `R`.
您还可以从选择器重命名任何会话: 运行 `/resume` , 导航到会话, 然后按 `R`

2. Resume by name later
稍后按姓名简历

From the command line:
从命令行:

```
claude --resume auth-refactor
```

Or from inside an active session:
或者在正在进行的会话中:

```
/resume auth-refactor
```

### Use the session picker
使用会话选择器

The `/resume` command (or `claude --resume` without arguments) opens an interactive session picker with these features:
`/resume` 命令(或不带参数的 `claude --resume` 命令)会打开一个交互式会话选择器, 该选择器具有以下功能:

**Keyboard shortcuts in the picker:**
选择器中的键盘快捷键:

| Shortcut  | Action                                                                              |
| --------- | ----------------------------------------------------------------------------------- |
| `↑` / `↓` | Navigate between sessions <br> 在会话之间导航                                       |
| `→` / `←` | Expand or collapse grouped sessions <br> 展开或折叠分组会话                         |
| `Enter`   | Select and resume the highlighted session <br> 选择并继续执行高亮显示的会话         |
| `P`       | Preview the session content <br> 预览会议内容                                       |
| `R`       | Rename the highlighted session <br> 重命名突出显示的会话                            |
| `/`       | Search to filter sessions <br> 搜索以筛选会话                                       |
| `A`       | Toggle between current directory and all projects <br> 在当前目录和所有项目之间切换 |
| `B`       | Filter to sessions from your current git branch <br> 筛选当前 Git 分支中的会话      |
| `Esc`     | Exit the picker or search mode <br> 退出选择器或搜索模式                            |

**Session organization:**

The picker displays sessions with helpful metadata:
选择器会显示带有有用元数据的会话:

- Session name or initial prompt
  会话名称或初始提示
- Time elapsed since last activity
  自上次活动以来经过的时间
- Message count
  消息计数
- Git branch (if applicable)
  Git 分支(如果适用)

Forked sessions (created with `/branch`, `/rewind`, or `--fork-session`) are grouped together under their root session, making it easier to find related conversations.
使用 `/branch`、`/rewind` 或 `--fork-session` 创建的分支会话会分组到其根会话下, 从而更容易找到相关的对话.

> Tips:
> - **Name sessions early**: Use `/rename` when starting work on a distinct task: it's much easier to find "payment-integration" than "explain this function" later
>   尽早命名会话: 在开始处理一项独立任务时使用 `/rename`: 查找"支付集成"比之后查找"解释此功能"要容易得多.
> - Use `--continue` for quick access to your most recent conversation in the current directory
>   使用 `--continue` 可快速访问当前目录中的最近对话.
> - Use `--resume session-name` when you know which session you need
>   如果您知道需要恢复哪个会话, 请使用 `--resume session-name`
> - Use `--resume` (without a name) when you need to browse and select
>   当您需要浏览和选择时, 请使用 `--resume` (不带名称).
> - For scripts, use `claude --continue --print "prompt"` to resume in non-interactive mode
>   对于脚本, 使用 `claude --continue --print "prompt"` 可在非交互模式下恢复运行.
> - Press `P` in the picker to preview a session before resuming it
>   在选择器中按 `P` 可在恢复会话前预览会话.
> - The resumed conversation starts with the same model and configuration as the original
>   恢复后的对话以与原对话相同的模型和配置开始.
>
> How it works:
> 工作原理:
> 1. **Conversation Storage**: All conversations are automatically saved locally with their full message history
>    对话存储: 所有对话及其完整消息历史记录都会自动保存到本地.
> 2. **Message Deserialization**: When resuming, the entire message history is restored to maintain context
>    消息反序列化: 恢复运行时, 将恢复整个消息历史记录以保持上下文.
> 3. **Tool State**: Tool usage and results from the previous conversation are preserved
>    工具状态: 保留上次对话的工具使用情况和结果.
> 4. **Context Restoration**: The conversation resumes with all previous context intact
>    上下文恢复: 对话恢复, 所有先前的上下文均保持不变.
>

您好, 假设你是一位精通 claude code 的高级开发人员, 我在 claude code 文档中了解到, claude 会将所有对话及其完整消息历史记录都会自动保存到本地, 我想请问 claude 将会话信息保存在本地的哪个目录, 我似乎在文档中没有找到

你好! 作为一名深度使用并研究过 Claude Code (CLI) 内部实现的开发人员, 我非常乐意为你解答这个关于"数字足迹"的问题.
Claude Code 确实非常注重本地持久化, 这样你才能使用 /resume 命令随时恢复之前的对话, 或者在断网后查看历史.
在 Linux 和 macOS 系统中, Claude Code 遵循了 Unix 的传统, 将所有状态存储在用户家目录下的隐藏目录中.
1. 核心存储路径
你的对话历史记录存放在以下位置:
Linux/macOS: ~/.claude/sessions/
Windows: C:\Users\<你的用户名>\.claude\sessions\
2. 该目录下有什么?
如果你进入这个目录(cd ~/.claude/sessions/), 你会发现一系列以时间戳或 UUID 命名的 JSON 文件.
文件格式: 每个文件对应一个独立的会话.
内容结构: 如果你用 cat 或 jq 打开这些文件, 你会看到完整的对话序列, 包括:
role: "user" 或 "assistant".
content: 对话的具体文本.
tool_use / tool_result: 极其详细的工具调用记录(例如它执行了哪个 shell 命令、读了哪个文件、grep 的结果是什么).
timestamp: 该消息产生的时间.
3. 如何通过命令行快速定位?
如果你想确认你的系统上确切的路径(万一未来版本更新了路径), 你可以运行这个"高级开发人员"常用的命令:
```Bash
claude doctor
```
在输出结果的 "Data directory" 或 "Config directory" 这一行, 它会直接显示出当前实例正在使用的根目录. 通常历史记录就在该目录下的 sessions 子目录里.
4. 为什么文档里很难找到?
Anthropic 的官方文档目前更侧重于功能使用和安全说明. 对于这种具体的实现细节(Implementation Details), 开发者通常需要通过查看 CLI 的运行日志或者对 ~/.claude 文件夹进行逆向观察来确认.
5. 补充: 除了会话, 还有什么被保存了?
在 ~/.claude/ 这个根目录下, 你还会发现:
mcp.json: 存储你配置的 Model Context Protocol 服务器信息.
settings.json: 存储你的偏好设置(比如是否允许自动执行命令、主题颜色等).
stats.json (或类似名称): 存储 Token 使用统计, 用于计算大概的花费.
开发人员建议:
如果你想彻底清除某个敏感对话的历史, 除了在 Claude Code 界面里处理, 最物理的方法就是直接删除 ~/.claude/sessions/ 下对应的 JSON 文件.
注意: 如果你手动修改了这些 JSON 文件, 可能会导致 /resume 加载时报错, 因为程序会校验 JSON 的完整性结构.

---

## Run parallel Claude Code sessions with Git worktrees
并行运行带有 Git 工作树的 Claude Code 会话.

When working on multiple tasks at once, you need each Claude session to have its own copy of the codebase so changes don't collide. Git worktrees solve this by creating separate working directories that each have their own files and branch, while sharing the same repository history and remote connections. This means you can have Claude working on a feature in one worktree while fixing a bug in another, without either session interfering with the other.
当同时处理多个任务时, 你需要让每个 Claude 会话都拥有自己的代码库副本, 以避免变更冲突. Git 工作树通过创建独立的工作目录来解决这个问题, 每个工作目录都有自己的文件和分支, 同时共享相同的仓库历史记录和远程连接. 这意味着你可以让 Claude 在一个工作树中开发新功能, 同时在另一个工作树中修复 bug, 而不会互相干扰.

Use the `--worktree` (`-w`) flag to create an isolated worktree and start Claude in it. The value you pass becomes the worktree directory name and branch name:
使用 `--worktree` ( `-w` )` 标志创建一个隔离的工作树, 并在其中启动 Claude. 您传递的值将成为工作树目录名称和分支名称:

```bash
# Start Claude in a worktree named "feature-auth"
# Creates .claude/worktrees/feature-auth/ with a new branch
claude --worktree feature-auth

# Start another session in a separate worktree
claude --worktree bugfix-123
```

If you omit the name, Claude generates a random one automatically:
如果省略名称, Claude 会自动生成一个随机名称:

```bash
# Auto-generates a name like "bright-running-fox"
claude --worktree
```

Worktrees are created at `<repo>/.claude/worktrees/<name>` and branch from the default remote branch, which is where `origin/HEAD` points. The worktree branch is named `worktree-<name>`.
工作树在 `<repo>/.claude/worktrees/<name>` 创建, 并从默认远程分支(即 `origin/HEAD` 指向的位置)分支而来. 工作树分支的名称为 `worktree-<name>` .

The base branch is not configurable through a Claude Code flag or setting. `origin/HEAD` is a reference stored in your local `.git` directory that Git set once when you cloned. If the repository's default branch later changes on GitHub or GitLab, your local `origin/HEAD` keeps pointing at the old one, and worktrees will branch from there. To re-sync your local reference with whatever the remote currently considers its default:
基础分支无法通过 Claude Code 标志或设置进行配置. `origin/HEAD` 是存储在本地 `.git` 目录中的引用, Git 会在您克隆仓库时设置一次. 如果仓库的默认分支在 GitHub 或 GitLab 上发生更改, 本地的 `origin/HEAD` 仍然指向旧的分支, 工作树也会从该分支创建. 要将本地引用与远程仓库当前默认分支同步, 请执行以下操作:

```bash
git remote set-head origin -a
```

This is a standard Git command that only updates your local `.git` directory. Nothing on the remote server changes. If you want worktrees to base off a specific branch rather than the remote's default, set it explicitly with `git remote set-head origin your-branch-name`.
这是一个标准的 Git 命令, 它只会更新本地的 `.git` 目录. 远程服务器上的任何内容都不会改变. 如果您希望工作树基于特定分支而不是远程默认分支, 请使用 `git remote set-head origin your-branch-name` 显式设置.

For full control over how worktrees are created, including choosing a different base per invocation, configure a [WorktreeCreate hook](https://code.claude.com/docs/en/hooks#worktreecreate). The hook replaces Claude Code's default `git worktree` logic entirely, so you can fetch and branch from whatever ref you need.
要完全控制工作树的创建方式(包括每次调用选择不同的基类), 请配置 WorktreeCreate 钩子. 该钩子会完全替换 Claude Code 的默认 `git worktree` 逻辑, 因此您可以从所需的任何引用获取和创建分支.

You can also ask Claude to "work in a worktree" or "start a worktree" during a session, and it will create one automatically.
你也可以在会话期间要求 Claude "在工作树中工作"或"启动工作树", 它会自动创建一个工作树.

### Subagent worktrees
subagents 工作树

Subagents can also use worktree isolation to work in parallel without conflicts. Ask Claude to "use worktrees for your agents" or configure it in a [custom subagent](https://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields) by adding `isolation: worktree` to the agent's frontmatter. Each subagent gets its own worktree that is automatically cleaned up when the subagent finishes without changes.
subagents 还可以利用工作树隔离机制并行工作, 避免冲突. 您可以让 Claude "为您的代理使用工作树", 或者在自定义子代理的 frontmatter 中添加 `isolation: worktree` 来进行配置. 每个 subagents 都会拥有自己的工作树, 当 subagents 完成工作且未发生任何更改时, 工作树会自动清理.

### Worktree cleanup
工作树清理

When you exit a worktree session, Claude handles cleanup based on whether you made changes:
退出工作树会话时, Claude 会根据你是否进行了更改来处理清理工作:

- **No changes**: the worktree and its branch are removed automatically
  无需更改: 工作树及其分支将自动删除.

- **Changes or commits exist**: Claude prompts you to keep or remove the worktree. Keeping preserves the directory and branch so you can return later. Removing deletes the worktree directory and its branch, discarding all uncommitted changes and commits
  存在更改或提交: Claude 会提示您保留或删除工作树. 保留会保留目录和分支, 以便您稍后返回. 删除会删除工作树目录及其分支, 丢弃所有未提交的更改和提交.

To clean up worktrees outside of a Claude session, use [manual worktree management](https://code.claude.com/docs/en/common-workflows#manage-worktrees-manually).
要在 Claude 会话之外清理工作树, 请使用手动工作树管理.

> Add `.claude/worktrees/` to your `.gitignore` to prevent worktree contents from appearing as untracked files in your main repository.
> 将 `.claude/worktrees/` 添加到 `.gitignore` 中, 以防止工作树内容在主存储库中显示为未跟踪的文件.

### Copy gitignored files to worktrees

Git worktrees are fresh checkouts, so they don't include untracked files like `.env` or `.env.local` from your main repository. To automatically copy these files when Claude creates a worktree, add a `.worktreeinclude` file to your project root.
Git 工作树是全新的代码检出, 因此不包含主仓库中未跟踪的文件, 例如 `.env` 或 `.env.local` . 要让 Claude 在创建工作树时自动复制这些文件, 请在项目根目录添加一个 `.worktreeinclude` 文件.

The file uses `.gitignore` syntax to list which files to copy. Only files that match a pattern and are also gitignored get copied, so tracked files are never duplicated.
该文件使用 `.gitignore` 语法列出要复制的文件. 只有符合特定模式且也被添加到 .gitignore 文件中的文件才会被复制, 因此被跟踪的文件永远不会重复.

```
.env
.env.local
config/secrets.json
```

This applies to worktrees created with `--worktree`, subagent worktrees, and parallel sessions in the [desktop app](https://code.claude.com/docs/en/desktop#work-in-parallel-with-sessions).
这适用于使用 `--worktree` 创建的工作树、subagents 工作树以及桌面应用程序中的并行会话.

### Manage worktrees manually
手动管理工作树

For more control over worktree location and branch configuration, create worktrees with Git directly. This is useful when you need to check out a specific existing branch or place the worktree outside the repository.
为了更好地控制工作树的位置和分支配置, 可以直接使用 Git 创建工作树. 当您需要检出特定的现有分支或将工作树放置在代码仓库之外时, 这种方法非常有用.

```bash
# Create a worktree with a new branch
git worktree add ../project-feature-a -b feature-a

# Create a worktree with an existing branch
git worktree add ../project-bugfix bugfix-123

# Start Claude in the worktree
cd ../project-feature-a && claude

# Clean up when done
git worktree list
git worktree remove ../project-feature-a
```

Learn more in the [official Git worktree documentation](https://git-scm.com/docs/git-worktree).
更多信息请参阅 Git 官方工作树文档.

> Remember to initialize your development environment in each new worktree according to your project's setup. Depending on your stack, this might include running dependency installation (`npm install`, `yarn`), setting up virtual environments, or following your project's standard setup process.
> 请记住, 在每个新的工作树中, 都要根据项目的设置初始化开发环境. 根据你使用的技术栈, 这可能包括运行依赖安装(`npm install`、`yarn`)、设置虚拟环境, 或者遵循项目的标准设置流程.

### Non-git version control
非 Git 版本控制

Worktree isolation works with git by default. For other version control systems like SVN, Perforce, or Mercurial, configure [WorktreeCreate and WorktreeRemove hooks](https://code.claude.com/docs/en/hooks#worktreecreate) to provide custom worktree creation and cleanup logic. When configured, these hooks replace the default git behavior when you use `--worktree`, so [`.worktreeinclude`](https://code.claude.com/docs/en/common-workflows#copy-gitignored-files-to-worktrees) is not processed. Copy any local configuration files inside your hook script instead.
工作树隔离默认与 Git 配合使用. 对于其他版本控制系统(例如 SVN、Perforce 或 Mercurial), 请配置 WorktreeCreate 和 WorktreeRemove 钩子以提供自定义的工作树创建和清理逻辑. 配置后, 这些钩子会替换使用 `--worktree` 时的默认 Git 行为, 因此不会处理 `.worktreeinclude` 文件. 请将所有本地配置文件复制到钩子脚本中.

For automated coordination of parallel sessions with shared tasks and messaging, see [agent teams](https://code.claude.com/docs/en/agent-teams).
对于具有共享任务和消息传递的并行会话的自动协调, 请参阅代理团队.

---

## Get notified when Claude needs your attention
当 Claude 需要你关注时, 你会收到通知

When you kick off a long-running task and switch to another window, you can set up desktop notifications so you know when Claude finishes or needs your input. This uses the `Notification` [hook event](https://code.claude.com/docs/en/hooks-guide#get-notified-when-claude-needs-input), which fires whenever Claude is waiting for permission, idle and ready for a new prompt, or completing authentication.
当您启动一个长时间运行的任务并切换到另一个窗口时, 您可以设置桌面通知, 以便在 Claude 完成任务或需要您输入时收到通知. 此功能使用 `Notification` 钩子事件, 该事件会在 Claude 等待权限、处于空闲状态并准备好接收新提示或完成身份验证时触发.

1. Add the hook to your settings
将此钩子添加到您的设置中

Open `~/.claude/settings.json` and add a `Notification` hook that calls your platform's native notification command:
打开 `~/.claude/settings.json` , 并添加一个调用平台原生通知命令的 `Notification` 钩子:

- macOS
```
{
    "hooks": {
        "Notification": [
            {
                "matcher": "",
                "hooks": [
                    {
                        "type": "command",
                        "command": "osascript -e 'display notification \"Claude Code needs your attention\" with title \"Claude Code\"'"
                    }
                ]
            }
        ]
    }
}
```
- Linux
```
{
    "hooks": {
        "Notification": [
            {
                "matcher": "",
                "hooks": [
                    {
                        "type": "command",
                        "command": "notify-send 'Claude Code' 'Claude Code needs your attention'"
                    }
                ]
            }
        ]
    }
}
```
- Windows
```
{
    "hooks": {
        "Notification": [
            {
                "matcher": "",
                "hooks": [
                    {
                        "type": "command",
                        "command": "powershell.exe -Command \"[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Claude Code needs your attention', 'Claude Code')\""
                    }
                ]
            }
        ]
    }
}
```

If your settings file already has a `hooks` key, merge the `Notification` entry into it rather than overwriting. You can also ask Claude to write the hook for you by describing what you want in the CLI.
如果您的设置文件中已经存在 `hooks` 键, 请将 `Notification` 条目合并到其中, 而不是覆盖它. 您也可以通过在命令行界面 (CLI) 中描述您的需求, 让 Claude 为您编写 hook.

2. Optionally narrow the matcher
(可选)缩小匹配范围

By default the hook fires on all notification types. To fire only for specific events, set the `matcher` field to one of these values:
默认情况下, 该钩子会在所有通知类型上触发. 要仅在特定事件上触发, 请将 `matcher` 字段设置为以下值之一:

| Matcher              | Fires when                                                                                     |
| -------------------- | ---------------------------------------------------------------------------------------------- |
| `permission_prompt`  | Claude needs you to approve a tool use <br> Claude 需要你批准一项工具使用申请.                 |
| `idle_prompt`        | Claude is done and waiting for your next prompt <br> Claude 已经完成了, 正在等待你的下一个提示 |
| `auth_success`       | Authentication completes <br> 身份验证完成                                                     |
| `elicitation_dialog` | Claude is asking you a question <br> Claude 正在问你一个问题                                   |

3. Verify the hook
检查钩子

Type `/hooks` and select `Notification` to confirm the hook appears. Selecting it shows the command that will run. To test it end-to-end, ask Claude to run a command that requires permission and switch away from the terminal, or ask Claude to trigger a notification directly.
输入 `/hooks` 并选择 `Notification` 以确认钩子是否出现. 选择后会显示将要运行的命令. 要进行端到端测试, 请让 Claude 运行一个需要权限的命令并离开终端, 或者让 Claude 直接触发通知.

For the complete event schema and notification types, see the [Notification reference](https://code.claude.com/docs/en/hooks#notification).
有关完整的事件架构和通知类型, 请参阅通知参考.

---

## Use Claude as a unix-style utility
将 Claude 用作 Unix 风格的实用程序

### Add Claude to your verification process
将 Claude 添加到您的验证流程中

Suppose you want to use Claude Code as a linter or code reviewer.
假设你想使用 Claude Code 作为代码检查器或代码审查器.

**Add Claude to your build script: **
将 Claude 添加到您的构建脚本中:

```json
// package.json
{
    ...
    "scripts": {
        ...
        "lint:claude": "claude -p 'you are a linter. please look at the changes vs. main and report any issues related to typos. report the filename and line number on one line, and a description of the issue on the second line. do not return any other text.'"
    }
}
```

> Tips:
> - Use Claude for automated code review in your CI/CD pipeline
>   在 CI/CD 流水线中使用 Claude 进行自动化代码审查
> - Customize the prompt to check for specific issues relevant to your project
>   自定义提示, 以检查与您的项目相关的特定问题
> - Consider creating multiple scripts for different types of verification
>   考虑为不同类型的验证创建多个脚本.
>

### Pipe in, pipe out

Suppose you want to pipe data into Claude, and get back data in a structured format.
假设你想将数据输入到 Claude, 并以结构化格式获取返回的数据.

**Pipe data through Claude: **
通过 Claude 传输管道数据:

```bash
cat build-error.txt | claude -p 'concisely explain the root cause of this build error' > output.txt
```

> Tips:
> - Use pipes to integrate Claude into existing shell scripts
>   使用管道将 Claude 集成到现有的 shell 脚本中
> - Combine with other Unix tools for powerful workflows
>   与其他 Unix 工具结合使用, 可实现强大的工作流程
> - Consider using —output-format for structured output
>   考虑使用 `--output-format` 参数进行结构化输出.
>

### Control output format
控制输出格式

Suppose you need Claude's output in a specific format, especially when integrating Claude Code into scripts or other tools.
假设你需要 Claude 以特定格式输出, 尤其是在将 Claude Code 集成到脚本或其他工具中时.

1. Use text format (default)
使用文本格式(默认)

```bash
cat data.txt | claude -p 'summarize this data' --output-format text > summary.txt
```

This outputs just Claude's plain text response (default behavior).
这将仅输出 Claude 的纯文本回复(默认行为).

2. Use JSON format
使用 JSON 格式

```bash
cat code.py | claude -p 'analyze this code for bugs' --output-format json > analysis.json
```

This outputs a JSON array of messages with metadata including cost and duration.
这将输出一个 JSON 数组, 其中包含消息的元数据, 例如成本和持续时间.

3. Use streaming JSON format
使用流式 JSON 格式

```bash
cat log.txt | claude -p 'parse this log file for errors' --output-format stream-json
```

This outputs a series of JSON objects in real-time as Claude processes the request. Each message is a valid JSON object, but the entire output is not valid JSON if concatenated.
Claude 处理请求时, 会实时输出一系列 JSON 对象. 每条消息都是有效的 JSON 对象, 但如果将它们连接起来, 整个输出就不是有效的 JSON 了.

> Tips:
> - Use `--output-format text` for simple integrations where you just need Claude's response
>   对于只需要 Claude 回复的简单集成, 请使用 `--output-format text`
> - Use `--output-format json` when you need the full conversation log
>   如果需要完整的对话日志, 请使用 `--output-format json`
> - Use `--output-format stream-json` for real-time output of each conversation turn
>   使用 `--output-format stream-json` 参数可实时输出每次对话的格式.
>

---

## Run Claude on a schedule
按计划运行 Claude

Suppose you want Claude to handle a task automatically on a recurring basis, like reviewing open PRs every morning, auditing dependencies weekly, or checking for CI failures overnight.
假设您希望 Claude 定期自动处理一项任务, 例如每天早上审查未解决的 PR、每周审核依赖项或夜间检查 CI 故障.

Pick a scheduling option based on where you want the task to run:
根据任务运行地点选择合适的调度选项:

- Option: [Cloud scheduled tasks 云计划任务](https://code.claude.com/docs/en/web-scheduled-tasks)

  Where it runs: Anthropic-managed infrastructure

  Best for: Tasks that should run even when your computer is off. Configure at [claude.ai/code](https://claude.ai/code).
            即使电脑关机也应运行的任务. 请在 [claude.ai/code](https://claude.ai/code) 进行配置.

- Option: [Desktop scheduled tasks 桌面计划任务](https://code.claude.com/docs/en/desktop#schedule-recurring-tasks)

  Where it runs: Your machine, via the desktop app

  Best for: Tasks that need direct access to local files, tools, or uncommitted changes.
            需要直接访问本地文件、工具或未提交更改的任务.

- Option: [GitHub Actions](https://code.claude.com/docs/en/github-actions)

  Where it runs: Your CI pipeline

  Best for: Tasks tied to repo events like opened PRs, or cron schedules that should live alongside your workflow config.
            与仓库事件(例如已打开的 PR)或 cron 计划相关的任务应该与您的工作流配置一起存在.

- Option: [`/loop`](https://code.claude.com/docs/en/scheduled-tasks)

  Where it runs: The current CLI session
                 当前 CLI 会话

  Best for: Quick polling while a session is open. Tasks are cancelled when you exit.
            会话期间进行快速轮询. 退出时任务将被取消.

> When writing prompts for scheduled tasks, be explicit about what success looks like and what to do with results. The task runs autonomously, so it can't ask clarifying questions. For example: "Review open PRs labeled `needs-review`, leave inline comments on any issues, and post a summary in the `#eng-reviews` Slack channel."
> 为计划任务编写提示时, 务必明确说明成功标准以及如何处理结果. 任务是自动运行的, 因此无法提出澄清问题. 例如: "审核标记为 `needs-review` 未解决 PR​​, 在任何问题上留下内联评论, 并在 `#eng-reviews` Slack 频道中发布摘要."
>

---

## Ask Claude about its capabilities
问问 Claude 它的功能

Claude has built-in access to its documentation and can answer questions about its own features and limitations.
Claude 内置了对其自身文档的访问权限, 可以回答有关其自身功能和局限性的问题.

### Example questions
示例问题

```
can Claude Code create pull requests?
Claude Code 能创建拉取请求(Pull Requests)吗?
```

```
how does Claude Code handle permissions?
Claude Code 如何处理权限?
```

```
what skills are available?
有哪些可用的技能?
```

```
how do I use MCP with Claude Code?
我该如何结合 Claude Code 使用 MCP?
```

```
how do I configure Claude Code for Amazon Bedrock?
我该如何为 Amazon Bedrock 配置 Claude Code?
```

```
what are the limitations of Claude Code?
Claude Code 有哪些局限性?
```

Claude provides documentation-based answers to these questions. For executable examples and hands-on demonstrations, refer to the specific workflow sections above.
Claude 提供了基于文档的答案来解答这些问题. 如需可执行的示例和实际演示, 请参阅上文的具体工作流程部分.

> Tips:
> - Claude always has access to the latest Claude Code documentation, regardless of the version you're using
>   无论您使用的是哪个版本, Claude 始终可以访问最新的 Claude Code 文档.
> - Ask specific questions to get detailed answers
>   提出具体问题以获得详细答案
> - Claude can explain complex features like MCP integration, enterprise configurations, and advanced workflows
>   Claude 能够解释诸如 MCP 集成、企业配置和高级工作流程等复杂功能.
>

---
