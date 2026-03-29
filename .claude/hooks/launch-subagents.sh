#!/bin/bash
# Auto-launch sub-agents when project opens
PROJECT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
LOG="$PROJECT_ROOT/.claude/hooks/subagents.log"
echo "$(date '+%H:%M:%S') Launching sub-agents..." >> "$LOG"
LOCK="$PROJECT_ROOT/.claude/hooks/subagents.lock"
if [ -f "$LOCK" ]; then
    PID=$(cat "$LOCK")
    if kill -0 "$PID" 2>/dev/null; then
        exit 0
    fi
fi
echo $$ > "$LOCK"
for agent in ui build infra qa; do
    claude -p "Ready. Waiting for tasks." --agent "$agent" > /dev/null 2>&1 &
    echo "$(date '+%H:%M:%S') Launched $agent (PID $!)" >> "$LOG"
done
