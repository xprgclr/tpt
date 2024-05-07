
- [06.05.2024 ssh](#06052024-ssh)
- [07.05.2024 samba](#07052024-samba)
  - [Serv](#serv)
  - [Client](#client)
  - [WinClient](#winclient)
  - [OthrWin](#othrwin)
  - [/etc/samba/smb.conf](#etcsambasmbconf)

## 06.05.2024 ssh



```
# sudo su -
-- or
# sudo -i
```
-
```
useradd -s /bin/bash -m username
pwd
su - anna
```
-
```
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys && nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```
-
```
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -b 4096
ls -al ~/.ssh
ssh-copy-id anna@ssh-server-ip
ssh anna@ssh-server-ip
```

## 07.05.2024 samba 

### Serv

```
apt install samba smbclient
systemctl status smbd
cp /etc/samba/smb.conf /etc/samba/smb.conf.back

mkdir /var/samba && chmod 777 /var/samba
echo "" > /etc/samba/smb.conf

smbpasswd -a it
systemctl restart smbd
smbclient -L localhost
```


### Client
```
apt install smbclient cifs-utils
smbclient //192.168.0.124/public -U i
mkdir -p /mnt/public
mount -t cifs -o username=it //192.168.0.124/public /mnt/public
df -h
```
### WinClient
- \\SERVERIP\public

- net use * \\192.168.0.124\public /user:it
- net use
- net use Z: /delete

### OthrWin
How to log out from network path

1. From the Start menu, select Control Panel.
2. Click User Accounts.
3. Click Credential Manager.
4. In the Windows Credentials and Generic Credentials section, remove any stored credentials referencing shares, network drives or similar: Click (Details).
5. Click Remove from vault.
6. Click Yes on the warning box.
7. Repeat these steps until you remove all of the credentials associated with network shares.
8. Close the Control Panel window.

OR  
From CLI  
net use \\SERVERIP\share /DELETE  

### /etc/samba/smb.conf
```
##[global]
   workgroup = WORKGROUP
   dns proxy = no
   log file = /var/log/samba/log.%m
   max log size = 1000
   syslog = 0
   panic action = /usr/share/samba/panic-action %d
   server role = standalone server
   passdb backend = tdbsam
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change = yes
   map to guest = bad user
   usershare allow guests = yes
[homes]
   comment = Home Directories
   path = /home/it
   browseable = yes
   read only = yes
   create mask = 0700
   directory mask = 0700
   valid users = %S
[printers]
   comment = All Printers
   browseable = no
   path = /home/it
   printable = yes
   guest ok = no
   read only = yes
   create mask = 0700
[print$]
   comment = Printer Drivers
   path = /var/lib/samba/printers
   browseable = yes
   read only = yes
   guest ok = no
[public]
  comment = public anonymous access
  path = /var/samba/
  browsable =yes
  create mask = 0660
  directory mask = 0771
  writable = yes
  guest ok = yes
  ```


