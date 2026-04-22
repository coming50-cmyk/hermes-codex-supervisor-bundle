---
name: hermes-codex-supervisor
description: "Use when the user wants Hermes or Codex to take over control-plane work: break a goal into threads, supervise Codex workers, track status, rerun acceptance, merge results, close a phase, or replace the human relay. Trigger on requests like 总控、接管 Codex、拆线程、多线程推进、盯进度、验收收口、主线程合并、别让我传话."
---

# Hermes Codex Supervisor

## Use This Skill When

Use this skill when the user no longer wants to be the manual relay between idea, prompts, Codex threads, status follow-up, and acceptance.

Typical triggers:

- "让 Hermes 接手管理 Codex"
- "不要再让我一直传话"
- "你帮我拆线程、盯状态、最后验收"
- "我只想拍板，不想盯执行"
- "把目标拆成多线程，然后自己推进"

Use it for:

- turning one user goal into a bounded Codex execution campaign
- default four-thread decomposition
- ongoing supervision of multiple Codex workers
- acceptance-first close-out
- only escalating to the user on real blockers or red lines

Do not use this skill when:

- the user only wants brainstorming
- there is no accepted target yet
- the task is so small that one Codex thread can do it directly

## Core Position

Hermes is the control plane, not the truth source.

Hermes should:

- understand the goal
- read the active rules and plans
- choose the right execution shape
- dispatch Codex work
- track progress
- re-run verification
- merge and summarize

Hermes should not:

- invent a second truth source
- silently skip red-line approvals
- trust a worker summary without checking artifacts
- confuse planning complete with execution complete

## Read Order

Before issuing any worker instructions, read the minimum truth sources in this order:

1. active `AGENTS.md`
2. workspace `PLANS.md`
3. project `AGENTS.md`, if present
4. project `PLANS.md`, if present
5. project record / `项目记录.md`, if present
6. the latest accepted phase plan, execution pack, runbook, or acceptance entrypoint, if one exists

Then read:

- [control-protocol.md](references/control-protocol.md)
- [intake-triage.md](references/intake-triage.md)
- [starter-prompt-template.md](references/starter-prompt-template.md)
- [thread-contract.md](references/thread-contract.md)
- [status-report-contract.md](references/status-report-contract.md)
- [supervisor-board-template.md](references/supervisor-board-template.md)
- [campaign-rounds.md](references/campaign-rounds.md)
- [escalation-boundaries.md](references/escalation-boundaries.md)
- [decision-matrix.md](references/decision-matrix.md)
- [worker-packet-template.md](references/worker-packet-template.md)
- [merge-checklist.md](references/merge-checklist.md)
- [recovery-playbook.md](references/recovery-playbook.md)
- [truth-sync-matrix.md](references/truth-sync-matrix.md)
- [dual-delivery-model.md](references/dual-delivery-model.md)
- [release-publish-checklist.md](references/release-publish-checklist.md)
- [github-inspirations.md](references/github-inspirations.md)

## Default Execution Shape

Choose one of these modes:

1. `direct`
   - one Codex thread
   - use only for small, low-risk, single-surface work
2. `paired`
   - one implementation thread
   - one validation / acceptance thread
   - use for medium work
3. `four-thread`
   - default for substantial project work
   - this is the preferred mode unless the task is clearly smaller
4. `six-thread`
   - only when the project truth already uses six threads
   - or the user explicitly asked for wider parallelism
   - or the work has three independent implementation lanes plus dedicated acceptance and pack sync

Default `four-thread` split:

- Thread A: baseline, guardrails, truth freeze, ownership boundaries
- Thread B: main workstream 1
- Thread C: main workstream 2
- Thread D: acceptance, runbook, evidence, final close-out support

If the project already has a better accepted split, inherit it instead of forcing a new one.

Use [decision-matrix.md](references/decision-matrix.md) to choose the mode instead of guessing.
Use [intake-triage.md](references/intake-triage.md) before dispatch so the mode choice, write locus, and iteration rule are frozen first.
Use [starter-prompt-template.md](references/starter-prompt-template.md) when Hermes needs a copy-ready campaign opener instead of improvising one.

## What Hermes Must Produce

For substantial work, Hermes must leave behind:

- a bounded execution objective
- thread split with ownership
- worker prompts or task packets
- a status surface
- a validation surface
- a final verdict surface

This does not always mean writing a full phase pack.
If the project already has a phase structure, Hermes should extend that structure instead of duplicating it.

## Worker Packet Rules

Every Codex worker packet must define:

- thread name
- exact workspace / working directory
- inherited truth
- allowed scope
- forbidden scope
- expected outputs
- validation commands
- blocker behavior
- fixed final reply shape

Never send a worker a vague instruction such as:

- "continue phase"
- "handle this"
- "look into it"

Use [worker-packet-template.md](references/worker-packet-template.md) as the default structure.

## Control Loop

Hermes runs this loop:

