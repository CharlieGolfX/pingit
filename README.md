# pingit

A simple Bash script to continuously monitor network connectivity by pinging a specified IP address and logging the results. The script supports log rotation and automatic cleanup of old log files.

## Features

- Pings `1.1.1.1` every 5 seconds and logs results.
- Logs are stored in the `logs/` directory.
- Log rotation: When `logs/pingit.log` exceeds 1MB, it is archived with a timestamp.
- Automatic deletion of rotated log files older than 31 days.
- Both successful and failed pings are logged in a concise, human-readable format.
- Output is shown in the terminal and written to the log file.

## Usage

1. **Clone or copy the script to your machine.**
2. **Make the script executable:**
   ```bash
   chmod +x pingit.sh
   ```
3. **Run the script:**
   ```bash
   ./pingit.sh
   ```

## Log Files

- **Current log:** `logs/pingit.log`
- **Rotated logs:** `logs/pingit_YYYYMMDD_HHMMSS.log`
- **Old logs:** Rotated logs older than 14 days are deleted automatically.

## Requirements

- Bash shell (Linux, macOS, or WSL on Windows)
- `ping`, `awk`, `grep`, `find`, and `stat` utilities available in your environment

## Customization

- To change the pinged IP address or interval, edit the script and modify the relevant lines.
- To adjust log rotation size or retention period, change the `MAXSIZE` and `-mtime +14` values in the script.

## Example Log Entry

```
----- 12:34:56 30.05.2025 -----
--- 1.1.1.1 ping statistics ---
bytes sent: 56
bytes received: 64
icmp: 1
ttl: 55
time: 12.4 ms
```
