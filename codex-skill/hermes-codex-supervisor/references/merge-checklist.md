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
