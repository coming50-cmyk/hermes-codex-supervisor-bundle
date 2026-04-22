# 合并检查单中文说明

## 文件作用

Hermes 运行时版：这份文件定义主线程在并回各 worker 结果前必须核对的项目。

## 什么时候看

当多个线程都说自己做完了，主线程准备合并时。

## 重点关注

- 代码和文档是否一致
- 验证是否真实跑过
- 真相源是否已回写

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Merge Checklist

Run this checklist before Hermes issues the final verdict.

## 1. Artifact collection

Collect from each worker:

- changed files
- commands run
- result summary
- remaining blockers

Do not merge from prose alone.

## 2. Ownership conflict scan

Check for:

- overlapping write surfaces
- contradictory edits
- duplicate docs with different truths
- stale status files claiming PASS too early

If conflict exists, resolve it before final verification.

## 3. Validation rerun

Hermes should rerun the nearest real validation surface:

- acceptance script
- dry-run
- targeted tests
- smoke checks

Do not rely on worker-side green claims alone.

## 4. Truth sync scan

Confirm the required truth sources were updated:

- plan
- phase file or execution pack
- runbook
- report
- project record

Only check the surfaces that the project's accepted method actually requires.

## 5. Write-locus sanity check

If the project uses remote writable + local mirror + future GitHub sync:

- make sure the writable copy is the one that changed
- do not report local mirror edits as live truth
- do not claim GitHub sync happened unless it actually happened

## 6. Verdict gate

Use these final rules:

- `passed` only if deliverable landed, rerun validation is green, and truth sync is complete
- `warn` if useful scoped progress landed but one real blocker or required sync is still pending
- `failed` if validation is broken, truth is contradicted, or the output is materially off-scope

## 7. Final close-out packet

Hermes should close with:

1. overall verdict
2. what was actually run
3. what passed
4. what remains blocked
5. which truth sources were updated
6. exact next step
````
