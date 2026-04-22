# GitHub 参考中文说明

## 文件作用

Hermes 运行时版：这份文件记录参考过的开源思路，用来校验当前方案不是闭门造车。

## 什么时候看

当你需要比较 orchestration 模式，避免现场乱发明时。

## 重点关注

- 参考对象
- 借鉴点
- 不采用的部分

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# GitHub Inspirations

This skill is intentionally lighter than the frameworks below.
It borrows the parts that matter for your workflow and drops the heavy platform parts.

## 1. cli-agent-orchestrator

Borrowed idea:

- one control plane supervising multiple Codex sessions
- explicit task state and provider orchestration

Not copied:

- heavy API-first platform assumptions
- generic multi-provider complexity that current project does not need

## 2. Paseo

Borrowed idea:

- remote orchestration of coding agents
- handoff mindset between orchestrator and workers

Not copied:

- unstable orchestration layers as a project truth source
- generic orchestration abstractions that would duplicate local project rules

## 3. Maestro

Borrowed idea:

- long-running supervisor mindset
- queue / replay / unattended-session thinking

Not copied:

- full control tower platform
- heavyweight runtime and operator surface

## What this skill keeps

- supervisor role clarity
- worker packet discipline
- default multi-thread split
- acceptance-first close-out
- strict escalation boundaries

## What this skill deliberately avoids

- becoming a second truth source
- replacing project plans and records
- pretending a heavy agent platform is already in place
````
