# Release Publish Checklist

Use this when the user asks to publish the supervisor skill to GitHub or hand it to others.

## 1. Pre-publish scrub

Check that the publish set contains no:

- secrets
- local auth files
- absolute private paths that cannot leave the machine
- stale runtime outputs pretending to be source

## 2. Validate both variants

Validate:

- `SKILL.md` frontmatter parses
- required references exist
- installer scripts point to the correct targets
- runtime-specific metadata is still correct

## 3. Build a publishable bundle

The release repo should contain:

- Codex variant
- Hermes variant
- install scripts
- validation entrypoint
- one root README explaining which variant goes where

## 4. Git boundary

Before claiming "published", confirm:

- git repo exists or was initialized
- remote URL exists
- authentication works
- push succeeded

Local commit alone is not GitHub publication.

## 5. If GitHub conditions are missing

Stop at:

- publish-ready repo
- validated bundle
- clear next command

Report exactly which external condition is missing:

- remote repo
- auth
- org permission
- network restriction

## 6. Final publish proof

Closure should include:

- local validation commands
- commit hash
- remote URL
- pushed branch

Do not claim GitHub sync without all four.
