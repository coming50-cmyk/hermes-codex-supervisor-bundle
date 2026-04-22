# Hermes Codex Supervisor Bundle

This bundle ships two aligned variants of the same supervisor method:

- `codex-skill/` for Codex desktop/local runtime
- `hermes-runtime-skill/` for Hermes profile runtime

## Install

### Codex

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\codex-skill\hermes-codex-supervisor\scripts\install-hermes-codex-supervisor.ps1
```

### Hermes

Run:

```powershell
python .\hermes-runtime-skill\autonomous-ai-agents\hermes-codex-supervisor\scripts\install_skill.py --skills-root <target-skills-root>
```

If you omit `--skills-root`, the installer uses its built-in default target.

## Validate

Run:

```powershell
python .\scripts\validate_bundle.py --root .
```

## Notes

- Both variants should stay semantically aligned.
- Local installed copies are runtime targets, not source-of-truth.
- GitHub publication is only complete after remote push succeeds.
