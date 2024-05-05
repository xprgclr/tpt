- [27.03.2024 Kohtvõrgu komponentide paigaldus](#27032024-kohtvõrgu-komponentide-paigaldus)
- [08.04.2024 Kohtvõrgu komponentide paigaldus II](#08042024-kohtvõrgu-komponentide-paigaldus-ii)
- [09.04.2024 Operatsioonisüsteemide sidumine](#09042024-operatsioonisüsteemide-sidumine)
- [10.04.2024 Operatsioonisüsteemide sidumine II](#10042024-operatsioonisüsteemide-sidumine-ii)
- [22.04.2024 Kohtvõrgu komponentide paigaldus III](#22042024-kohtvõrgu-komponentide-paigaldus-iii)
- [24.04.2024  Operatsioonisüsteemide sidumine III](#24042024--operatsioonisüsteemide-sidumine-iii)
- [Actual](#actual)




## 27.03.2024 Kohtvõrgu komponentide paigaldus
- http://veeremaa.tpt.edu.ee/2013/pt-dhcp-web-mail.htm

```4.5.6.16/28 NETWORK (NA)
4.5.6.17 GW
4.5.6.18 DNS
4.5.6.19 DHCP
4.5.6.20 MAIL
4.5.6.21 WEB
4.5.6.22 SWITCH
4.5.6.23-30 DHCP pool
```

## 08.04.2024 Kohtvõrgu komponentide paigaldus II
- https://computernetworking747640215.wordpress.com/2018/07/05/vlan-configuration-on-a-cisco-switch-in-packet-tracer/
- https://www.packettracernetwork.com/tutorials/dhcpconfiguration.html
- https://www.juniper.net/documentation/en_US/junos/topics/concept/layer-2-networking-ethernet-frame-forwarding-802-1q-vlan-tag-mx-solutions.html


```[08.04 17:40] Vadim Veeremaa
interface FastEthernet0/0.10
encapsulation dot1Q 10
ip address 192.168.10.254 255.255.255.0
ip helper-address 172.16.24.2
[08.04 17:40] Vadim Veeremaa
interface FastEthernet0/0.20
encapsulation dot1Q 20
ip address 192.168.20.254 255.255.255.0
ip helper-address 172.16.24.2
[08.04 17:41] Vadim Veeremaa
interface FastEthernet0/1
ip address 172.16.24.1 255.255.0.0
```

- https://www.packettracernetwork.com/tutorials/radiusconfiguration.html
- http://veeremaa.tpt.edu.ee/2014/auth-lab.htm

- [08042024_1.pkt](_rsrcnet/08042024_1.pkt)
- [08042024_2.pkt](_rsrcnet/08042024_2.pkt)


## 09.04.2024 Operatsioonisüsteemide sidumine
LDAP  
- [Debian10.ova](https://tptliveee-my.sharepoint.com/:u:/g/personal/vadim_veeremaa_tptlive_ee/EezxSQClB-VDmIXJaXnTgM8BwKfbJuOthoryEHrjWze5wg?e=iGqT5T)  
- http://mirror.turnkeylinux.org/turnkeylinux/images/ova/turnkey-openldap-16.1-buster-amd64.ova  
- [LDAP-IT-19E 1.txt](<_rsrcnet/LDAP-IT-19E 1.txt>)  
- https://blog.invgate.com/what-is-ldap  
- https://habr.com/ru/articles/538662/  
- https://itmaili.weebly.com/

```
apt update
apt install ldap-utils
```

ldapsearch -x -H ldap://192.168.1.149:389 -b "cn=admin,ou=jur,dc=kaar,dc=ee" -s base '(objectclass=*)'

- https://www.packettracernetwork.com/tutorials/radiusconfiguration.html
- https://www.telia.ee/ettevottest/voimalused-tudengile/


## 10.04.2024 Operatsioonisüsteemide sidumine II
Mikrotik  
pptp VPN

- http://veeremaa.tpt.edu.ee/2011/mikrotik.htm
- https://help.mikrotik.com/docs/display/ROS/First+Time+Configuration
- [mikrotik-pptp-vpn.txt](_rsrcnet/mikrotik-pptp-vpn.txt)


## 22.04.2024 Kohtvõrgu komponentide paigaldus III
- https://www.packettracernetwork.com/tutorials/voipconfiguration.html
- https://www.packettracernetwork.com/tutorials/voip-devices.html

- [sslvpn-lab.txt](_rsrcnet/sslvpn-lab.txt)
- [22042024_1.pkt](_rsrcnet/22042024_1.pkt)   
- [22042024_2.pkt](_rsrcnet/22042024_2.pkt) 



## 24.04.2024  Operatsioonisüsteemide sidumine III

- [SSH key-putty-to-linux-kit22v.txt](<_rsrcnet/SSH key-putty-to-linux-kit22v.txt>)
- https://bitlaunch.io/blog/how-to-connect-to-ssh-with-putty/
***

- [SSH key-linux-to-linux.txt](<_rsrcnet/SSH key-linux-to-linux.txt>)
- https://phoenixnap.com/kb/generate-ssh-key-debian-10




## Actual


- https://itmaili.weebly.com/wds.html

- http://veeremaa.tpt.edu.ee/2013/wds-lab.html

- [Win7.ova](https://tptliveee-my.sharepoint.com/:u:/g/personal/vadim_veeremaa_tptlive_ee/EecxBdctQixFq33LzSn8P0YBBlL68d9K-kKOWjiSnh21Kg?e=ClqdzE)
- [Win10.ova](https://tptliveee-my.sharepoint.com/:u:/g/personal/vadim_veeremaa_tptlive_ee/EYNbBNtcaxhDngt-1dG1m0sBkOrhoksyuaMXleLo5jPAgg?e=emwW4w)
- [Server 2019.ova](https://tptliveee-my.sharepoint.com/:u:/g/personal/vadim_veeremaa_tptlive_ee/EdqSmaG7u8NLsIUznQpgIg0Ba3dJ2mBjYbNZ2g-UeO4IzA?e=I3g86D)
- [Server 2016.ova](https://tptliveee-my.sharepoint.com/:u:/g/personal/vadim_veeremaa_tptlive_ee/Ef41eSnjqmRElhYx65SGfqkB5dukfyrBwYtR2zsmFirXRQ?e=fIu2Tt)





-----------------------------------------------------------

