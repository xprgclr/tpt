# _ Collect
- [\_ Collect](#_-collect)
  - [Task Brief from Teams](#task-brief-from-teams)
  - [Предварительные настройки NIC в VirtualBox](#предварительные-настройки-nic-в-virtualbox)
  - [Main PC ( like rsyslog server role )](#main-pc--like-rsyslog-server-role-)
  - [Clone PC ( like rsyslog client role )](#clone-pc--like-rsyslog-client-role-)
  - [Testing and complete](#testing-and-complete)
  - [Done](#done)


## Task Brief from Teams
<details open><summary>Вводные данные от Кирилла [Open]</summary>

|                                     |                                                  |
| ----------------------------------- | ------------------------------------------------ |
| Краткий экскурс от Кирилла по теме  | [DIAG-06022024.pdf](_rsrc/krl/DIAG-06022024.pdf) |
| То же самое, только в Markdown      | [DIAG-06022024.md](_rsrc/krl/DIAG-06022024.md)   |
| Настройки firewall на всякий случай | [HOSTFW.jpg](_rsrc/krl/HOSTFW.jpg)           |
| Настройки сети в VirtualBox         | [STATICVBOX.jpg](_rsrc/krl/STATICVBOX.jpg)       |

Инструкции
Привет. Мне нужно собрать системные журналы с 2 машин на 3 со статическим ip.
Все 3 используют debian 12.
Помогите мне настроить rsyslog daemon для достижения этой цели.

https://chat.openai.com/share/1a568050-c320-4ce0-b125-c629a1ad17a6

Задача. Отправьте что-нибудь в файл журнала вашего компьютера (CLONE1 и CLONE2)с помощью программы logger
Покажите в файле журнала компьютера 3DA (НЛО), что ваши сообщения были получены.


</details>



## Предварительные настройки NIC в VirtualBox

- Делаем NAT Networking как на скрине в прикрепе у Кирилла, а именно - убираем DHCP и делаем проброс портов.

![](_rsrc/krl/STATICVBOX.jpg)


## Main PC ( like rsyslog server role )

- Задаём статик IPv4 в  ***/etc/network/interfaces***

```
# The loopback network interface
auto lo
iface lo inet loopback

allow-hotplug enp0s3
iface enp0s8 inet static
        address 10.0.2.200
        netmask 255.255.255.0
        gateway 10.0.2.2
        dns-search google.com
        dns-nameservers 192.168.0.1
```


- Теперь можно подсосаться к нему по ssh с компа  
`ssh на it@127.0.0.200 `

- Чтобы не запутаться в 3х виртуалках, задаём им разные имена хостов готовым скриптом - [hostrename.sh](_rsrc/hostname.sh). Имя хоста вписывать аргументом скрипта.

- ставим rsyslog   
`apt-get install rsyslog`

- В файле ***/etc/rsyslog.conf*** делаем раскомент следущих строк. Либо если их там нет, то добавляем.

```bash
# Provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")
# Provides TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="514")
```
> Эти строки конфигурации rsyslog позволяют серверу принимать syslog-сообщения как по протоколу UDP, так и по протоколу TCP на порту 514. Это полезно для централизованного сбора и анализа логов с нескольких источников в сети. © ChatGPT

- Рестартим севис  
`systemctl restart rsyslog`

## Clone PC ( like rsyslog client role )

Все шаги аналогичные за исключением нескольких вещей:

- IP-адрес естественно задаём другой (201,202,etc..), как и имя хоста  
- На клиенте/ах в файле ***/etc/rsyslog.conf*** настраиваем правило на перенаправление, а не на приём (как это делали на "сервере"):
```bash
*.* @10.0.2.200:514
```
> Эта строка конфигурации rsyslog определяет правило для перенаправления всех syslog-сообщений на удаленный сервер syslog с IP-адресом 10.0.2.200 и портом 514 по протоколу UDP. © ChatGPT

## Testing and complete

- Добавляем рандомную запись в журнал, а на сервере, и на клиенте:  
`"logger "test from UFO Server"`/`"logger "test from Clone Client"`

- Смотрим и на клиенте и на сервере. На клиенте должны быть клиентские логи, на сервере и свои и других машин с этой же сети, отправленные ранее:  
`cat /var/log/syslog | tail -n 3`


## Done

![alt text](_rsrc/image.png)

- Скрипт для показа interfaces , rsyslog.conf, логов:  
[show.sh](_rsrc/show.sh)

- Лог сессии:  
[session.html](_rsrc/session.html)