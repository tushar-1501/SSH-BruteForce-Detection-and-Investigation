SSH Brute-Force Detection and Investigation

Project Overview

This project demonstrates the investigation of authentication events across both Linux and Windows environments using native operating system logs and custom automation.

The project covers:

Linux SSH authentication failure investigation using journalctl
Windows Security Event Log analysis using PowerShell
Bash automation for extracting Indicators of Compromise (IOCs)
PowerShell automation for collecting Windows logon events
Investigation reporting and IOC documentation

The objective is to simulate the daily workflow of a Security Operations Center (SOC) analyst by identifying suspicious authentication activity, extracting evidence from system logs, and documenting findings in a structured investigation report.


Objectives:

Investigate failed SSH authentication attempts on Linux.
Analyze Windows Security Event Logs for successful and failed logons.
Identify suspicious usernames and source IP addresses.
Automate log collection using Bash and PowerShell.
Generate investigation-ready reports.
Practice analyst documentation and IOC reporting.

---

Lab Environment

| Component  | Operating System | Purpose                                      |
| ---------- | ---------------- | -------------------------------------------- |
| Kali Linux | Linux            | SSH log analysis, Bash automation            |
| Windows VM | Windows          | Security Event Log analysis using PowerShell |
| Bash       | Linux            | IOC extraction                               |
| PowerShell | Windows          | Security event collection                    |
| journalctl | Linux            | SSH authentication investigation             |


---

Attack Simulation:

Linux

The OpenSSH service was enabled on Kali Linux.

Multiple authentication attempts were intentionally generated using an invalid username.

Repeated failed authentication attempts were generated using an invalid user account.

ssh fakeuser@localhost

This generated multiple authentication failures inside the system journal.

Relevant events were reviewed using:

sudo journalctl -u ssh

Windows:

Windows Security Event Logs were reviewed to identify authentication activity.

Successful logons:

Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624}

Failed logons:

Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625}

A PowerShell script was created to automatically collect the latest events and export them into a timestamped CSV report.

Detection Workflow:

Linux Investigation

Start SSH service
Generate failed login attempts
Review SSH logs using journalctl
Identify failed authentication events
Extract usernames
Extract source IP addresses
Generate investigation report

Windows Investigation

Query Security Event Logs
Collect Event IDs 4624 and 4625
Export results into CSV
Count successful and failed logons
Generate investigation summary


Investigation Findings:

Linux:

Multiple failed SSH authentication attempts detected.
Invalid username:
fakeuser

Source:

::1

Authentication failures were successfully recorded inside the SSH journal.

Windows

Recent authentication activity was successfully collected from the Windows Security log.

| Event ID | Description      |
| -------- | ---------------- |
| 4624     | Successful Logon |
| 4625     | Failed Logon     |

The PowerShell automation exported all collected events into a timestamped CSV for further analysis.

IOC Summary:

Linux

| IOC            | Value           |
| -------------- | --------------- |
| Username       | fakeuser        |
| Source Address | ::1             |
| Service        | OpenSSH         |
| Log Source     | journalctl      |
| Event          | Failed password |


Windows:

| IOC               | Value                |
| ----------------- | -------------------- |
| Log Source        | Windows Security Log |
| Event IDs         | 4624, 4625           |
| Export Format     | CSV                  |
| Collection Method | PowerShell           |


Automation:

Linux

Custom Bash automation:

scripts/log_analyzer.sh

Features

Accepts SSH log file
Extracts failed login attempts
Counts repeated source IPs
Generates timestamped report
Displays analyst summary


Windows

Custom PowerShell automation:

scripts/event_collector.ps1

Features

Collects latest Event IDs 4624 and 4625
Exports results to CSV
Generates timestamped output
Displays summary of successful vs failed logons

Repository Structure

SSH-BruteForce-Detection-and-Investigation/

│

├── investigation/

│ ├── attack_simulation.md

│ ├── investigation_report.md

│ └── ioc_summary.md

├── reports/

│ ├── sample_report.txt

├── scripts/

│ ├── log_analyzer.sh

│ └── event_collector.ps1

├── screenshots/

│ ├── ssh_service_started.png

│ ├── failed_login_attempts.png

│ ├── journalctl_logs.png

│ ├── script_execution.png

│ └── generated_report.png

└── README.md

Screenshots

Linux

SSH service started
Failed SSH login attempts
journalctl authentication logs
Bash automation execution
Generated SSH investigation report

Windows

Security Event Log (4624)
Security Event Log (4625)
PowerShell event collector execution
Exported CSV report

Skills Demonstrated


Linux Authentication Investigation
Windows Security Event Analysis
SSH Authentication Monitoring
Event ID Analysis (4624 & 4625)
Bash Scripting
PowerShell Automation
Log Analysis
IOC Extraction
Security Event Investigation
Incident Documentation
SOC Investigation Workflow
Security Reporting

Future Improvements


Detect brute-force attacks based on configurable thresholds.
Correlate Linux and Windows authentication events.
Generate HTML or PDF investigation reports.
Integrate with SIEM platforms such as Splunk or Microsoft Sentinel.
Automate IOC extraction and alert generation.
Add Sigma detection rules for SSH and Windows authentication events.

