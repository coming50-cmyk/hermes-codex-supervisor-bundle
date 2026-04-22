# Control Loop

Use this loop when Hermes supervises Codex workers.

## 1. Freeze truth

Write a short intake note:

- objective
- success condition
- out of scope
- write locus
- validation surface
- red lines
- execution mode
- iteration rule

For any main-control step that shapes the plan, thread split, acceptance, or verdict, use extra-high reasoning (`xhigh` where supported).
If that tier is unavailable, do not finalize the formal plan or verdict yet.

## 2. Freeze ownership

Every Codex worker must own a bounded write surface.

If two workers would touch the same files:

- redefine boundaries
- or serialize one lane

Do not accept overlapping write scopes just to gain parallelism.

## 3. Require artifacts

From each worker collect:

- changed files
- commands run
- result summary
- remaining blockers

## 4. Keep the board current

Use the supervisor board to track thread status, blocker owner, validation state, and next action.

## 5. Answer user questions from current truth

If the user asks for progress, direction, thread detail, or blocker detail while the campaign is running:

- reread the active plan
- reread the current status board or `STATUS` files
- reread the latest validation evidence if the answer touches verification state
- then answer from that live state

Do not answer from stale memory alone.

## 6. Re-run validation

Hermes must rerun the real acceptance surface before issuing the final verdict.

## 7. Truth-sync before close

Update the plan, runbook, report, and project record surfaces that the project method actually requires.
