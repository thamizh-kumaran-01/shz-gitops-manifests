#!/bin/bash
WEBHOOK_URL="$SLACK_WEBHOOK_URL"

BAD_PODS=$(kubectl get pods -A --no-headers | grep -E 'CrashLoopBackOff|Error|Pending|ImagePullBackOff')

if [ -n "$BAD_PODS" ]; then
  MESSAGE="*SHZ Platform Alert* :warning:\nUnhealthy pods detected:\n\`\`\`\n$BAD_PODS\n\`\`\`"
  curl -s -X POST -H 'Content-type: application/json' \
    --data "{\"text\":\"$MESSAGE\"}" \
    "$WEBHOOK_URL"
fi
