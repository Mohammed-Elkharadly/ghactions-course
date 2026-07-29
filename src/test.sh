#!/bin/bash

#src/test.sh
EXPECTED="hello john"

OUTPUT=$(node -e "console.log(require('./src/app')('john'))")

if [ "$OUTPUT" == "$EXPECTED" ]; then
  echo "✅ test passed"
  exit 0
else 
  echo "❌ test failed expected '$EXPECTED' but got '$OUTPUT'"
  exit 1
fi