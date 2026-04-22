# 控制回路中文说明

## 文件作用

Hermes 运行时版：这份文件定义 Hermes 运行时 how to supervise Codex 的主循环。

## 什么时候看

当 Hermes 需要持续盯线程状态、决定继续还是收口时。

## 重点关注

- 观察点
- 循环节奏
- 收口与升级条件

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Control Loop

Use this loop when Hermes supervises Codex workers.

## 1. Freeze truth

Write a short intake note:

- objective
- success condition
- out of scope
- write locus
- validation surface
- red lines
- execution mode
- iteration rule

## 2. Freeze ownership

Every Codex worker must own a bounded write surface.

If two workers would touch the same files:

- redefine boundaries
- or serialize one lane

Do not accept overlapping write scopes just to gain parallelism.

## 3. Require artifacts

From each worker collect:

- changed files
- commands run
- result summary
- remaining blockers

## 4. Keep the board current

Use the supervisor board to track thread status, blocker owner, validation state, and next action.

## 5. Answer user questions from current truth

If the user asks for progress, direction, thread detail, or blocker detail while the campaign is running:

- reread the active plan
- reread the current status board or `STATUS` files
- reread the latest validation evidence if the answer touches verification state
- then answer from that live state

Do not answer from stale memory alone.

## 6. Re-run validation

Hermes must rerun the real acceptance surface before issuing the final verdict.

## 7. Truth-sync before close

Update the plan, runbook, report, and project record surfaces that the project method actually requires.
````
