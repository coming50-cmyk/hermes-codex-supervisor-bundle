# 启动提示词中文说明

## 文件作用

Codex 版：这份文件提供 supervisor 开工时可以直接复用的启动模板。

## 什么时候看

当你希望总控接手，但又不想每次临场组织语言时。

## 重点关注

- 目标怎么写
- 边界怎么写
- 验收与升级口径怎么写

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Starter Prompt Template

Use this when Hermes needs to start supervising Codex immediately without improvising the control packet.

## 1. One-shot supervisor opener

Paste and fill this:

```md
Use $hermes-codex-supervisor.

Goal:
- <one-sentence objective>

Current accepted truth:
- <phase / project state>
- <write locus: local / remote / remote-primary+local-mirror>
- <current validation surface>

Hard red lines:
- <red line 1>
- <red line 2>

Execution request:
- freeze intake first
- choose the right execution mode
- default to four threads unless a smaller or larger split is clearly justified
- dispatch bounded worker packets
- keep a supervisor status board
- rerun real acceptance before any final verdict
- sync plans / records / runbooks that the project method requires
- only escalate on real blockers or red lines

Iteration rule:
- <one-shot or iterative>
- <if iterative, round target and stop rule>

Required final reply:
1. overall verdict
2. what actually ran
3. what passed
4. what remains blocked
5. which truth sources were updated
6. exact next step
```

## 2. Phase-style opener

Use this when the project already has accepted phase documents:

```md
Use $hermes-codex-supervisor.

Active project:
- <project name>

Phase objective:
- <phase number and name>
- <what this phase must accomplish>

Do not invent a floating campaign.
Read the active AGENTS, workspace PLANS, project PLANS, 项目记录, current phase file, execution pack, and acceptance entrypoint first.

Then:
- freeze intake
- inherit accepted phase rhythm
- split work into bounded threads
- supervise until acceptance rerun is green or a true external blocker remains
- sync phase status, runbook, report, and project record as required
```

## 3. Six-thread opener

Use this only when six-thread mode is already justified:

```md
Use $hermes-codex-supervisor.

This campaign is explicitly six-thread.
Freeze intake first, then split into:
- A = truth freeze / guardrails
- B = main lane 1
- C = main lane 2
- D = main lane 3 or integration lane
- E = acceptance / regression / runbook alignment
- F = pack sync / evidence / merge prep

Do not widen beyond six.
Do not let overlapping write scopes through.
```

## 4. Minimal anti-drift sentence

If the project uses a remote writable copy and local mirror, always include a sentence like:

- `Remote is the only writable working copy; local is mirror/backup only; do not dual-write.`
````
