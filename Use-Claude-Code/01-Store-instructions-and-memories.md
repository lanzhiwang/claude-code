# How Claude remembers your project

* https://code.claude.com/docs/en/memory

Give Claude persistent instructions with CLAUDE.md files, and let Claude accumulate learnings automatically with auto memory.
使用 CLAUDE.md 文件给 Claude 提供持久的指令, 让 Claude 通过自动记忆功能自动积累学习成果.

Each Claude Code session begins with a fresh context window. Two mechanisms carry knowledge across sessions:
每次 Claude Code 会话开始时都会打开一个全新的上下文窗口. 有两种机制可以在会话之间传递知识:

- CLAUDE.md files: instructions you write to give Claude persistent context
  CLAUDE.md 文件: 您编写的用于为 Claude 提供持久上下文的指令

- **Auto memory**: notes Claude writes itself based on your corrections and preferences
  自动记忆: Claude 会根据您的更正和偏好自动记录笔记

This page covers how to:
本页面涵盖以下操作方法:

- [Write and organize CLAUDE.md files](https://code.claude.com/docs/en/memory#claude-md-files)
  编写并整理 CLAUDE.md 文件

- [Scope rules to specific file types](https://code.claude.com/docs/en/memory#organize-rules-with-claude/rules/) with `.claude/rules/`
  使用 `.claude/rules/` 将规则范围限定于特定文件类型

- [Configure auto memory](https://code.claude.com/docs/en/memory#auto-memory) so Claude takes notes automatically
  配置自动记忆功能, 以便 Claude 自动记笔记.

- [Troubleshoot](https://code.claude.com/docs/en/memory#troubleshoot-memory-issues) when instructions aren't being followed
  当操作步骤未按说明执行时, 请进行故障排除.

## CLAUDE.md vs auto memory

Claude Code has two complementary memory systems. Both are loaded at the start of every conversation. Claude treats them as context, not enforced configuration. The more specific and concise your instructions, the more consistently Claude follows them.
Claude Code 拥有两个互补的记忆系统. 这两个系统会在每次对话开始时加载. Claude 将它们视为上下文信息, 而非强制配置. 您的指令越具体、越简洁, Claude 就越能始终如一地执行.

|                  | CLAUDE.md files                                   | Auto memory                                                      |
| ---------------- | ------------------------------------------------- | ---------------------------------------------------------------- |
| Who writes it    | You                                               | Claude                                                           |
| What it contains | Instructions and rules                            | Learnings and patterns                                           |
| Scope            | Project, user, or org                             | Per working tree                                                 |
| Loaded into      | Every session                                     | Every session (first 200 lines or 25KB)                          |
| Use for          | Coding standards, workflows, project architecture | Build commands, debugging insights, preferences Claude discovers |

Use CLAUDE.md files when you want to guide Claude's behavior. Auto memory lets Claude learn from your corrections without manual effort.
当您需要引导 Claude 的行为时, 请使用 CLAUDE.md 文件. 自动记忆功能可以让 Claude 从您的纠正中学习, 无需手动操作.

Subagents can also maintain their own auto memory. See [subagent configuration](https://code.claude.com/docs/en/sub-agents#enable-persistent-memory) for details.
subagent 还可以维护自己的自动记忆功能. 详情请参阅 subagent 配置.

## CLAUDE.md files

CLAUDE.md files are markdown files that give Claude persistent instructions for a project, your personal workflow, or your entire organization. You write these files in plain text; Claude reads them at the start of every session.
CLAUDE.md 文件是 Markdown 文件, 用于为 Claude 提供项目、个人工作流程或整个组织的持久性指令. 您可以用纯文本编写这些文件; Claude 会在每次会话开始时读取它们.

### Choose where to put CLAUDE.md files
选择 CLAUDE.md 文件的存放位置

CLAUDE.md files can live in several locations, each with a different scope. More specific locations take precedence over broader ones.
CLAUDE.md 文件可以存在于多个位置, 每个位置的作用域都不同. 更具体的位置优先于更广泛的位置.

- Scope: Managed policy
         管理策略

  Location: macOS: `/Library/Application Support/ClaudeCode/CLAUDE.md`
            Linux and WSL: `/etc/claude-code/CLAUDE.md`
            Windows: `C:\Program Files\ClaudeCode\CLAUDE.md`

  Purpose: Organization-wide instructions managed by IT/DevOps
           由 IT/DevOps 管理的全组织范围指令

  Use case examples: Company coding standards, security policies, compliance requirements
                     公司编码标准、安全策略、合规要求

  Shared with: All users in organization
               组织中的所有用户


- Scope: Project instructions
         项目说明

  Location: `./CLAUDE.md` or `./.claude/CLAUDE.md`

  Purpose: Team-shared instructions for the project
           项目团队共享指南

  Use case examples: Project architecture, coding standards, common workflows
                     项目架构、编码标准、通用工作流程

  Shared with: Team members via source control
               团队成员通过源代码控制


- Scope: User instructions
         用户说明

  Location: `~/.claude/CLAUDE.md`

  Purpose: Personal preferences for all projects
           所有项目的个人偏好

  Use case examples: Code styling preferences, personal tooling shortcuts
                     代码样式偏好设置、个人工具快捷键

  Shared with: Just you (all projects)
               只有你(所有项目)

CLAUDE.md files in the directory hierarchy above the working directory are loaded in full at launch. CLAUDE.md files in subdirectories load on demand when Claude reads files in those directories. See [How CLAUDE.md files load](https://code.claude.com/docs/en/memory#how-claude-md-files-load) for the full resolution order.
工作目录上一级目录层级中的 CLAUDE.md 文件会在启动时完整加载. 子目录中的 CLAUDE.md 文件会在 Claude 读取这些目录中的文件时按需加载. 有关完整的加载顺序, 请参阅 "CLAUDE.md 文件加载方式".

For large projects, you can break instructions into topic-specific files using [project rules](https://code.claude.com/docs/en/memory#organize-rules-with-claude/rules/). Rules let you scope instructions to specific file types or subdirectories.
对于大型项目, 您可以使用项目规则将指令拆分成特定主题的文件. 规则允许您将指令限定在特定的文件类型或子目录中.

### Set up a project CLAUDE.md
设置项目 CLAUDE.md

A project CLAUDE.md can be stored in either `./CLAUDE.md` or `./.claude/CLAUDE.md`. Create this file and add instructions that apply to anyone working on the project: build and test commands, coding standards, architectural decisions, naming conventions, and common workflows. These instructions are shared with your team through version control, so focus on project-level standards rather than personal preferences.
项目 CLAUDE.md 文件可以存储在 `./CLAUDE.md` 或 `./.claude/CLAUDE.md` 目录下. 创建此文件并添加适用于所有项目参与者的说明: 构建和测试命令、编码规范、架构决策、命名约定和常用工作流程. 这些说明将通过版本控制系统与团队共享, 因此请重点关注项目层面的标准, 而非个人偏好.

> Run `/init` to generate a starting CLAUDE.md automatically. Claude analyzes your codebase and creates a file with build commands, test instructions, and project conventions it discovers. If a CLAUDE.md already exists, `/init` suggests improvements rather than overwriting it. Refine from there with instructions Claude wouldn't discover on its own.
> 运行 `/init` 可自动生成初始的 CLAUDE.md 文件. Claude 会分析您的代码库, 并创建一个包含构建命令、测试说明和项目规范的文件. 如果 CLAUDE.md 文件已存在, `/init` 命令会建议改进, 而不是覆盖它. 您可以根据 Claude 自行无法发现的说明, 进一步完善该文件.
> Set `CLAUDE_CODE_NEW_INIT=true` to enable an interactive multi-phase flow. `/init` asks which artifacts to set up: CLAUDE.md files, skills, and hooks. It then explores your codebase with a subagent, fills in gaps via follow-up questions, and presents a reviewable proposal before writing any files.
> 设置 `CLAUDE_CODE_NEW_INIT=true` 以启用交互式多阶段流程. `/init` 会询问要设置哪些工件: CLAUDE.md 文件、技能和钩子. 然后, 它会使用 subagent 探索您的代码库, 通过后续问题填补空白, 并在编写任何文件之前提供可审查的提案.
>

### Write effective instructions
编写有效的说明

CLAUDE.md files are loaded into the context window at the start of every session, consuming tokens alongside your conversation. The [context window visualization](https://code.claude.com/docs/en/context-window) shows where CLAUDE.md loads relative to the rest of the startup context. Because they're context rather than enforced configuration, how you write instructions affects how reliably Claude follows them. Specific, concise, well-structured instructions work best.
CLAUDE.md 文件会在每次会话开始时加载到上下文窗口中, 并在您的对话过程中使用 tokens. 上下文窗口可视化界面会显示 CLAUDE.md 相对于启动上下文其他部分的加载位置. 由于它们是上下文相关而非强制配置, 因此您编写指令的方式会影响 Claude 执行指令的可靠性. 具体、简洁、结构良好的指令效果最佳.

**Size**: target under 200 lines per CLAUDE.md file. Longer files consume more context and reduce adherence. If your instructions are growing large, split them using [imports](https://code.claude.com/docs/en/memory#import-additional-files) or [`.claude/rules/`](https://code.claude.com/docs/en/memory#organize-rules-with-claude/rules/) files.
大小: 每个 CLAUDE.md 文件的目标行数不超过 200 行. 过长的文件会引入更多上下文信息, 降低用户遵循文档的意愿. 如果您的说明文档过多, 请使用导入语句或 `.claude/rules/` 文件进行拆分.

**Structure**: use markdown headers and bullets to group related instructions. Claude scans structure the same way readers do: organized sections are easier to follow than dense paragraphs.
结构: 使用 Markdown 标题和项目符号将相关说明分组. Claude 浏览结构的方式与读者相同: 组织有序的章节比密集的段落更容易理解.

**Specificity**: write instructions that are concrete enough to verify. For example:
具体性: 编写足够具体的指令, 以便进行验证. 例如:

- "Use 2-space indentation" instead of "Format code properly"
  请 "使用 2 个空格缩进" 代替 "正确格式化代码".

- "Run `npm test` before committing" instead of "Test your changes"
  用 "提交前运行 `npm test`" 代替 "测试你的更改"

- "API handlers live in `src/api/handlers/`" instead of "Keep files organized"
  请使用 "API 处理程序位于 `src/api/handlers/` 下" 而不是 "保持文件组织有序".

**Consistency**: if two rules contradict each other, Claude may pick one arbitrarily. Review your CLAUDE.md files, nested CLAUDE.md files in subdirectories, and [`.claude/rules/`](https://code.claude.com/docs/en/memory#organize-rules-with-claude/rules/) periodically to remove outdated or conflicting instructions. In monorepos, use [`claudeMdExcludes`](https://code.claude.com/docs/en/memory#exclude-specific-claude-md-files) to skip CLAUDE.md files from other teams that aren't relevant to your work.
一致性: 如果两条规则相互矛盾, Claude 可以任意选择一条. 请定期检查您的 CLAUDE.md 文件、子目录中嵌套的 CLAUDE.md 文件以及 `.claude/rules/` 以删除过时或冲突的指令. 在单体仓库中, 请使用 `claudeMdExcludes 来排除其他团队与您的工作无关的 CLAUDE.md 文件.

### Import additional files

CLAUDE.md files can import additional files using `@path/to/import` syntax. Imported files are expanded and loaded into context at launch alongside the CLAUDE.md that references them.
CLAUDE.md 文件可以使用 `@path/to/import` 语法导入其他文件. 导入的文件会在启动时展开并与引用它们的 CLAUDE.md 文件一起加载到上下文中.

Both relative and absolute paths are allowed. Relative paths resolve relative to the file containing the import, not the working directory. Imported files can recursively import other files, with a maximum depth of five hops.
允许使用相对路径和绝对路径. 相对路径相对于包含导入内容的文件, 而不是相对于当前工作目录. 导入的文件可以递归地导入其他文件, 最大深度为五层.

To pull in a README, package.json, and a workflow guide, reference them with `@` syntax anywhere in your CLAUDE.md:
要在 CLAUDE.md 中引入 README、package.json 和工作流程指南, 请在任意位置使用 `@` 语法引用它们:

```
See @README for project overview and @package.json for available npm commands for this project.
请参阅 `@README` 获取项目概览, 参阅 `@package.json` 了解本项目可用的 npm 命令.

# Additional Instructions
补充说明
- git workflow @docs/git-instructions.md
Git 工作流: @docs/git-instructions.md
```

For personal preferences you don't want to check in, import a file from your home directory. The import goes in the shared CLAUDE.md, but the file it points to stays on your machine:
如果您不想签入任何个人偏好设置, 可以从您的主目录导入一个文件. 导入的内容会添加到共享的 CLAUDE.md 文件中, 但它指向的文件仍保留在您的计算机上:

```
# Individual Preferences
个人偏好
- @~/.claude/my-project-instructions.md
```

> The first time Claude Code encounters external imports in a project, it shows an approval dialog listing the files. If you decline, the imports stay disabled and the dialog does not appear again.
> Claude Code 首次在项目中遇到外部导入时, 会显示一个列出文件的审批对话框. 如果拒绝, 导入功能将保持禁用状态, 并且该对话框不会再次出现.
>

For a more structured approach to organizing instructions, see [`.claude/rules/`](https://code.claude.com/docs/en/memory#organize-rules-with-claude/rules/).
要了解更结构化的指令组织方法, 请参阅 `.claude/rules/`.

### AGENTS.md

Claude Code reads `CLAUDE.md`, not `AGENTS.md`. If your repository already uses `AGENTS.md` for other coding agents, create a `CLAUDE.md` that imports it so both tools read the same instructions without duplicating them. You can also add Claude-specific instructions below the import. Claude loads the imported file at session start, then appends the rest:
Claude Code 读取的是 `CLAUDE.md`, 而不是 `AGENTS.md`. 如果您的代码库已经使用 `AGENTS.md` 来管理其他编码代理, 请创建一个 `CLAUDE.md` 文件来导入 AGENTS.md, 这样两个工具就可以读取相同的指令, 避免重复. 您还可以在导入语句下方添加 Claude 特有的指令. Claude 会在会话开始时加载导入的文件, 然后追加其余内容:

```CLAUDE.md
@AGENTS.md

## Claude Code

Use plan mode for changes under `src/billing/`.
```

### How CLAUDE.md files load
CLAUDE.md 文件如何加载

Claude Code reads CLAUDE.md files by walking up the directory tree from your current working directory, checking each directory along the way. This means if you run Claude Code in `foo/bar/`, it loads instructions from both `foo/bar/CLAUDE.md` and `foo/CLAUDE.md`.
Claude Code 读取 CLAUDE.md 文件的方式是从当前工作目录向上遍历目录树, 并检查沿途的每个目录. 这意味着, 如果您在 `foo/bar/` 下运行 Claude Code, 它会同时加载 `foo/bar/CLAUDE.md` 和 `foo/CLAUDE.md` 中的指令.

Claude also discovers CLAUDE.md files in subdirectories under your current working directory. Instead of loading them at launch, they are included when Claude reads files in those subdirectories.
Claude 还会发现当前工作目录下的子目录中的 CLAUDE.md 文件. 这些文件不会在启动时加载, 而是在 Claude 读取这些子目录中的文件时才被包含进来.

If you work in a large monorepo where other teams' CLAUDE.md files get picked up, use [`claudeMdExcludes`](https://code.claude.com/docs/en/memory#exclude-specific-claude-md-files) to skip them.
如果你在一个大型单体仓库中工作, 其中其他团队的 CLAUDE.md 文件会被提取出来, 请使用 `claudeMdExcludes` 跳过它们.

Block-level HTML comments (`<!-- maintainer notes -->`) in CLAUDE.md files are stripped before the content is injected into Claude's context. Use them to leave notes for human maintainers without spending context tokens on them. Comments inside code blocks are preserved. When you open a CLAUDE.md file directly with the Read tool, comments remain visible.
CLAUDE.md 文件中的块级 HTML 注释(`<!-- maintainer notes -->`)会在内容注入 Claude 上下文之前被移除. 您可以利用这些注释给人工维护者留下说明, 而无需消耗上下文 tokens. 代码块内的注释则会被保留. 当您使用读取工具直接打开 CLAUDE.md 文件时, 注释仍然可见.

#### Load from additional directories
从其他目录加载

The `--add-dir` flag gives Claude access to additional directories outside your main working directory. By default, CLAUDE.md files from these directories are not loaded.
`--add-dir` 标志允许 Claude 访问主工作目录之外的其他目录. 默认情况下, 这些目录中的 CLAUDE.md 文件不会被加载.

To also load CLAUDE.md files from additional directories, including `CLAUDE.md`, `.claude/CLAUDE.md`, and `.claude/rules/*.md`, set the `CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD` environment variable:
要从其他目录加载 CLAUDE.md 文件, 包括 `CLAUDE.md`、`.claude/CLAUDE.md` 和 `.claude/rules/*.md`, 请设置 `CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD` 环境变量:

```bash
CLAUDE_CODE_ADDITIONAL_DIRECTORIES_CLAUDE_MD=1 claude --add-dir ../shared-config
```

### Organize rules with `.claude/rules/`
使用 `.claude/rules/` 组织规则

For larger projects, you can organize instructions into multiple files using the `.claude/rules/` directory. This keeps instructions modular and easier for teams to maintain. Rules can also be [scoped to specific file paths](https://code.claude.com/docs/en/memory#path-specific-rules), so they only load into context when Claude works with matching files, reducing noise and saving context space.
对于大型项目, 您可以使用 `.claude/rules/` 目录将指令组织成多个文件. 这样可以保持指令的模块化, 便于团队维护. 规则还可以限定到特定的文件路径, 这样它们仅在 Claude 处理匹配的文件时才会加载, 从而减少冗余信息并节省上下文空间.

> Rules load into context every session or when matching files are opened. For task-specific instructions that don't need to be in context all the time, use [skills](https://code.claude.com/docs/en/skills) instead, which only load when you invoke them or when Claude determines they're relevant to your prompt.
> 规则会在每次会话或打开匹配文件时加载到上下文中. 对于不需要始终处于上下文中的特定任务指令, 请改用技能, 技能仅在您调用它们或 Claude 确定它们与您的提示相关时加载.
>

#### Set up rules
设置规则

Place markdown files in your project's `.claude/rules/` directory. Each file should cover one topic, with a descriptive filename like `testing.md` or `api-design.md`. All `.md` files are discovered recursively, so you can organize rules into subdirectories like `frontend/` or `backend/`:
将 Markdown 文件放在项目的 `.claude/rules/` 目录中. 每个文件应涵盖一个主题, 并使用描述性的文件名, 例如 `testing.md` 或 `api-design.md`. 所有 `.md` 文件都会递归查找, 因此您可以将规则组织到子目录中, 例如 `frontend/` 或 `backend/`.

```bash
your-project/
├── .claude/
│    ├── CLAUDE.md           # Main project instructions
│    └── rules/
│        ├── code-style.md   # Code style guidelines
│        ├── testing.md      # Testing conventions
│        └── security.md     # Security requirements
```

Rules without [`paths` frontmatter](https://code.claude.com/docs/en/memory#path-specific-rules) are loaded at launch with the same priority as `.claude/CLAUDE.md`.
没有 `paths` 前缀的规则在启动时以与 `.claude/CLAUDE.md` 相同的优先级加载.

#### Path-specific rules
路径特定规则

Rules can be scoped to specific files using YAML frontmatter with the `paths` field. These conditional rules only apply when Claude is working with files matching the specified patterns.
可以使用 YAML 前置元数据中的 `paths` 字段将规则限定于特定文件. 这些条件规则仅在 Claude 处理符合指定模式的文件时生效.

```
---
paths:
  - "src/api/**/*.ts"
---

# API Development Rules

- All API endpoints must include input validation
- Use the standard error response format
- Include OpenAPI documentation comments
```

Rules without a `paths` field are loaded unconditionally and apply to all files. Path-scoped rules trigger when Claude reads files matching the pattern, not on every tool use.
不包含 `paths` 字段的规则会无条件加载并应用于所有文件. 路径作用域规则会在 Claude 读取到与模式匹配的文件时触发, 而不是每次工具调用时都触发.

Use glob patterns in the `paths` field to match files by extension, directory, or any combination:
在 `paths` 字段中使用 glob 模式, 可以按扩展名、目录或任意组合匹配文件:

| Pattern                | Matches                                                                     |
| ---------------------- | --------------------------------------------------------------------------- |
| `**/*.ts`              | All TypeScript files in any directory <br> 任何目录中的所有 TypeScript 文件 |
| `src/**/*`             | All files under `src/` directory <br> `src/` 目录下的所有文件               |
| `*.md`                 | Markdown files in the project root <br> 项目根目录中的 Markdown 文件        |
| `src/components/*.tsx` | React components in a specific directory <br> 特定目录中的 React 组件       |

You can specify multiple patterns and use brace expansion to match multiple extensions in one pattern:
您可以指定多个模式, 并使用花括号扩展来匹配一个模式中的多个扩展名:

```
---
paths:
  - "src/**/*.{ts,tsx}"
  - "lib/**/*.ts"
  - "tests/**/*.test.ts"
---
```

#### Share rules across projects with symlinks
使用符号链接在项目间共享规则

The `.claude/rules/` directory supports symlinks, so you can maintain a shared set of rules and link them into multiple projects. Symlinks are resolved and loaded normally, and circular symlinks are detected and handled gracefully.
`.claude/rules/` 目录支持符号链接, 因此您可以维护一套共享的规则并将其链接到多个项目中. 符号链接会正常解析和加载, 循环符号链接也会被检测并妥善处理.

This example links both a shared directory and an individual file:
此示例同时链接了共享目录和单个文件:

```bash
ln -s ~/shared-claude-rules .claude/rules/shared
ln -s ~/company-standards/security.md .claude/rules/security.md
```

#### User-level rules
用户级规则

Personal rules in `~/.claude/rules/` apply to every project on your machine. Use them for preferences that aren't project-specific:
`~/.claude/rules/` 中的个人规则适用于您计算机上的所有项目. 您可以使用它们来设置与项目无关的偏好设置:

```bash
~/.claude/rules/
    ├── preferences.md    # Your personal coding preferences
    └── workflows.md      # Your preferred workflows
```

User-level rules are loaded before project rules, giving project rules higher priority.
用户级规则在项目规则之前加载, 因此项目规则具有更高的优先级.

### Manage CLAUDE.md for large teams
管理大型团队的 CLAUDE.md 文件

For organizations deploying Claude Code across teams, you can centralize instructions and control which CLAUDE.md files are loaded.
对于在团队中部署 Claude Code 的组织, 您可以集中管理指令并控制加载哪些 CLAUDE.md 文件.

#### Deploy organization-wide CLAUDE.md
在组织范围内部署 CLAUDE.md

Organizations can deploy a centrally managed CLAUDE.md that applies to all users on a machine. This file cannot be excluded by individual settings.
组织可以部署一个集中管理的 CLAUDE.md 文件, 该文件适用于计算机上的所有用户. 此文件无法通过单个设置排除.

1. Create the file at the managed policy location
在托管策略位置创建文件

    - macOS: `/Library/Application Support/ClaudeCode/CLAUDE.md`
    - Linux and WSL: `/etc/claude-code/CLAUDE.md`
    - Windows: `C:\Program Files\ClaudeCode\CLAUDE.md`

2. Deploy with your configuration management system
使用配置管理系统进行部署

    Use MDM, Group Policy, Ansible, or similar tools to distribute the file across developer machines. See [managed settings](https://code.claude.com/docs/en/permissions#managed-settings) for other organization-wide configuration options.
    使用 MDM、组策略、Ansible 或类似工具将文件分发到开发人员的计算机上. 有关其他组织范围的配置选项, 请参阅托管设置.

A managed CLAUDE.md and [managed settings](https://code.claude.com/docs/en/settings#settings-files) serve different purposes. Use settings for technical enforcement and CLAUDE.md for behavioral guidance:
受管理的 CLAUDE.md 文件和受管理的设置用途不同. 使用设置进行技术强制执行, 而使用 CLAUDE.md 文件进行行为指导:

| Concern                                                                         | Configure in                                              |
| ------------------------------------------------------------------------------- | --------------------------------------------------------- |
| Block specific tools, commands, or file paths <br> 阻止特定工具、命令或文件路径 | Managed settings: `permissions.deny`                      |
| Enforce sandbox isolation <br> 强制执行沙箱隔离                                 | Managed settings: `sandbox.enabled`                       |
| Environment variables and API provider routing <br> 环境变量和 API 提供程序路由 | Managed settings: `env`                                   |
| Authentication method and organization lock <br> 身份验证方法和组织锁定         | Managed settings: `forceLoginMethod`, `forceLoginOrgUUID` |
| Code style and quality guidelines <br> 代码风格和质量指南                       | Managed CLAUDE.md                                         |
| Data handling and compliance reminders <br> 数据处理和合规性提醒                | Managed CLAUDE.md                                         |
| Behavioral instructions for Claude <br> Claude 的行为指导                       | Managed CLAUDE.md                                         |

Settings rules are enforced by the client regardless of what Claude decides to do. CLAUDE.md instructions shape Claude's behavior but are not a hard enforcement layer.
无论 Claude 做出何种决定, 客户端都会强制执行设置规则. CLAUDE.md 指令会影响 Claude 的行为, 但并非强制执行层.

#### Exclude specific CLAUDE.md files
排除特定的 CLAUDE.md 文件

In large monorepos, ancestor CLAUDE.md files may contain instructions that aren't relevant to your work. The `claudeMdExcludes` setting lets you skip specific files by path or glob pattern.
在大型单体仓库中, 祖先 CLAUDE.md 文件可能包含与您的工作无关的指令. claudeMdExcludes 设置允许您按路径或 glob 模式跳过特定 `claudeMdExcludes`.

This example excludes a top-level CLAUDE.md and a rules directory from a parent folder. Add it to `.claude/settings.local.json` so the exclusion stays local to your machine:
此示例排除了顶级目录下的 CLAUDE.md 文件和父文件夹中的 rules 目录. 将其添加到 `.claude/settings.local.json` 中, 以便排除项仅在您的计算机上生效:

```json
{
    "claudeMdExcludes": [
        "**/monorepo/CLAUDE.md",
        "/home/user/monorepo/other-team/.claude/rules/**"
    ]
}
```

Patterns are matched against absolute file paths using glob syntax. You can configure `claudeMdExcludes` at any [settings layer](https://code.claude.com/docs/en/settings#settings-files): user, project, local, or managed policy. Arrays merge across layers.
使用 glob 语法将模式与绝对文件路径进行匹配. 您可以在任何设置层 (用户、项目、本地或托管策略)配置 `claudeMdExcludes`. 数组会在各层之间合并.

Managed policy CLAUDE.md files cannot be excluded. This ensures organization-wide instructions always apply regardless of individual settings.
受管策略 CLAUDE.md 文件无法排除. 这确保了无论个人设置如何, 组织范围内的指令始终适用.

## Auto memory

Auto memory lets Claude accumulate knowledge across sessions without you writing anything. Claude saves notes for itself as it works: build commands, debugging insights, architecture notes, code style preferences, and workflow habits. Claude doesn't save something every session. It decides what's worth remembering based on whether the information would be useful in a future conversation.
自动记忆功能让 Claude 能够在会话期间自动积累知识, 无需您手动输入任何内容. Claude 会在运行过程中自动保存笔记: 构建命令、调试心得、架构说明、代码风格偏好和工作流程习惯. Claude 并非每次会话都保存内容, 而是根据信息在未来对话中的潜在用途来决定哪些内容值得记住.

> Auto memory requires Claude Code v2.1.59 or later. Check your version with `claude --version`.
> 自动内存需要 Claude Code v2.1.59 或更高版本. 使用 `claude --version` 检查您的版本.
>

### Enable or disable auto memory
启用或禁用自动记忆

Auto memory is on by default. To toggle it, open `/memory` in a session and use the auto memory toggle, or set `autoMemoryEnabled` in your project settings:
自动内存默认开启. 要切换此功能, 请在会话中打开 `/memory` 并使用自动内存切换开关, 或在项目设置中启用 `autoMemoryEnabled`:

```json
{
    "autoMemoryEnabled": false
}
```

To disable auto memory via environment variable, set `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1`.
要通过环境变量禁用自动内存, 请设置 `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1`.

### Storage location

Each project gets its own memory directory at `~/.claude/projects/<project>/memory/`. The `<project>` path is derived from the git repository, so all worktrees and subdirectories within the same repo share one auto memory directory. Outside a git repo, the project root is used instead.
每个项目在 `~/.claude/projects/<project>/memory/` 处都有自己的内存目录. `<project>` 路径源自 Git 仓库, 因此同一仓库内的所有工作树和子目录共享同一个自动生成的内存目录. 在 Git 仓库之外, 则使用项目根目录.

To store auto memory in a different location, set `autoMemoryDirectory` in your user or local settings:
要将自动内存存储在其他位置, 请在用户或本地设置中设置 `autoMemoryDirectory`:

```json
{
    "autoMemoryDirectory": "~/my-custom-memory-dir"
}
```

This setting is accepted from policy, local, and user settings. It is not accepted from project settings (`.claude/settings.json`) to prevent a shared project from redirecting auto memory writes to sensitive locations.
此设置可在策略、本地和用户设置中进行配置. 但项目设置(`.claude/settings.json`)中不允许进行此配置, 以防止共享项目将自动内存写入重定向到敏感位置.

The directory contains a `MEMORY.md` entrypoint and optional topic files:
该目录包含一个 `MEMORY.md` 入口点和可选的主题文件:

```bash
~/.claude/projects/<project>/memory/
    ├── MEMORY.md          # Concise index, loaded into every session  精简索引, 加载至每个会话
    ├── debugging.md       # Detailed notes on debugging patterns  关于调试模式的详细笔记
    ├── api-conventions.md # API design decisions  API 设计决策
    └── ...                # Any other topic files Claude creates  Claude 创建的任何其他主题文件
```

`MEMORY.md` acts as an index of the memory directory. Claude reads and writes files in this directory throughout your session, using `MEMORY.md` to keep track of what's stored where.
`MEMORY.md` 充当内存目录的索引. 在整个会话期间, Claude 会读取和写入此目录中的文件, 并使用 `MEMORY.md` 来跟踪文件存储的位置.

Auto memory is machine-local. All worktrees and subdirectories within the same git repository share one auto memory directory. Files are not shared across machines or cloud environments.
自动内存管理仅限于本地机器. 同一 Git 仓库内的所有工作树和子目录共享同一个自动内存目录. 文件不会跨机器或云环境共享.

### How it works

The first 200 lines of `MEMORY.md`, or the first 25KB, whichever comes first, are loaded at the start of every conversation. Content beyond that threshold is not loaded at session start. Claude keeps `MEMORY.md` concise by moving detailed notes into separate topic files.
每次对话开始时, 都会加载 `MEMORY.md` 文件的前 200 行或前 25KB(以先到者为准). 超出此范围的内容不会在会话开始时加载. Claude 将详细笔记移至单独的主题文件中, 以保持 `MEMORY.md` 简洁性.

This limit applies only to `MEMORY.md`. CLAUDE.md files are loaded in full regardless of length, though shorter files produce better adherence.
此限制仅适用于 `MEMORY.md` 文件. CLAUDE.md 文件无论长度如何都会完整加载, 但较短的文件能带来更好的兼容性.

Topic files like `debugging.md` or `patterns.md` are not loaded at startup. Claude reads them on demand using its standard file tools when it needs the information.
诸如 `debugging.md` 或 `patterns.md` 之类的主题文件不会在启动时加载. Claude 会在需要这些信息时, 使用其标准文件工具按需读取这些文件.

Claude reads and writes memory files during your session. When you see "Writing memory" or "Recalled memory" in the Claude Code interface, Claude is actively updating or reading from `~/.claude/projects/<project>/memory/`.
在会话期间, Claude 会读取和写入内存文件. 当您在 Claude 代码界面看到"正在写入内存"或"已调用内存"时, 表示 Claude 正在更新或读取 `~/.claude/projects/<project>/memory/`.

### Audit and edit your memory
审核并编辑你的记忆

Auto memory files are plain markdown you can edit or delete at any time. Run [`/memory`](https://code.claude.com/docs/en/memory#view-and-edit-with-memory) to browse and open memory files from within a session.
自动记忆文件是纯 Markdown 格式, 您可以随时编辑或删除. 运行 `/memory` 即可在会话中浏览和打开记忆文件.

## View and edit with `/memory`
使用 `/memory` 查看和编辑

The `/memory` command lists all CLAUDE.md and rules files loaded in your current session, lets you toggle auto memory on or off, and provides a link to open the auto memory folder. Select any file to open it in your editor.
`/memory` 命令会列出当前会话中加载的所有 CLAUDE.md 文件和规则文件, 允许您启用或禁用自动记忆功能, 并提供一个链接以打开自动记忆文件夹. 选择任意文件即可在编辑器中打开它.

When you ask Claude to remember something, like "always use pnpm, not npm" or "remember that the API tests require a local Redis instance," Claude saves it to auto memory. To add instructions to CLAUDE.md instead, ask Claude directly, like "add this to CLAUDE.md," or edit the file yourself via `/memory`.
当你让 Claude 记住某些内容时, 例如"始终使用 pnpm, 而不是 npm"或"记住 API 测试需要本地 Redis 实例", Claude 会将其保存到自动记忆中. 要将指令添加到 CLAUDE.md 文件中, 可以直接告诉 Claude, 例如"将此添加到 CLAUDE.md", 或者通过 `/memory` 手动编辑该文件.

## Troubleshoot memory issues
排查内存问题

These are the most common issues with CLAUDE.md and auto memory, along with steps to debug them.
以下是 CLAUDE.md 和自动内存最常见的问题, 以及调试步骤.

### Claude isn't following my CLAUDE.md
Claude 没有遵循我的 CLAUDE.md 文件

CLAUDE.md content is delivered as a user message after the system prompt, not as part of the system prompt itself. Claude reads it and tries to follow it, but there's no guarantee of strict compliance, especially for vague or conflicting instructions.
CLAUDE.md 的内容会在系统提示后以用户消息的形式显示, 而不是作为系统提示的一部分. Claude 会读取并尝试执行该消息, 但无法保证完全遵循, 尤其是在指令模糊或相互矛盾的情况下.

To debug:

- Run `/memory` to verify your CLAUDE.md files are being loaded. If a file isn't listed, Claude can't see it.
  运行 `/memory` 来验证 CLAUDE.md 文件是否已加载. 如果某个文件未列出, 则 Claude 无法识别它.

- Check that the relevant CLAUDE.md is in a location that gets loaded for your session (see [Choose where to put CLAUDE.md files](https://code.claude.com/docs/en/memory#choose-where-to-put-claude-md-files)).
  检查相关的 CLAUDE.md 文件是否位于会话加载的位置(请参阅 "选择 CLAUDE.md 文件放置位置").

- Make instructions more specific. "Use 2-space indentation" works better than "format code nicely."
  说明要更具体. "使用两个空格缩进"比"格式化代码"效果更好.

- Look for conflicting instructions across CLAUDE.md files. If two files give different guidance for the same behavior, Claude may pick one arbitrarily.
  检查 CLAUDE.md 文件中是否存在相互冲突的指令. 如果两个文件对同一行为给出了不同的指导, Claude 可能会任意选择其中一个.

For instructions you want at the system prompt level, use [`--append-system-prompt`](https://code.claude.com/docs/en/cli-reference#system-prompt-flags). This must be passed every invocation, so it's better suited to scripts and automation than interactive use.
如果要在系统提示符级别执行指令, 请使用 `--append-system-prompt`. 每次调用都必须传递此参数, 因此它更适合脚本和自动化, 而不是交互式使用.

> Use the [`InstructionsLoaded` hook](https://code.claude.com/docs/en/hooks#instructionsloaded) to log exactly which instruction files are loaded, when they load, and why. This is useful for debugging path-specific rules or lazy-loaded files in subdirectories.
> 使用 `InstructionsLoaded` 钩子可以准确记录加载了哪些指令文件、何时加载以及加载原因. 这对于调试特定路径的规则或子目录中的延迟加载文件非常有用.
>

### I don't know what auto memory saved
我不知道自动保存了什么内存.

Run `/memory` and select the auto memory folder to browse what Claude has saved. Everything is plain markdown you can read, edit, or delete.
运行 `/memory` 并选择自动保存文件夹, 即可浏览 Claude 保存的内容. 所有内容都是纯 Markdown 格式, 您可以阅读、编辑或删除.

### My CLAUDE.md is too large
我的 CLAUDE.md 文件太大了.

Files over 200 lines consume more context and may reduce adherence. Move detailed content into separate files referenced with `@path` imports (see [Import additional files](https://code.claude.com/docs/en/memory#import-additional-files)), or split your instructions across `.claude/rules/` files.
超过 200 行的文件会占用更多上下文信息, 可能会降低用户遵守规则的程度. 请将详细内容移至单独的文件中, 并使用 `@path` 导入语句进行引用(参见 "导入其他文件"), 或者将说明拆分到多个 `.claude/rules/` 文件中.

### Instructions seem lost after `/compact`
`/compact` 后指令似乎丢失了.

CLAUDE.md fully survives compaction. After `/compact`, Claude re-reads your CLAUDE.md from disk and re-injects it fresh into the session. If an instruction disappeared after compaction, it was given only in conversation, not written to CLAUDE.md. Add it to CLAUDE.md to make it persist across sessions.
CLAUDE.md 文件在压缩后仍然完整保留. 执行 `/compact` 后, Claude 会从磁盘重新读取 CLAUDE.md 文件并将其重新注入到会话中. 如果压缩后某个指令消失了, 说明该指令仅在会话中发出, 并未写入 CLAUDE.md 文件. 请将其添加到 CLAUDE.md 文件中, 使其在会话间保持有效.

See [Write effective instructions](https://code.claude.com/docs/en/memory#write-effective-instructions) for guidance on size, structure, and specificity.
有关大小、结构和具体性的指导, 请参阅 "编写有效的说明".
