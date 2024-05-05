https://www.cisco.com/c/en/us/support/ios-nx-os-software/ios-15-0s/products-command-reference-list.html
https://www.cisco.com/c/en/us/td/docs/ios/fundamentals/command/reference/cf_book.html
[text](2302.md)

## Base

**hostname** *name*  
**no ip domain-lookup**  
**logging synchronous**   
**enable secret** *password*  
**banner motd** <delimiter message delimiter>  
**clock rate 64000**  


### Modes

**interface** *{f0/0 s0/0 vlan}*  
**interface range** f0/1 , f0/3-9, f0/11-24,  g0/2  
**line** *{console|vty}*  

## Interfaces  
description *description-text*   
**ip address** *ipv4-address* *subnet-mask*   
**ipv6 address** *ipv6-address/prefix-length*   
**ip default-gateway** *ip-address*  
**no shutdown**  



## Ip route
```
ip route address mask {address | interface} [distance] [tag tag] [permanent]
```

## SSH 
```
(config)# ip domain-name
(config)# username your_username secret your_password
(config)# crypto key generate rsa

(config)# line vty 0 15  
(config-line)# transport input ssh  
(config-line)# login [local]
```


### SEC
```
service password-encrpyption
security passwords min-length 
login block-for 120 attempts 3 within 60
exec-timeout *minutes* *seconds* *[line]*
no ip http server - disable http
auto secure
```

### CONFIGS
```
write memory
{show|copy|erase}running-config |startup-config
write memory
reload
dir [flash | nvram]
clock set 
mdix auto
router rip
version 2
debug ip rip
ipv6 address 2001:DB8:ACAD:A::1/64
ipv6 address fe80::1 link-local
ip ssh version 2
ip ssh time-out 120
username netadmin privilege 15 secret Cisco_CCNA7
ipv6 unicast-routing
username netadmin privilege 15 secret Cisco_CCNA7
```

### SHOWS
```
show {ip|ipv6} interface [brief] - сводка по всем интерфейсам, их IP и состоянию  
show {ip|ipv6} route - отображает таблицу маршрутизации из ОЗУ  
show interfaces [interface]- статистические сведения по интерфейсам, либо конкретному  
show ip [protocols|ports all]  
show [control-plane host | open-ports]  
```

----------

ssh your_username@router_ip_address


duplex auto
speed auto


## DHCP
(config)# **ip dhcp pool** LAN-address  

(dhcp-config)# **network** 172.168.0.0 255.255.0.0  
(dhcp-config)# **domain-name** cisco.com  
(dhcp-config)# **dns-server** 172.16.1.103 172.16.2.103  
(dhcp-config)# **default-router** 172.16.1.100  
(dhcp-config)# **lease** 2 (not working is PKT)  

(config)# **ip dhcp excluded-address** 172.16.1.100 172.16.1.103   

\# **show running-config **

## NAT
(config)# **interface** g0/0/0  
(config-if)# **ip address** 172.31.232.182 255.255.255.0  
(config-if)# **ip nat inside**   
(config-if)# **interface** g0/0/1   
(config-if)# **ip nat outside**   
(config-if)# **ip address** 209.165.201.1 255.255.255.252  
(config)# **ip nat inside source static** 172.31.232.14 209.165.202.130  
\# **show running-config **




