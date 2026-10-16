# Day 01 — Linux Commands and System Information

## Objective
Build a Bash script that displays Linux host details, uptime, CPU usage, RAM, disk utilization, five highest-CPU processes, and network addresses.

## Commands practiced
`uname -a`, `hostname`, `whoami`, `pwd`, `ls -lah`, `uptime`, `free -h`, `df -h`, `ps aux`, `ip addr`, `date`, `chmod`.

## Run the lab
```bash
chmod +x system-health.sh
./system-health.sh
```

Save the output (optional):
```bash
./system-health.sh | tee health-report.txt
```

The script uses `/proc/stat`, GNU utilities and Bash; it is intended for Linux, not macOS.

## Expected results
- OS, hostname, logged-in user and kernel information
- Uptime and system load averages
- CPU utilization over a one-second sample
- Memory and disk usage
- Warning for non-temporary filesystems at 80% usage or above
- Top five processes sorted by CPU usage
- Interface addresses

## Notes
- CPU sample reflects a short interval; it is not a long-term average.
- `ps %CPU` reports process CPU usage as defined by `ps`, not necessarily an instantaneous measurement.
- Do not post private IPs, hostnames or sensitive process arguments in public screenshots.

## Deliverables
- [ ] Test script on Linux
- [ ] Push code and README to GitHub
- [ ] Publish LinkedIn post
- [ ] Publish short YouTube demonstration

GitHub: 
LinkedIn: 
YouTube: 

### What I learned

### Problems and fixes
