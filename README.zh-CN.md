# Hermes Codex Supervisor Bundle

Hermes Codex Supervisor Bundle 把同一套 supervisor 工作流打成两套运行时交付：

- `codex-skill/`：给 Codex 桌面版或本地 Codex CLI 使用
- `hermes-runtime-skill/`：给 Hermes profile 运行时使用

这两套能力语义上要保持一致，但运行时打包方式和安装入口本来就不同，不应混用。

## 目录结构

```text
.
├─ codex-skill/
│  └─ hermes-codex-supervisor/
├─ hermes-runtime-skill/
│  └─ autonomous-ai-agents/
│     └─ hermes-codex-supervisor/
└─ scripts/
   └─ validate_bundle.py
```

## 这个仓库是干什么的

这套 bundle 用来让 Hermes 或 Codex 接管控制面工作，例如：

- 开工前冻结项目真相源
- 按线程或 worktree 拆分执行
- 监督多线程推进
- 收口前重跑验收
- 合并结果并回写真相源

这个仓库不是业务项目模板，不包含应用代码、密钥、运行时数据，也不包含环境专属凭据。

## 快速开始

### 安装 Codex 版

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\codex-skill\hermes-codex-supervisor\scripts\install-hermes-codex-supervisor.ps1
```

### 安装 Hermes 运行时版

```powershell
python .\hermes-runtime-skill\autonomous-ai-agents\hermes-codex-supervisor\scripts\install_skill.py --skills-root <目标 skills 根目录>
```

如果不传 `--skills-root`，安装脚本会按这个顺序回退：

1. `HERMES_SKILLS_ROOT`
2. `HERMES_HOME/skills`
3. `~/.hermes/skills`

## 校验

在发布或分发前，先跑：

```powershell
python .\scripts\validate_bundle.py --root .
```

这个脚本会检查：

- 必需的 `SKILL.md`
- 必需的 references
- 安装脚本入口
- frontmatter 结构

## 维护规则

- Codex 版和 Hermes 版在语义上必须保持一致。
- 已安装副本只算运行时目标，不算长期真相源。
- 发布应始终以仓库源为准，不要从运行中目录直接打包。
- 只有远端 push 成功，才算 GitHub 发布完成。

## 语言说明

- 英文说明：`README.md`
- 中文说明：`README.zh-CN.md`
