# 线程契约中文说明

## 文件作用

Codex 版：这份文件定义 worker 线程的职责边界、输入输出和不得越界的规则。

## 什么时候看

当你要正式把任务拆给多个线程时。

## 重点关注

- 线程边界
- 交付物
- 何时回到主线程

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Thread Contract

Default four-thread split:

## Thread A

- freeze truth
- freeze guardrails
- define ownership
- define release conditions

## Thread B

- main workstream 1
- highest-value implementation track

## Thread C

- main workstream 2
- independent parallel implementation or validation track

## Thread D

- acceptance
- runbook
- evidence
- final close-out support

## Optional six-thread split

Use this only when the project truth or user explicitly requires wider parallelism.

## Thread A

- truth freeze
- guardrails
- ownership

## Thread B

- main workstream 1

## Thread C

- main workstream 2

## Thread D

- main workstream 3 or integration lane

## Thread E

- acceptance
- regression
- runbook alignment

## Thread F

- pack sync
- evidence collection
- merge-prep support

## Required thread fields

Every thread packet must define:

- thread name
- current truth
- allowed files / scope
- forbidden scope
- required outputs
- validation requirements
- blocker behavior
- fixed final reply format
- whether the thread is iterative or one-shot
- if iterative: round target and stop rule

## Iteration rule

Do not make every thread iterative by default.

Only add "keep iterating after first delivery" when:

- the user explicitly asked for repeated rounds
- or accepted project truth already requires ongoing iteration

If only some threads should iterate, say that explicitly.
````
