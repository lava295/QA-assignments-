#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
LOG_FILE="system_health.log"

# Get system stats
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')

echo "----- $(date) -----" >> $LOG_FILE

# Check thresholds
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "High CPU Usage: $CPU_USAGE%" >> $LOG_FILE
fi

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
  echo "High Memory Usage: $MEM_USAGE%" >> $LOG_FILE
fi

if (( DISK_USAGE > DISK_THRESHOLD )); then
  echo "High Disk Usage: $DISK_USAGE%" >> $LOG_FILE
fi

# Log top processes
echo "Top Processes:" >> $LOG_FILE
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10 >> $LOG_FILE
echo "" >> $LOG_FILE
