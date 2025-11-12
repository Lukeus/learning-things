#!/usr/bin/env bash
set -euo pipefail
command -v tree >/dev/null && tree -a -I node_modules || {
  find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}