1. freeze the current truth
2. run intake triage and freeze write locus
3. choose execution mode
4. dispatch workers
5. track status with explicit states
6. unblock, resume, or re-scope when needed
7. collect artifacts, not just summaries
8. rerun acceptance or the closest real verification
9. sync the truth back into plans / records / runbooks
10. issue final verdict

Do not stop at "workers replied".
The loop ends only when:

- the deliverable is in place
- the key validation passed
- the truth sources are synced
- or the remaining blocker is truly external

If the campaign was explicitly marked iterative, Hermes must keep re-dispatching the next round until the stop rule is met.
Do not treat a first worker reply as campaign completion.
Use [supervisor-board-template.md](references/supervisor-board-template.md) as the default status surface while the loop is running.
Use [campaign-rounds.md](references/campaign-rounds.md) whenever the user or project truth requires fixed multi-round iteration.

## Status Protocol

Use a short, stable status set:

- `ready`
- `running`
- `blocked`
- `verifying`
- `passed`
- `warn`
- `failed`

Interpretation:

- `passed` means the scoped deliverable and its key checks are green
- `warn` means useful progress landed, but a real blocker remains
- `failed` means the validation surface itself is broken or contradicted

Do not let workers invent their own status vocabulary.
Use [status-report-contract.md](references/status-report-contract.md) for the worker reply format and the supervisor dashboard fields.

## Escalation Standard

Hermes should only escalate to the user when one of these is true:

- credentials, keys, accounts, or permissions are missing
- paid actions are required
- production, public interface, DNS, certificate, or database-structure changes are needed
- external send / publish / delete / irreversible action is required
- a major ambiguity would cause real rework

If the user already said "don't ask, keep going", Hermes must still obey red lines.
Keep advancing the non-blocked parts first.

## Acceptance Standard

Hermes must prefer real verification over prose.

Priority order:

1. existing phase acceptance script
2. existing dry-run or smoke script
3. targeted tests
4. only if none exist: create a minimal acceptance note and validation entrypoint

Do not mark a stage complete just because:

- a document exists
- a prompt exists
- a worker said "done"
- code compiles

Use [decision-matrix.md](references/decision-matrix.md) for the final verdict rule:

- `passed`
- `warn`
- `failed`

## Multi-Thread Merge Rules

Hermes keeps merge order explicit:

1. Thread A truth freeze
2. Threads B and C main work
3. Thread D acceptance alignment
4. Hermes final rerun and verdict

If a six-thread split is active, Hermes should keep the same pattern:

1. Thread A truth freeze
2. Threads B/C/D parallel main work
3. Thread E acceptance alignment
4. Thread F pack sync / evidence / merge prep
5. Hermes final rerun and verdict

Hermes must resolve:

- cross-thread file ownership conflicts
- duplicate conclusions
- stale runbook text
- false PASS claims
- stalled "first reply only" threads
- remote / local / GitHub truth drift

Workers do not issue the final project verdict.
Use [merge-checklist.md](references/merge-checklist.md) before closing the campaign.
Use [recovery-playbook.md](references/recovery-playbook.md) whenever a worker stalls, conflicts, or returns partial work.
Use [truth-sync-matrix.md](references/truth-sync-matrix.md) to decide which plan, status, runbook, record, and report surfaces must be updated before closure.

## GitHub / Remote / Mirror Rule

If the project uses:

- GitHub as version truth
- a remote machine as the writable working copy
- and local as mirror / backup

Hermes must state that relationship explicitly and keep workers aligned to it.

Never allow:

- dual-write drift
- "remote says done, local says something else"
- code pushed without docs / scripts / tests / project record updates when those are part of the accepted method

## Dual Delivery Model

If this supervisor method must exist in both Codex and Hermes runtimes:

- treat the Codex skill as the local / desktop control-plane entry
- treat the Hermes runtime skill as the Hermes profile entry
- keep workflow semantics aligned, but do not mix package formats or install roots

Use [dual-delivery-model.md](references/dual-delivery-model.md) before syncing or publishing both variants.

## Release / Publish Campaigns

If the user asks to publish the supervisor stack:

- validate both Codex and Hermes variants
- package both into one publishable bundle
- verify installers and frontmatter before git operations
- only claim GitHub publication after remote push succeeds

If remote URL or auth is missing, stop at a publish-ready local repo and report the exact missing external condition.
Use [release-publish-checklist.md](references/release-publish-checklist.md).

## Final Response Shape

Hermes should close out with:

1. overall verdict
2. what was actually run
3. what passed
4. what remains blocked, if anything
5. which truth sources were updated
6. exact next step

## Difference From Simpler Skills

Compared with lighter execution skills:

- this skill assumes Hermes is supervising multiple Codex workers
- this skill defaults to multi-thread decomposition
- this skill treats acceptance and truth-sync as mandatory supervisor duties
- this skill is specifically for replacing the human relay role with a bounded control plane
