# Create plugins

* https://code.claude.com/docs/en/plugins

Create custom plugins to extend Claude Code with skills, agents, hooks, and MCP servers.

Plugins let you extend Claude Code with custom functionality that can be shared across projects and teams. This guide covers creating your own plugins with skills, agents, hooks, and MCP servers.
插件允许您使用自定义功能扩展 Claude Code, 这些功能可以在项目和团队之间共享. 本指南涵盖如何使用技能、代理、钩子和 MCP 服务器创建您自己的插件.

Looking to install existing plugins? See [Discover and install plugins](https://code.claude.com/docs/en/discover-plugins). For complete technical specifications, see [Plugins reference](https://code.claude.com/docs/en/plugins-reference).
想要安装现有插件? 请参阅 ["发现并安装插件"](https://code.claude.com/docs/en/discover-plugins). 有关完整的技术规格, 请参阅 ["插件参考"](https://code.claude.com/docs/en/plugins-reference).

## When to use plugins vs standalone configuration
何时使用插件, 何时使用独立配置

Claude Code supports two ways to add custom skills, agents, and hooks:
Claude Code 支持两种添加自定义技能、代理和钩子的方法:

| Approach                                                    | Skill names          | Best for                                                                                                                                                |
| ----------------------------------------------------------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Standalone** (`.claude/` directory)                       | `/hello`             | Personal workflows, project-specific customizations, quick experiments <br> 个性化工作流程、项目专属定制、快速实验                                      |
| **Plugins** (directories with `.claude-plugin/plugin.json`) | `/plugin-name:hello` | Sharing with teammates, distributing to community, versioned releases, reusable across projects <br> 与团队成员共享、分发到社区、版本化发布、跨项目重用 |

**Use standalone configuration when**:
何时使用独立配置:

- You're customizing Claude Code for a single project
  您正在为单个项目自定义 Claude Code

- The configuration is personal and doesn't need to be shared
  此配置属于个人设置, 无需共享.

- You're experimenting with skills or hooks before packaging them
  你正在尝试不同的技巧或钩子, 然后再把它们打包出售.

- You want short skill names like `/hello` or `/deploy`
  你需要像 `/hello` 或 `/deploy` 这样简短的技能名称.

**Use plugins when**:
何时使用插件:

- You want to share functionality with your team or community
  你想与你的团队或社区共享功能

- You need the same skills/agents across multiple projects
  多个项目都需要相同的技能/人员

- You want version control and easy updates for your extensions
  您希望扩展程序拥有版本控制和便捷的更新功能

- You're distributing through a marketplace
  你正在通过市场进行分销

- You're okay with namespaced skills like `/my-plugin:hello` (namespacing prevents conflicts between plugins)
  您是否接受类似 `/my-plugin:hello` 这样的命名空间技能(命名空间可以防止插件之间发生冲突)?

> Start with standalone configuration in `.claude/` for quick iteration, then [convert to a plugin](https://code.claude.com/docs/en/plugins#convert-existing-configurations-to-plugins) when you're ready to share.
> 首先在 `.claude/` 中进行独立配置, 以便快速迭代, 然后在准备好共享时[将其转换为插件](https://code.claude.com/docs/en/plugins#convert-existing-configurations-to-plugins).
>

## Quickstart

This quickstart walks you through creating a plugin with a custom skill. You'll create a manifest (the configuration file that defines your plugin), add a skill, and test it locally using the `--plugin-dir` flag.
本快速入门指南将引导您创建一个包含自定义技能的插件. 您将创建一个清单文件(定义插件的配置文件), 添加一个技能, 并使用 `--plugin-dir` 标志在本地进行测试.

### Prerequisites

- Claude Code [installed and authenticated](https://code.claude.com/docs/en/quickstart#step-1-install-claude-code)

> If you don't see the `/plugin` command, update Claude Code to the latest version. See [Troubleshooting](https://code.claude.com/docs/en/troubleshooting) for upgrade instructions.
> 如果看不到 `/plugin` 命令, 请将 Claude Code 更新到最新版本. 有关升级说明, 请参阅[故障排除部分](https://code.claude.com/docs/en/troubleshooting).
>

### Create your first plugin

1 Create the plugin directory
创建插件目录

Every plugin lives in its own directory containing a manifest and your skills, agents, or hooks. Create one now:
每个插件都位于其自身的目录中, 该目录包含清单文件以及您的技能、代理或钩子. 立即创建一个:

```bash
mkdir my-first-plugin
```

2 Create the plugin manifest
创建插件清单

The manifest file at `.claude-plugin/plugin.json` defines your plugin's identity: its name, description, and version. Claude Code uses this metadata to display your plugin in the plugin manager.
位于 `.claude-plugin/plugin.json` 清单文件定义了插件的身份信息: 包括名称、描述和版本. Claude Code 使用此元数据在插件管理器中显示您的插件.

Create the `.claude-plugin` directory inside your plugin folder:
在插件文件夹内创建 `.claude-plugin` 目录:

```bash
mkdir my-first-plugin/.claude-plugin
```

Then create `my-first-plugin/.claude-plugin/plugin.json` with this content:
然后创建 `my-first-plugin/.claude-plugin/plugin.json` 文件, 并添加以下内容:

```json
{
    "name": "my-first-plugin",
    "description": "A greeting plugin to learn the basics",
    "version": "1.0.0",
    "author": {
        "name": "Your Name"
    }
}
```

| Field         | Purpose                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`        | Unique identifier and skill namespace. Skills are prefixed with this (e.g., `/my-first-plugin:hello`). <br> 唯一标识符和技能命名空间. 技能会以此为前缀(例如, `/my-first-plugin:hello` ).                                                                                                                                                                                                                                                                                                                                        |
| `description` | Shown in the plugin manager when browsing or installing plugins. <br> 在浏览或安装插件时, 会在插件管理器中显示.                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `version`     | Optional. If set, users only receive updates when you bump this field. If omitted and your plugin is distributed via git, the commit SHA is used and every commit counts as a new version. See [version management](https://code.claude.com/docs/en/plugins-reference#version-management). <br> 可选. 如果设置, 用户仅在您更新此字段时才会收到更新. 如果省略此字段且您的插件通过 Git 分发, 则使用提交 SHA 值, 每次提交都算作一个新版本. 请参阅[版本管理](https://code.claude.com/docs/en/plugins-reference#version-management). |
| `author`      | Optional. Helpful for attribution. <br> 可选. 有助于注明出处.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

For additional fields like `homepage`, `repository`, and `license`, see the [full manifest schema](https://code.claude.com/docs/en/plugins-reference#plugin-manifest-schema).
有关 `homepage`、`repository` 和 `license` 等其他字段, 请参阅[完整的清单架构](https://code.claude.com/docs/en/plugins-reference#plugin-manifest-schema).

3 Add a skill

Skills live in the `skills/` directory. Each skill is a folder containing a `SKILL.md` file. The folder name becomes the skill name, prefixed with the plugin's namespace (`hello/` in a plugin named `my-first-plugin` creates `/my-first-plugin:hello`).
技能位于 `skills/` 目录中. 每个技能都是一个包含 `SKILL.md` 文件的文件夹. 文件夹名称成为技能名称, 并以插件的命名空间作为前缀(例如, 在名为 `my-first-plugin` 插件中, `hello/` 将创建 `/my-first-plugin:hello` ).

Create a skill directory in your plugin folder:

```bash
mkdir -p my-first-plugin/skills/hello
```

Then create `my-first-plugin/skills/hello/SKILL.md` with this content:
然后创建 `my-first-plugin/skills/hello/SKILL.md` 文件, 并添加以下内容:

```
---
description: Greet the user with a friendly message
disable-model-invocation: true
---

Greet the user warmly and ask how you can help them today.
```

4 Test your plugin

Run Claude Code with the `--plugin-dir` flag to load your plugin:
使用 `--plugin-dir` 标志运行 Claude Code 以加载您的插件:

```bash
claude --plugin-dir ./my-first-plugin
```

Once Claude Code starts, try your new skill:

```bash
/my-first-plugin:hello
```

You'll see Claude respond with a greeting. Run `/help` to see your skill listed under the plugin namespace.

> **Why namespacing?** Plugin skills are always namespaced (like `/my-first-plugin:hello`) to prevent conflicts when multiple plugins have skills with the same name.
> 为什么要使用命名空间? 插件技能总是使用命名空间(例如 `/my-first-plugin:hello` ), 以防止多个插件拥有同名技能时发生冲突.
> To change the namespace prefix, update the `name` field in `plugin.json`.
> 要更改命名空间前缀, 请更新 `plugin.json` 中的 `name` 字段.
>

5 Add skill arguments

Make your skill dynamic by accepting user input. The `$ARGUMENTS` placeholder captures any text the user provides after the skill name.
通过接受用户输入, 使您的技能更具动态性. `$ARGUMENTS` 占位符用于捕获用户在技能名称后提供的任何文本.

Update your `SKILL.md` file:

```
---
description: Greet the user with a personalized message
---

# Hello Skill

Greet the user named "$ARGUMENTS" warmly and ask how you can help them today. Make the greeting personal and encouraging.
```

Run `/reload-plugins` to pick up the changes, then try the skill with your name:
运行 `/reload-plugins` 以使更改生效, 然后尝试使用你的名字使用该技能:

```
/my-first-plugin:hello Alex
```

Claude will greet you by name. For more on passing arguments to skills, see [Skills](https://code.claude.com/docs/en/skills#pass-arguments-to-skills).
Claude 会叫出你的名字. 有关如何向技能传递参数的更多信息, 请参阅 ["技能"部分](https://code.claude.com/docs/en/skills#pass-arguments-to-skills).

You've successfully created and tested a plugin with these key components:
您已成功创建并测试了一个包含以下关键组件的插件:

- **Plugin manifest** (`.claude-plugin/plugin.json`): describes your plugin's metadata
  插件清单( `.claude-plugin/plugin.json` ): 描述插件的元数据

- **Skills directory** (`skills/`): contains your custom skills
  技能目录 ( `skills/` ): 包含您的自定义技能

- **Skill arguments** (`$ARGUMENTS`): captures user input for dynamic behavior
  技能参数 ( `$ARGUMENTS` ): 捕获用户输入以实现动态行为

The `--plugin-dir` flag is useful for development and testing. When you're ready to share your plugin with others, see [Create and distribute a plugin marketplace](https://code.claude.com/docs/en/plugin-marketplaces).
`--plugin-dir` 标志对于开发和测试非常有用. 当您准备好与他人分享您的插件时, 请参阅 ["创建和分发插件市场"](https://code.claude.com/docs/en/plugin-marketplaces).

## Plugin structure overview
插件结构概述

You've created a plugin with a skill, but plugins can include much more: custom agents, hooks, MCP servers, LSP servers, and background monitors.
您已经创建了一个具有一定技能的插件, 但插件还可以包含更多内容: 自定义代理、钩子、MCP 服务器、LSP 服务器和后台监视器.

> Common mistake: Don't put `commands/`, `agents/`, `skills/`, or `hooks/` inside the `.claude-plugin/` directory. Only `plugin.json` goes inside `.claude-plugin/`. All other directories must be at the plugin root level.
> 常见错误: 不要将 `commands/`、`agents/`、`skills/` 或 `hooks/` 放在 `.claude-plugin/` 目录下. 只有 `plugin.json` 可以放在 `.claude-plugin/` 目录下. 所有其他目录都必须位于插件根目录下.

| Directory         | Location    | Purpose                                                                                                                                                                   |
| ----------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.claude-plugin/` | Plugin root | Contains `plugin.json` manifest (optional if components use default locations) <br> 包含 `plugin.json` 清单文件(如果组件使用默认位置, 则此文件为可选).                    |
| `skills/`         | Plugin root | Skills as `<name>/SKILL.md` directories                                                                                                                                   |
| `commands/`       | Plugin root | Skills as flat Markdown files. Use `skills/` for new plugins                                                                                                              |
| `agents/`         | Plugin root | Custom agent definitions                                                                                                                                                  |
| `hooks/`          | Plugin root | Event handlers in `hooks.json`                                                                                                                                            |
| `.mcp.json`       | Plugin root | MCP server configurations                                                                                                                                                 |
| `.lsp.json`       | Plugin root | LSP server configurations for code intelligence                                                                                                                           |
| `monitors/`       | Plugin root | Background monitor configurations in `monitors.json`                                                                                                                      |
| `bin/`            | Plugin root | Executables added to the Bash tool's `PATH` while the plugin is enabled <br> 启用插件后, 可执行文件已添加到 Bash 工具的 `PATH` 变量中.                                    |
| `settings.json`   | Plugin root | Default [settings](https://code.claude.com/docs/en/settings) applied when the plugin is enabled <br> 启用插件时应用的默认[设置](https://code.claude.com/docs/en/settings) |

> Next steps: Ready to add more features? Jump to [Develop more complex plugins](https://code.claude.com/docs/en/plugins#develop-more-complex-plugins) to add agents, hooks, MCP servers, and LSP servers. For complete technical specifications of all plugin components, see [Plugins reference](https://code.claude.com/docs/en/plugins-reference).
> 后续步骤: 准备添加更多功能? 请跳转至 ["开发更复杂的插件"部分](https://code.claude.com/docs/en/plugins#develop-more-complex-plugins), 以添加代理、钩子、MCP 服务器和 LSP 服务器. 有关所有插件组件的完整技术规范, 请参阅[插件参考文档](https://code.claude.com/docs/en/plugins-reference).
>

## Develop more complex plugins
开发更复杂的插件

Once you're comfortable with basic plugins, you can create more sophisticated extensions.
一旦你熟悉了基本插件, 你就可以创建更复杂的扩展程序了.

### Add Skills to your plugin
向插件添加技能

Plugins can include [Agent Skills](https://code.claude.com/docs/en/skills) to extend Claude's capabilities. Skills are model-invoked: Claude automatically uses them based on the task context.
插件可以包含[智能体技能](https://code.claude.com/docs/en/skills), 以扩展 Claude 的功能. 技能由模型调用: Claude 会根据任务上下文自动使用它们.

Add a `skills/` directory at your plugin root with Skill folders containing `SKILL.md` files:
在插件根目录下添加一个 `skills/` 目录, 并在其中创建 Skill 文件夹, 每个 Skill 文件夹包含 `SKILL.md` 文件:

```bash
my-plugin/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── code-review/
        └── SKILL.md
```

Each `SKILL.md` contains YAML frontmatter and instructions. Include a `description` so Claude knows when to use the skill:
每个 `SKILL.md` 都包含 YAML 前置元数据和说明. 请添加 `description`, 以便 Claude 知道何时使用该技能:

```
---
description: Reviews code for best practices and potential issues. Use when reviewing code, checking PRs, or analyzing code quality.
---

When reviewing code, check for:
1. Code organization and structure
2. Error handling
3. Security concerns
4. Test coverage
```

After installing the plugin, run `/reload-plugins` to load the Skills. For complete Skill authoring guidance including progressive disclosure and tool restrictions, see [Agent Skills](https://code.claude.com/docs/en/skills).
安装插件后, 运行 `/reload-plugins` 加载技能. 有关完整的技能编写指南(包括逐步披露和工具限制), 请参阅 ["代理技能"](https://code.claude.com/docs/en/skills).

### Add LSP servers to your plugin
将 LSP 服务器添加到您的插件

> For common languages like TypeScript, Python, and Rust, install the pre-built LSP plugins from the official marketplace. Create custom LSP plugins only when you need support for languages not already covered.
> 对于 TypeScript、Python 和 Rust 等常用语言, 请从官方市场安装预构建的 LSP 插件. 仅当需要支持尚未涵盖的语言时才创建自​​定义 LSP 插件.
>

LSP (Language Server Protocol) plugins give Claude real-time code intelligence. If you need to support a language that doesn't have an official LSP plugin, you can create your own by adding an `.lsp.json` file to your plugin:
LSP(语言服务器协议)插件为 Claude 提供实时代码智能. 如果您需要支持某种没有官方 LSP 插件的语言, 可以通过在插件中添加 `.lsp.json` 文件来创建自己的插件:

```json
{
    "go": {
        "command": "gopls",
        "args": [
            "serve"
        ],
        "extensionToLanguage": {
            ".go": "go"
        }
    }
}
```

Users installing your plugin must have the language server binary installed on their machine.
安装此插件的用户必须在其计算机上安装语言服务器二进制文件.

For complete LSP configuration options, see [LSP servers](https://code.claude.com/docs/en/plugins-reference#lsp-servers).
有关完整的 LSP 配置选项, 请参阅 [LSP 服务器](https://code.claude.com/docs/en/plugins-reference#lsp-servers).

### Add background monitors to your plugin
向插件添加后台监视器

Background monitors let your plugin watch logs, files, or external status in the background and notify Claude as events arrive. Claude Code starts each monitor automatically when the plugin is active, so you don't need to instruct Claude to start the watch.
后台监视器允许您的插件在后台监视日志、文件或外部状态, 并在事件发生时通知 Claude. Claude Code 会在插件激活时自动启动每个监视器, 因此您无需指示 Claude 启动监视.

Add a `monitors/monitors.json` file at the plugin root with an array of monitor entries:
在插件根目录下添加一个 `monitors/monitors.json` 文件, 其中包含一个监视器条目数组:

```json
[
    {
        "name": "error-log",
        "command": "tail -F ./logs/error.log",
        "description": "Application error log"
    }
]
```

Each stdout line from `command` is delivered to Claude as a notification during the session. For the full schema, including the `when` trigger and variable substitution, see [Monitors](https://code.claude.com/docs/en/plugins-reference#monitors).
会话期间, `command` 输出的每个标准输出行都会作为通知发送给 Claude. 有关完整的架构, 包括触发 `when` 和变量替换, 请参阅 ["监视器"部分](https://code.claude.com/docs/en/plugins-reference#monitors).

### Ship default settings with your plugin
插件默认设置已包含在内

Plugins can include a `settings.json` file at the plugin root to apply default configuration when the plugin is enabled. Currently, only the `agent` and `subagentStatusLine` keys are supported.
插件可以在插件根目录下包含一个 `settings.json` 文件, 以便在启用插件时应用默认配置. 目前仅支持 `agent` 和 `subagentStatusLine` 键.

Setting `agent` activates one of the plugin's [custom agents](https://code.claude.com/docs/en/sub-agents) as the main thread, applying its system prompt, tool restrictions, and model. This lets a plugin change how Claude Code behaves by default when enabled.
设置 `agent` 会将插件的某个[自定义代理](https://code.claude.com/docs/en/sub-agents)激活为主线程, 并应用其系统提示、工具限制和模型. 这样, 插件就可以在启用时更改 Claude Code 的默认行为.

```json
{
    "agent": "security-reviewer"
}
```

This example activates the `security-reviewer` agent defined in the plugin's `agents/` directory. Settings from `settings.json` take priority over `settings` declared in `plugin.json`. Unknown keys are silently ignored.
此示例激活 `settings.json` `agents/` 目录中定义的 `security-reviewer` 代理. settings.json 中的设置优先级高于 `plugin.json` 中声明的 `settings`. 未知键将被静默忽略.

### Organize complex plugins
整理复杂的插件

For plugins with many components, organize your directory structure by functionality. For complete directory layouts and organization patterns, see [Plugin directory structure](https://code.claude.com/docs/en/plugins-reference#plugin-directory-structure).
对于包含众多组件的插件, 请按功能组织目录结构. 有关完整的目录布局和组织模式, 请参阅 ["插件目录结构"部分](https://code.claude.com/docs/en/plugins-reference#plugin-directory-structure).

### Test your plugins locally
在本地测试您的插件.

Use the `--plugin-dir` flag to test plugins during development. This loads your plugin directly without requiring installation.
在开发过程中, 可以使用 `--plugin-dir` 标志来测试插件. 这样可以直接加载插件, 无需安装.

```bash
claude --plugin-dir ./my-plugin
```

The flag also accepts a `.zip` archive of the plugin directory, which requires Claude Code v2.1.128 or later.
该标志还接受插件目录的 `.zip` 存档, 这需要 Claude Code v2.1.128 或更高版本.

```bash
claude --plugin-dir ./my-plugin.zip
```

When a `--plugin-dir` plugin has the same name as an installed marketplace plugin, the local copy takes precedence for that session. This lets you test changes to a plugin you already have installed without uninstalling it first. The exception is plugins that managed settings force-enable or force-disable: `--plugin-dir` cannot override those.
当 `--plugin-dir` 的插件与已安装的 Marketplace 插件同名时, 本地副本将在该会话中优先生效. 这样, 您无需先卸载插件即可测试对其所做的更改. 但对于设置了 `force-enable` 或 `force-disable` 的插件, `--plugin-dir` 无法覆盖这些设置.

As you make changes to your plugin, run `/reload-plugins` to pick up the updates without restarting. This reloads plugins, skills, agents, hooks, plugin MCP servers, and plugin LSP servers. Test your plugin components:
当您对插件进行更改时, 运行 `/reload-plugins` 即可在不重启服务器的情况下应用更新. 此命令会重新加载插件、技能、代理、钩子、插件 MCP 服务器和插件 LSP 服务器. 测试您的插件组件:

- Try your skills with `/plugin-name:skill-name`
  使用 `/plugin-name:skill-name` 测试你的技能

- Check that agents appear in `/agents`
  检查代理是否出现在 `/agents` 中

- Verify hooks work as expected
  验证钩子是否按预期工作

You can load multiple plugins at once by specifying the flag multiple times:
您可以通过多次指定该标志来一次加载多个插件:

```bash
claude --plugin-dir ./plugin-one --plugin-dir ./plugin-two
```

To test a plugin that is already packaged as a `.zip` archive and hosted at a URL, such as a CI build artifact, use `--plugin-url` instead. Claude Code fetches the archive at startup and loads it for that session only. If the fetch fails or the archive is invalid, Claude Code reports a plugin load error and starts without it. The same [trust considerations](https://code.claude.com/docs/en/discover-plugins#security) apply as for any plugin source: only point this flag at archives you control or trust.
要测试已打包成 `.zip` 压缩包并托管在特定 URL(例如 CI 构建产物)的插件, 请使用 `--plugin-url` 参数. Claude Code 会在启动时获取该压缩包, 并仅在当前会话中加载. 如果获取失败或压缩包无效, Claude Code 会报告插件加载错误, 并在不加载该插件的情况下启动. 与任何插件源一样, 此参数也需[考虑信任问题](https://code.claude.com/docs/en/discover-plugins#security): 仅当您控制或信任某个压缩包时才使用此参数.

To load multiple plugins, repeat the flag for each URL:
要加载多个插件, 请为每个 URL 重复使用该标志:

```bash
claude --plugin-url https://example.com/my-plugin.zip --plugin-url https://example.com/other.zip
```

Or pass space-separated URLs as one quoted argument:
或者将以空格分隔的 URL 作为单个带引号的参数传递:

```bash
claude --plugin-url "https://example.com/my-plugin.zip https://example.com/other.zip"
```

### Debug plugin issues

If your plugin isn't working as expected:
如果您的插件无法正常工作:

1. **Check the structure**: Ensure your directories are at the plugin root, not inside `.claude-plugin/`
  检查目录结构: 确保您的目录位于插件根目录, 而不是位于 `.claude-plugin/` 下.

2. **Test components individually**: Check each skill, agent, and hook separately
  分别测试各个组件: 分别检查每个技能、代理和钩子.

3. **Use validation and debugging tools**: See [Debugging and development tools](https://code.claude.com/docs/en/plugins-reference#debugging-and-development-tools) for CLI commands and troubleshooting techniques
  使用验证和调试工具: 请参阅 ["调试和开发工具"](https://code.claude.com/docs/en/plugins-reference#debugging-and-development-tools) 了解 CLI 命令和故障排除技巧

### Share your plugins

When your plugin is ready to share:

1. **Add documentation**: Include a `README.md` with installation and usage instructions
  添加文档: 包含一个 `README.md` 文件, 其中包含安装和使用说明.

2. **Choose a versioning strategy**: Decide whether to set an explicit `version` or rely on the git commit SHA. See [version management](https://code.claude.com/docs/en/plugins-reference#version-management)
  选择版本控制策略: 决定是设置显式 `version` 还是依赖 Git 提交 SHA 值. 参见[版本管理](https://code.claude.com/docs/en/plugins-reference#version-management)

3. **Create or use a marketplace**: Distribute through [plugin marketplaces](https://code.claude.com/docs/en/plugin-marketplaces) for installation
  创建或使用市场: 通过[插件市场](https://code.claude.com/docs/en/plugin-marketplaces)分发以进行安装

4. **Test with others**: Have team members test the plugin before wider distribution
  与其他成员一起测试: 在更广泛地发布之前, 请团队成员测试插件.

Once your plugin is in a marketplace, others can install it using the instructions in [Discover and install plugins](https://code.claude.com/docs/en/discover-plugins). To keep a plugin internal to your team, host the marketplace in a [private repository](https://code.claude.com/docs/en/plugin-marketplaces#private-repositories).
插件上架后, 其他人就可以按照 ["发现并安装插件"](https://code.claude.com/docs/en/discover-plugins) 中的说明进行安装. 如果想将插件仅供团队内部使用, 请将插件市场托管在[私有仓库](https://code.claude.com/docs/en/plugin-marketplaces#private-repositories)中.

### Submit your plugin to the official marketplace
将您的插件提交到官方市场

To submit a plugin to the official Anthropic marketplace, use one of the in-app submission forms:
要向 Anthropic 官方市场提交插件, 请使用应用内的提交表单之一:

- **Claude.ai**: [claude.ai/settings/plugins/submit](https://claude.ai/settings/plugins/submit)

- **Console**: [platform.claude.com/plugins/submit](https://platform.claude.com/plugins/submit)

Once your plugin is listed, you can have your own CLI prompt Claude Code users to install it. See [Recommend your plugin from your CLI](https://code.claude.com/docs/en/plugin-hints).
插件上线后, 您可以设置命令行提示, 引导 Claude Code 用户安装该插件. 请[参阅"通过命令行推荐插件"部分](https://code.claude.com/docs/en/plugin-hints).

> For complete technical specifications, debugging techniques, and distribution strategies, see [Plugins reference](https://code.claude.com/docs/en/plugins-reference).
> 有关完整的技术规范、调试技术和分发策略, 请参阅[插件参考](https://code.claude.com/docs/en/plugins-reference).
>

## Convert existing configurations to plugins
将现有配置转换为插件.

If you already have skills or hooks in your `.claude/` directory, you can convert them into a plugin for easier sharing and distribution.
如果你的 `.claude/` 目录中已经有了技能或钩子, 你可以将它们转换为插件, 以便更轻松地共享和分发.

### Migration steps

1 Create the plugin structure
创建插件结构

Create a new plugin directory:
创建一个新的插件目录:

```bash
mkdir -p my-plugin/.claude-plugin
```

Create the manifest file at `my-plugin/.claude-plugin/plugin.json`:
在 `my-plugin/.claude-plugin/plugin.json` 创建清单文件:

```json
{
    "name": "my-plugin",
    "description": "Migrated from standalone configuration",
    "version": "1.0.0"
}
```

2 Copy your existing files

Copy your existing configurations to the plugin directory:
将现有配置复制到插件目录:

```bash
# Copy commands
cp -r .claude/commands my-plugin/

# Copy agents (if any)
cp -r .claude/agents my-plugin/

# Copy skills (if any)
cp -r .claude/skills my-plugin/
```

3 Migrate hooks
迁移钩子

If you have hooks in your settings, create a hooks directory:
如果你的设置中包含钩子函数, 请创建一个钩子函数目录:

```bash
mkdir my-plugin/hooks
```

Create `my-plugin/hooks/hooks.json` with your hooks configuration. Copy the `hooks` object from your `.claude/settings.json` or `settings.local.json`, since the format is the same. The command receives hook input as JSON on stdin, so use `jq` to extract the file path:
创建 `my-plugin/hooks/hooks.json`, 并添加你的 hooks 配置. 由于格式相同, 请从你的 `.claude/settings.json` 或 `settings.local.json` 中复制 `hooks` 对象. 该命令通过标准输入接收 JSON 格式的 hook 输入, 因此请使用 `jq` 提取文件路径:

```json
{
    "hooks": {
        "PostToolUse": [
            {
                "matcher": "Write|Edit",
                "hooks": [
                    {
                        "type": "command",
                        "command": "jq -r '.tool_input.file_path' | xargs npm run lint:fix"
                    }
                ]
            }
        ]
    }
}
```

4 Test your migrated plugin
测试迁移后的插件

Load your plugin to verify everything works:
加载插件以验证一切是否正常:

```bash
claude --plugin-dir ./my-plugin
```

Test each component: run your commands, check agents appear in `/agents`, and verify hooks trigger correctly.
测试每个组件: 运行命令, 检查代理是否出现在 `/agents` 中, 并验证钩子是否正确触发.

### What changes when migrating
迁移时会发生哪些变化

| Standalone (`.claude/`)       | Plugin                           |
| ----------------------------- | -------------------------------- |
| Only available in one project | Can be shared via marketplaces   |
| Files in `.claude/commands/`  | Files in `plugin-name/commands/` |
| Hooks in `settings.json`      | Hooks in `hooks/hooks.json`      |
| Must manually copy to share   | Install with `/plugin install`   |

> After migrating, you can remove the original files from `.claude/` to avoid duplicates. The plugin version will take precedence when loaded.
> 迁移完成后, 您可以从 `.claude/` 目录中删除原始文件, 以避免重复. 插件版本将优先加载.
>

## Next steps

Now that you understand Claude Code's plugin system, here are suggested paths for different goals:
现在您已经了解了 Claude Code 的插件系统, 以下是针对不同目标的建议路径:

### For plugin users

- [Discover and install plugins](https://code.claude.com/docs/en/discover-plugins): browse marketplaces and install plugins

- [Configure team marketplaces](https://code.claude.com/docs/en/discover-plugins#configure-team-marketplaces): set up repository-level plugins for your team

### For plugin developers

- [Create and distribute a marketplace](https://code.claude.com/docs/en/plugin-marketplaces): package and share your plugins

- [Plugins reference](https://code.claude.com/docs/en/plugins-reference): complete technical specifications

- Dive deeper into specific plugin components:
  深入了解特定插件组件:

  - [Skills](https://code.claude.com/docs/en/skills): skill development details

  - [Subagents](https://code.claude.com/docs/en/sub-agents): agent configuration and capabilities

  - [Hooks](https://code.claude.com/docs/en/hooks): event handling and automation

  - [MCP](https://code.claude.com/docs/en/mcp): external tool integration
