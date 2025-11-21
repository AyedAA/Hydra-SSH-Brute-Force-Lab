# 🔵 AyedCTF — Hydra SSH Brute-Force Lab

A beginner-friendly and realistic lab that demonstrates **how weak SSH password configurations can be exploited** using Hydra.  
This lab is designed to simulate a vulnerable machine with misconfigurations, flags, and a full attacker workflow — exactly like TryHackMe & HackTheBox rooms.

---

## 🎯 Objectives

In this lab, you will:

- Enumerate local users
- Brute-force SSH using Hydra
- Gain access to a weak user account
- Capture the **User Flag**
- Exploit a sudo misconfiguration
- Escalate to root
- Capture the **Root Flag**

Perfect for:

- Cybersecurity learners
- CTF beginners
- Password security awareness training
- Students testing brute-forcing techniques

---

## 🛠️ Setup Instructions

Run the setup script:

```bash
sudo ./setup.sh
This script will:

Create a vulnerable user: victim

Set a weak password (to be brute-forced)

Add a user flag at: /home/victim/user.txt

Add a root flag at: /root/root.txt

Add a sudo privilege escalation vulnerability

Start & enable SSH service

Generate a sample wordlist for Hydra

🔐 Lab Environment
Component	Value
Target User	victim
SSH Host	localhost
Port	22
Wordlist	pass.txt
Method	Hydra brute-force
PrivEsc	sudo NOPASSWD misconfiguration

🚀 Start the Challenge
After running setup.sh, begin with:

bash
Copy code
cat /etc/passwd | grep /home
Then attempt SSH brute-force using Hydra.

🏁 Flags
🟦 User Flag
Located at:

arduino
Copy code
/home/victim/user.txt
Format:

Copy code
ayedCTF{ssh_bruteforce_success}
🔴 Root Flag
Located at:

bash
Copy code
/root/root.txt
Format:

Copy code
ayedCTF{root_privesc_master}
📄 Solution
See solution.md for the full walkthrough.

⚠️ Legal Disclaimer
This lab is for educational purposes only.
Do NOT use these techniques on any system you do not own or manage with explicit permission.

👤 Author
Ayed A. Areda
GitHub: https://github.com/AyedAA

yaml
Copy code
```
