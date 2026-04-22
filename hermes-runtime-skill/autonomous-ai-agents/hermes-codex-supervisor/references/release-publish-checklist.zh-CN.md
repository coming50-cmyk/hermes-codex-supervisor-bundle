# 发布检查单中文说明

## 文件作用

Hermes 运行时版：这份文件定义公开发布前的检查动作，防止漏文档、漏校验、漏脱敏。

## 什么时候看

当你准备把 bundle 发布到 GitHub 或其它分发入口时。

## 重点关注

- 脱敏检查
- 构建和校验
- 发布完成判定

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
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
````
