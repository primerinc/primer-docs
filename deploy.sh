#!/bin/bash
MSG=${1:-"Update docs"}
git add .
git commit -m "$MSG"
git push origin main
echo "✓ Pushed: $MSG — live in ~30s at docs.primerinc.com"