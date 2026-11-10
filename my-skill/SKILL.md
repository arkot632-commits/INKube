---
name: my-skill
description: Create and validate a consistent skill directory structure with instructions, scripts, references, and assets.
---

# My Skill

This skill provides a consistent structure for building reusable automation and task support.

## When to use this skill

Use this skill when you need to define or maintain a reusable capability with:
- a single entry point for operational instructions,
- executable helpers separated from documentation and static resources,
- a lightweight validation check before sharing the skill.

## Instructions

1. Start by understanding the request and the intended outcome.
2. Keep the skill focused on one clear purpose and describe that purpose in the front matter.
3. Put executable automation in `scripts/`; keep scripts focused and safe to run from any working directory.
4. Store supporting guidance and examples in `references/`.
5. Keep templates and static resources in `assets/`; do not put executable logic there.
6. Run `scripts/validate-skill.sh` after structural changes.
7. Run `scripts/show-skill-layout.sh` when a human-readable layout summary is useful.

## Layout

- `SKILL.md`: metadata and operational guidance for the skill.
- `scripts/`: executable scripts or helper commands.
- `references/`: documents and reference material.
- `assets/`: templates, examples, and supporting resources.

## Validation

From this directory, run:

```bash
./scripts/validate-skill.sh
```

The validator checks that the required directories and `SKILL.md` exist, that the
front matter contains `name` and `description`, and that helper scripts are
executable.
