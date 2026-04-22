# 真相源回写矩阵中文说明

## 文件作用

Hermes 运行时版：这份文件定义不同类型结果应该回写到哪里，避免双真相源乱掉。

## 什么时候看

当任务收口，需要把结论同步回计划、项目记录、状态文件时。

## 重点关注

- 不同对象的真相源
- 主从关系
- 回写完成判定

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Truth Sync Matrix

Use this to decide what Hermes must update before calling a campaign closed.

## 1. Always consider these surfaces

- task plan
- project plan or phase plan
- status file or execution pack status
- runbook
- report or acceptance summary
- project record

Do not update all of them blindly. Update the ones the project's accepted method actually uses.

## 2. Non-phase work

Update at least:

- active task plan
- relevant project record if project truth changed

Add runbook or report only if the work created or changed an operational surface.

## 3. Phase work

Update the required phase surfaces:

- `plans/phase-xx.md`
- current execution-pack `STATUS-*`
- acceptance runbook
- acceptance report
- project record if a truth-level decision changed

If the project already has a stable phase cadence, do not replace it with a new ad-hoc report path.

## 4. Revalidation work

Update:

- phase file verdict
- acceptance report
- status file that previously claimed the old result
- project record if the revalidation changed the official truth

## 5. Common-foundation or pre-implementation work

Keep these clearly distinct from implemented PASS states.

Update:

- plan or phase prework section
- status or report surface that tracks prework
- project record if this freezes a shared contract or boundary

Do not promote prework to implemented PASS unless the real validation surface exists and passed.

## 6. Remote-primary plus local-mirror projects

If operational truth lives on the remote writable copy:

- treat remote updates as operational truth
- only mirror locally after the remote state is known
- do not claim GitHub sync unless it actually happened

## 7. Final sync question set

Before closure Hermes should answer:

1. Which surface now holds the official current status?
2. Which surface now holds the validation result?
3. Which surface now holds the decision log or project truth change?
4. Did any stale file still say PASS, WARN, or PLAN-READY incorrectly?
5. Is there any mirror or backup copy that must be explicitly labeled as non-primary?
````
