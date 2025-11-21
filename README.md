# 🔵 AyedCTF — Hydra SSH Brute-Force Lab

A beginner-friendly and realistic lab demonstrating how weak SSH credentials can be exploited using **Hydra**.  
This lab simulates a vulnerable environment similar to TryHackMe and HackTheBox rooms.

---

## 🎯 Objectives

- Enumerate local users  
- Brute-force SSH login  
- Access a weak user account  
- Capture the **User Flag**  
- Escalate permissions via sudo misconfiguration  
- Capture the **Root Flag**

---

## 🛠️ Setup Instructions

### 1) Make the script executable

```bash
chmod +x setup.sh
````

### 2) Run the setup script

```bash
sudo ./setup.sh
```

---

## ✔️ What the setup script does

* Creates a vulnerable user: `victim`
* Assigns a weak password (for brute-force testing)
* Places a user flag at:

  ```
  /home/victim/user.txt
  ```
* Places a root flag at:

  ```
  /root/root.txt
  ```
* Adds a privilege escalation path via sudo misconfiguration
* Enables and starts the SSH service
* Generates a Hydra-ready wordlist: `pass.txt`

---

## 🔐 Lab Environment

| Component      | Value                 |
| -------------- | --------------------- |
| Target User    | `victim`              |
| SSH Host       | `localhost`           |
| Port           | `22`                  |
| Wordlist       | `pass.txt`            |
| Tool Used      | Hydra                 |
| PrivEsc Vector | sudo misconfiguration |

---

## ⚠️ Legal Disclaimer

This lab is for **educational and ethical hacking training**.
Do **NOT** use these techniques on any system without explicit permission.

---

## 👤 Author

**Ayed Areda**
GitHub: [https://github.com/AyedAA](https://github.com/AyedAA)
