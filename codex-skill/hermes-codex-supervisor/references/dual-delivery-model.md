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
