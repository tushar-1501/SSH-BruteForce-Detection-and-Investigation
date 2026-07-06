#!/bin/bash

# Check if a log file was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOGFILE=$1

# Check if the file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# Create output filename with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT="failed_login_summary_$TIMESTAMP.txt"

# Extract top 10 IPs with failed login attempts
grep "Failed password" "$LOGFILE" \
    | awk '{print $13}' \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -10 > "$OUTPUT"

# Display summary
echo "=============================="
echo "  Failed SSH Login Report"
echo "=============================="
echo "Log File : $LOGFILE"
echo "Generated: $(date)"
cat "$OUTPUT"
echo
echo "Report saved as: $OUTPUT"