# Investigation Report

## Incident Summary

Multiple failed SSH authentication attempts were identified against the local OpenSSH service.

The investigation focused on determining the affected account, source of the attempts, and frequency of authentication failures.

---

## Evidence Collected

Authentication logs were obtained using:

sudo journalctl -u ssh

Relevant events included:

- Invalid user
- Failed password
- Authentication failure
- Connection closed

---

## Findings

### Attempted Username

fakeuser

### Source Address

::1

(IPv6 loopback address)

### Service

OpenSSH


### Protocol

SSH

### Destination Port

22/TCP

### Authentication Result

Failed

---

## Analysis

The activity represents repeated authentication failures against the SSH service.

Since the source address is the IPv6 loopback (::1), the activity originated locally and was intentionally generated for testing purposes.

No evidence of successful authentication was observed.

---

## Analyst Assessment

The collected events match the expected behavior of failed SSH authentication attempts.

The generated logs provide useful artifacts for testing log analysis workflows and validating detection logic.