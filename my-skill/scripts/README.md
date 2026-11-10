# Scripts

This folder is for executable automation and helper entry points for the skill.

## Available scripts

- `show-skill-layout.sh` prints the current skill structure and explains the purpose of each folder.
- `validate-skill.sh` checks the required files, directories, metadata, and script permissions.

## Usage

```bash
./scripts/show-skill-layout.sh
./scripts/validate-skill.sh
```

Keep each script focused on a single task. Prefer small, reusable tools that can be chained together in automation.
