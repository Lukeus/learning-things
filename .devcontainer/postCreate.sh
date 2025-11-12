#!/usr/bin/env bash
set -euo pipefail
corepack enable || true
corepack prepare pnpm@latest --activate || true
