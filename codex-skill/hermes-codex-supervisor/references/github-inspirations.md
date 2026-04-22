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
