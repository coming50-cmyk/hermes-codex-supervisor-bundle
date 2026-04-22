# Decision Matrix

Use this matrix before dispatching Codex workers.

## 1. Execution mode selection

Choose `direct` only when all are true:

- one repo or one bounded folder
- one main file cluster
- no phase pack or thread pack needed
- likely under 30 minutes
- low risk and no cross-surface truth sync

Choose `paired` when:

- implementation is bounded
- but independent verification is still important
- or one thread can build while another prepares acceptance

Choose `four-thread` when any are true:

- multiple modules or directories
- tests plus docs plus runbook need sync
- phase-style work is involved
- work will likely exceed 30-60 minutes
- there is a meaningful acceptance surface
- a human relay would otherwise be needed

Choose `six-thread` only when any are true:

- the user explicitly asked for six threads
- accepted project truth already uses six threads
- there are at least three independent implementation lanes
- acceptance and pack-sync need to proceed in parallel with implementation
- one supervisor packet would otherwise become too overloaded to stay clear

There is no universal default thread count.
Choose the smallest shape that matches the real task.

## 2. Verdict classification

Use these rules consistently:

### `passed`

- the scoped deliverable landed
- the key validation reran green
- the required truth sources were synced
- no remaining blocker prevents handoff

### `warn`

- useful scoped progress landed
- but at least one real blocker remains
- or one required sync surface is still pending

### `failed`

- the claimed validation surface is broken
- or the output contradicts the current truth
- or the work is materially off-scope

Do not upgrade `warn` to `passed` just because workers worked hard.

## 3. Escalate vs continue

Hermes should continue without escalation when:

- implementation details are unclear but inferable
- local tests fail and debugging is possible
- one worker stalls but another path can continue
- docs can be backfilled before the blocker resolves

Hermes should escalate only when a true red-line or external blocker exists.

## 4. Iteration decision

Use one-shot by default.

Enable iterative execution only when:

- the user explicitly asked for repeated rounds
- or the accepted project truth already freezes multi-round iteration

When iterative mode is enabled, Hermes must freeze:

- round target
- stop rule
- whether all threads or only named threads continue past round one
