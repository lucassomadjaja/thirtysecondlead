#!/usr/bin/env bash
# Commit and push everything in this folder to GitHub.
# Cloudflare Pages auto-deploys thirtysecondlead.com from the main branch.
#
#   ./push.sh                    -> commits with a timestamped message
#   ./push.sh "your message"     -> commits with your message

set -euo pipefail
cd "$(dirname "$0")"

MSG="${1:-Update site $(date '+%Y-%m-%d %H:%M')}"

git add -A

if git diff --cached --quiet; then
  echo "Nothing to commit — local files already match GitHub."
  exit 0
fi

echo "About to commit:"
git diff --cached --stat
echo

git commit -q -m "$MSG"
git push -q origin main

echo "Pushed to GitHub. Cloudflare deploys in about a minute."
echo "Check: https://thirtysecondlead.com/"
