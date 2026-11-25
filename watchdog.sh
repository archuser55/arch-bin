#!/usr/bin/env bash
set -euo pipefail
PATTERN="python3 -m http.server 8080"
LOG="$HOME/watchdog.log"

if pgrep -f "$PATTERN" >/dev/null; then
  echo "$(date '+%F %T') [OK] Service alive (PID: $(pgrep -f "$PATTERN"))" >> "$LOG"
else
  nohup nice -n 10 python3 -m http.server 8080 --bind 127.0.0.1 >/dev/null 2>&1 &
  echo "$(date '+%F %T') [RESTARTED] Launched service (PID: $!)" >> "$LOG"
fi
