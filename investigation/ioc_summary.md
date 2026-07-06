# Indicators of Compromise (IOC) Summary

## Overview

The following indicators were identified during the investigation of simulated SSH authentication failures on the Kali Linux host.

---

## Network Indicators

| Indicator | Value |
|----------|-------|
| Source IP Address | ::1 (IPv6 Loopback) |
| Destination Host | localhost |
| Destination Port | 22/TCP |
| Protocol | SSH |

---

## User Indicators

| Indicator | Value |
|----------|-------|
| Attempted Username | fakeuser |
| Authentication Result | Failed |

---

## Log Source

| Source | Description |
|--------|-------------|
| systemd Journal | SSH authentication events collected using `journalctl -u ssh` |
| Exported Log File | `ssh_auth.log` |

---

## Observed Log Entries

The investigation identified the following authentication events:

- `Invalid user`
- `Failed password`
- `authentication failure`
- `Connection closed`
- `PAM authentication failure`

---

## Attack Characteristics

| Indicator | Observation |
|----------|-------------|
| Attack Type | Simulated SSH Brute-Force Authentication Attempts |
| Number of Failed Attempts | 3 |
| Successful Logins | None |
| SSH Service | OpenSSH |
| Detection Method | Manual log review and Bash automation |

---

## MITRE ATT&CK Mapping

| Technique | ID |
|----------|-----|
| Brute Force | T1110 |
| Password Guessing | T1110.001 |

---

## Analyst Notes

The authentication failures originated from the local loopback interface (`::1`) because the attack was intentionally simulated on the same Kali Linux host using an invalid account (`fakeuser`). No successful authentication events were observed during the investigation.