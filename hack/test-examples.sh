#!/usr/bin/env bash
set -eu -o pipefail

grep -lR 'workflows.argoproj.io/test' examples/* | while read f ; do
  ./dist/argo delete -l workflows.argoproj.io/test
  ./dist/argo submit --watch --verify $f
done
