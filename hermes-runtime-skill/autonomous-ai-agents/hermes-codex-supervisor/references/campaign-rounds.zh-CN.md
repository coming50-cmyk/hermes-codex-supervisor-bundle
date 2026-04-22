# 轮次推进中文说明

## 文件作用

Hermes 运行时版：这份文件说明总控如何按轮次推进执行，而不是只跑一轮就停。

## 什么时候看

当任务明确要求多轮迭代、反复验收或连续打磨时。

## 重点关注

- 每轮的目标
- 何时继续下一轮
- 何时停止并升级给用户

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Campaign Rounds

Use this when the campaign is explicitly iterative instead of one-shot.

## 1. Freeze round truth first

Before round one starts, Hermes should state:

- `iterative_mode = true`
- `round_target = <n>`
- `stop_rule = <exact stop condition>`
- which threads continue after round one
- what counts as a meaningful improvement

Do not let workers guess whether more rounds are coming.

## 2. Each round needs one primary objective

Per round, freeze:

- round number
- primary gain target
- validation surface
- expected artifact update

Avoid "improve everything again" packets.

## 3. Do not mark first reply as round completion

A round is complete only when:

- the scoped change landed
- the round validation ran
- the board and required truth surfaces were updated

## 4. Keep thread carry-over explicit

For rounds `2+`, Hermes should say:

- which threads continue
- which threads are frozen
- whether acceptance reruns every round or only at milestone rounds

## 5. Detect low-yield looping

If two consecutive rounds produce little or no validated gain:

- narrow the scope
- switch the owning thread
- or escalate with exact blocker evidence

Do not keep looping on vibes.

## 6. Final round close

The final round still requires:

- validation rerun
- truth sync
- explicit verdict

Iterative mode changes how long the campaign runs, not the close-out standard.
````
