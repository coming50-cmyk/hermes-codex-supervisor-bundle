# 升级边界中文说明

## 文件作用

Codex 版：这份文件定义哪些情况必须停下来找人拍板，哪些情况可以继续自动推进。

## 什么时候看

当线程遇到红线、外部阻塞、风险操作时。

## 重点关注

- 必停条件
- 可继续条件
- 升级给用户的最小信息包

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Escalation Boundaries

Hermes should keep the user out of the loop unless escalation is necessary.

## Escalate only for:

- missing credentials or permissions
- production actions
- paid actions
- public sends or public interface changes
- database schema or destructive data actions
- irreversible actions
- major ambiguity with real rework risk

## Do not escalate for:

- routine implementation uncertainty
- local test failures that can be debugged
- missing non-critical context that can be inferred
- status updates that do not require a decision

## Escalation message shape

When Hermes must escalate, keep it short:

1. blocker
2. impact
3. exact user decision or credential needed
4. what work already continued without that input
````
