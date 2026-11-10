#!/usr/bin/env bash
# powerwtf — show what's currently burning the most power right now.
#
# powermetrics needs root, so run this with sudo:
#   sudo powerwtf [N]
# N = how many top consumers to show (default 15).
set -euo pipefail

TOP=${1:-15}
SAMPLE_MS=1000

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  echo "powerwtf needs root for powermetrics. Run: sudo powerwtf ${1:-}" >&2
  exit 1
fi

echo "== Battery =="
pmset -g batt | sed -n '2p'
echo

echo "== Top $TOP by CPU ms/s (1000 = one full core; high wakeups = poor idle) =="
powermetrics --samplers tasks -n1 -i "$SAMPLE_MS" 2>/dev/null \
| perl -ne '
    if (/^Name\s+ID\s+CPU/) { $t = 1; next }
    next unless $t;
    last if /^\*\*\*/;
    # name (may contain spaces), id, cpu ms/s, user%, then deadlines/wakeups cols
    next unless /^(.+?)\s{2,}(-?\d+)\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+[\d.]+\s+([\d.]+)/;
    printf "%s\t%s\t%s\t%s\t%s\n", $3, $2, $1, $4, $5 + $6;
  ' \
| sort -t"$(printf '\t')" -k1 -rn \
| head -n "$TOP" \
| awk -F"$(printf '\t')" '
    BEGIN { printf "%-9s %-8s %-34s %6s %9s\n", "CPUms/s", "PID", "NAME", "USER%", "WAKEUPS" }
    { printf "%-9s %-8s %-34s %6s %9s\n", $1, $2, $3, $4, $5 }'
