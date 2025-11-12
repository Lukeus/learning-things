#!/usr/bin/env bash
set -euo pipefail
[ -f constitution/Project-Principles.template.md ] || { echo "Missing constitution template"; exit 1; }
[ -d labs/lab-a-greenfield ] || { echo "Missing Lab A"; exit 1; }
[ -d labs/lab-b-brownfield ] || { echo "Missing Lab B"; exit 1; }
echo "Basic structure verified."
