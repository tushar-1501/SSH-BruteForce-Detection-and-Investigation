Windows Security Event Analysis

Overview

This investigation focused on analyzing Windows Security Event Logs to identify recent successful and failed authentication attempts. The objective was to understand how authentication events are recorded, collect relevant security events, and automate log collection using PowerShell.

---

Objective

- Review Windows Security Event Logs.
- Identify successful logon events (Event ID 4624).
- Identify failed logon events (Event ID 4625).
- Export authentication events to a timestamped CSV file.
- Summarize authentication activity for investigation.

---

Environment

| Component | Value |
|----------|-------|
| Operating System | Windows 10 |
| Log Source | Windows Security Log |
| Tool | PowerShell |
| Cmdlet | Get-WinEvent |

---

Event Collection

Successful Logons

Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} -MaxEvents 5 |
Select-Object TimeCreated, Message |
Format-List


### Failed Logons


Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 5 |
Select-Object TimeCreated, Message |
Format-List


---

Automation

A PowerShell script (`event_collector.ps1`) was created to automate event collection.

The script performs the following tasks:

- Retrieves the latest successful logon events (4624)
- Retrieves the latest failed logon events (4625)
- Combines both event types
- Exports the results to a timestamped CSV file
- Displays a summary of successful and failed logons

Example output:


[+] Collecting security events...

[+] Export complete:
security_events_20260703_201500.csv

[+] Success logons: 5
[+] Failed logons: 2


---

Investigation Findings

The Security log confirmed that Windows records both successful and failed authentication attempts using dedicated Event IDs.

Key observations:

- Successful logons were recorded as Event ID 4624.
- Failed authentication attempts were recorded as Event ID 4625.
- Event details included timestamp, computer name, and authentication information.
- PowerShell automation simplified evidence collection and report generation.

---

Security Relevance

Monitoring authentication events helps SOC analysts:

- Detect brute-force attempts
- Identify repeated failed logins
- Investigate unauthorized access attempts
- Establish authentication timelines during incident response
- Collect evidence for further forensic analysis

---

Outcome

This exercise demonstrated how Windows authentication logs can be collected, analyzed, and exported using PowerShell. Automating the collection process enables faster investigations and supports efficient security monitoring during incident response.