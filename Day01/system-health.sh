#!/usr/bin/env bash
set -u

# Day 01 — Linux System Health Monitor (Linux /proc, GNU coreutils)
DISK_WARNING_THRESHOLD=80

section() { printf '\n=== %s ===\n' "$1"; }

section "SYSTEM INFORMATION"
printf 'Date: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z')"
printf 'Hostname: %s\n' "$(hostname)"
printf 'User: %s\n' "$(whoami)"
printf 'Kernel: %s\n' "$(uname -sr)"
if [[ -r /etc/os-release ]]; then
  . /etc/os-release
  printf 'OS: %s\n' "${PRETTY_NAME:-Linux}"
fi

section "UPTIME AND LOAD"
uptime

section "CPU"
# Sample /proc/stat twice, one second apart, to calculate busy CPU time.
read -r _ u n s idle io irq soft steal _ < /proc/stat
prev_idle=$((idle + io))
prev_total=$((u + n + s + idle + io + irq + soft + steal))
sleep 1
read -r _ u n s idle io irq soft steal _ < /proc/stat
now_idle=$((idle + io))
now_total=$((u + n + s + idle + io + irq + soft + steal))
delta_total=$((now_total - prev_total))
delta_idle=$((now_idle - prev_idle))
if ((delta_total > 0)); then
  awk -v total="$delta_total" -v idle="$delta_idle" 'BEGIN { printf "CPU utilization (1-second sample): %.1f%%\n", 100 * (total - idle) / total }'
else
  echo 'CPU utilization unavailable'
fi

section "MEMORY"
free -h

section "DISK USAGE"
df -hP -x tmpfs -x devtmpfs
section "DISK WARNINGS"
while read -r filesystem blocks used available capacity mount; do
  percent=${capacity%%%}
  if [[ "$percent" =~ ^[0-9]+$ ]] && ((percent >= DISK_WARNING_THRESHOLD)); then
    printf 'WARNING: %s (%s) is %s full\n' "$mount" "$filesystem" "$capacity"
  fi
done < <(df -P -x tmpfs -x devtmpfs | tail -n +2)

section "TOP 5 PROCESSES BY CPU"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

section "NETWORK IP ADDRESSES"
if command -v ip >/dev/null 2>&1; then
  ip -brief address
else
  echo 'ip command not installed (install iproute2)'
fi

section "HEALTH CHECK COMPLETE"
