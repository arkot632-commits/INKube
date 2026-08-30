# Guardrails

## Signs

- Before running an npm validation loop, verify that both `npm` and the project's `package.json` exist. If either is missing, treat it as an environment or repository bootstrap blocker; do not repeatedly rerun the same check or invent passing test and lint scripts.
