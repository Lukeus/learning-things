#!/usr/bin/env bash
set -euo pipefail

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js not found. Please install Node.js 22 LTS." >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "npm not found. Please install npm." >&2
  exit 1
fi

get_pnpm_info() {
  if command -v pnpm >/dev/null 2>&1; then
    if version=$(pnpm -v 2>/dev/null | tail -n 1); then
      printf 'pnpm (pnpm): %s\n' "${version}"
      return 0
    fi
  fi

  echo "pnpm not installed. Attempting to activate via Corepack..."
  if command -v corepack >/dev/null 2>&1; then
    if corepack enable >/dev/null 2>&1 && corepack prepare pnpm@latest --activate >/dev/null 2>&1; then
      if version=$(pnpm -v 2>/dev/null | tail -n 1); then
        printf 'pnpm (pnpm): %s\n' "${version}"
        return 0
      fi
    else
      echo "Unable to activate pnpm via Corepack."
    fi
  else
    echo "Corepack not available; checking for npx fallback."
  fi

  if command -v npx >/dev/null 2>&1; then
    echo "Using npx to invoke pnpm temporarily..."
    if version=$(npx --yes pnpm@latest -- --version 2>/dev/null | tail -n 1); then
      if [[ -n "${version}" ]]; then
        printf 'pnpm (npx pnpm@latest): %s\n' "${version}"
        return 0
      fi
    fi
  fi

  echo "Unable to locate pnpm. Install pnpm manually if you prefer it over npm."
  return 0
}

get_pnpm_info

if command -v specify >/dev/null 2>&1; then
  if specify --version >/dev/null 2>&1; then
    echo "GitHub Spec Kit: $(specify --version 2>/dev/null)"
  else
    echo "GitHub Spec Kit detected. (version unavailable)"
  fi
else
  echo "GitHub Spec Kit CLI not found. Attempting install via npm..."
  if npm install -g @github/specify >/dev/null 2>&1; then
    echo "GitHub Spec Kit CLI installed."
  else
    echo "Unable to install GitHub Spec Kit automatically."
    echo "Install manually by following https://github.com/github/spec-kit"
  fi
fi

printf '\nRepo ready. Open repo in VS Code and start with labs/lab-a-greenfield.\n'
