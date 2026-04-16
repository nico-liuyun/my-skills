# 我的 Skills 归档仓

这是一个用于沉淀、整理和迭代个人 AI skills 的代码仓库。

## 用途

这个仓库把每个 skill 都保持为独立目录，方便你：

- 按主题检索
- 在不同环境之间复用
- 追踪历史修改
- 后续挑选部分 skill 对外发布

## 仓库结构

```text
skills/      正在使用的 skill，每个 skill 一个目录
templates/   新建 skill 和参考文档的模板
scripts/     初始化、校验、生成索引等辅助脚本
docs/        仓库级约定、命名规范、分类说明
index/       机器可读索引，便于后续自动化
```

## Skill 标准结构

每个 skill 建议放在 `skills/` 下的独立目录中：

```text
skills/<skill-name>/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
├── scripts/
└── assets/
```

其中只有 `SKILL.md` 是必需的，其余目录按需创建。

## 命名规则

- skill 目录名统一使用小写 kebab-case
- 按能力命名，不按日期命名
- 避免 `misc`、`temp`、`test1` 这类含义模糊的名字

示例：

- `frontend-component`
- `python-cli`
- `academic-reading`
- `interview-prep`

## 新建 Skill

使用辅助脚本：

```bash
bash scripts/new-skill.sh my-skill
```

创建后重点编辑：

- `skills/my-skill/SKILL.md`
- `skills/my-skill/agents/openai.yaml`

## 校验

运行：

```bash
bash scripts/validate-skills.sh
```

这个脚本会检查每个 skill 目录下是否存在 `SKILL.md`。

## 下一步

你申请好 GitHub 仓库地址后，可以在当前目录执行：

1. `git init`
2. `git add .`
3. `git commit -m "初始化个人 skills 归档仓"`
4. `git branch -M main`
5. `git remote add origin <你的仓库地址>`
6. `git push -u origin main`
