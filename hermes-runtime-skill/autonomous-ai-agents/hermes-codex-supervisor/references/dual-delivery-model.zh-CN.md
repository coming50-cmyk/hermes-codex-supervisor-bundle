# 双交付模型中文说明

## 文件作用

Hermes 运行时版：这份文件说明为什么同一套能力要同时交付 Codex 版与 Hermes 版，以及两边如何保持一致。

## 什么时候看

当你需要理解两套目录、两套安装入口、一个真相源时。

## 重点关注

- Codex 与 Hermes 的职责差异
- 共同真相源
- 发布同步要求

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Dual Delivery Model

Use this when the same supervisor method must exist in both Codex and Hermes.

## 1. Same method, different runtime

- Codex-side skill: desktop / local auto-trigger surface
- Hermes-side skill: runtime profile surface inside Hermes

The workflow should stay aligned, but install roots and runtime assumptions differ.

## 2. Do not mix package formats

- Codex skill may include `agents/openai.yaml` and plugin packaging
- Hermes runtime skill follows Hermes profile skill layout

Do not copy one format onto the other without adaptation.

## 3. Keep one publishable source set

The project should keep a repo-contained source for both variants so GitHub release does not depend on:

- `C:\Users\...\.codex`
- a live Hermes profile directory

Local installed copies are runtime targets, not long-term source of truth.

## 4. What must stay aligned

Keep these aligned across both variants:

- trigger intent
- execution modes
- escalation boundaries
- acceptance standard
- merge and truth-sync rules

## 5. What may differ

These may differ by runtime:

- tool prerequisites
- install script
- profile / plugin metadata
- exact examples for launching workers

## 6. Release rule

When publishing, package both variants together and state clearly:

- which folder installs to Codex
- which folder installs to Hermes
- which scripts validate and install each side
````
