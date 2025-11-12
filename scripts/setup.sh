#!/usr/bin/env bash
set -euo pipefail
command -v node >/dev/null || { echo "Node.js not found"; exit 1; }
command -v npm >/dev/null || { echo "npm not found"; exit 1; }
if command -v pnpm >/dev/null; then echo "pnpm: $(pnpm -v)"; else echo "pnpm not installed (optional)"; fi

if command -v spec-kit >/dev/null; then
  if spec-kit --version >/dev/null 2>&1; then
    echo "GitHub Spec Kit: $(spec-kit --version 2>/dev/null)"
  else
    echo "GitHub Spec Kit detected. (version unavailable)"
  fi
else
  echo "GitHub Spec Kit CLI not found. Attempting install via npm..."
  if npm install -g @github/spec-kit >/dev/null 2>&1; then
    echo "GitHub Spec Kit CLI installed."
  else
    echo "Unable to install GitHub Spec Kit automatically."
    echo "Install manually by following https://github.com/github/spec-kit"
  fi
fi

printf "\nRepo ready. Start with labs/lab-a-greenfield.\n"
