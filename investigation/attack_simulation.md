# Attack Simulation

## Objective

Generate repeated failed SSH authentication attempts and collect the resulting authentication logs for investigation.

---

## Lab Environment

Host: Kali Linux

SSH Service: OpenSSH

---

## Steps Performed

### 1. Start SSH Service

sudo systemctl start ssh


Verified service status:


sudo systemctl status ssh


---

### 2. Generate Failed Authentication Attempts

A non-existent user account was used to simulate unauthorized login attempts.

ssh fakeuser@localhost


An incorrect password was entered multiple times.

Result:


Permission denied (publickey,password).


---

### 3. Review Authentication Logs

The SSH authentication events were reviewed using systemd journal.


sudo journalctl -u ssh


To isolate failed authentication events:


sudo journalctl -u ssh | grep "Failed password"


---

### 4. Export Log File

Authentication logs were exported for offline analysis.


sudo journalctl -u ssh > ssh_auth.log


---

## Result

Multiple failed SSH authentication attempts were successfully recorded in the authentication log and used as input for automated log analysis.