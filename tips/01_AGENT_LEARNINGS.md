Anthropic 内部一个很实用的 agent 小技巧

Anthropic 工程师最近透露了一个很简单但很重要的方法: 让 Claude agent 把自己的错误写进一个外部文件里, 名字就叫 `AGENT_LEARNINGS.md`.

🟢 这个文件里会记录: 它犯过什么错、哪些模式要避免、下次更好的处理方式. 每次开始新任务前, agent 先读这份文件.

🟠 结果就是: 模型本身不用重新训练, agent 也能随着使用不断"变聪明". 这本质上是一种 external memory scaffolding(外部记忆支架).
