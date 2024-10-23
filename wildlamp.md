
- [Установка Debian на Virtualbox](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20Debian%20%D0%BD%D0%B0%20Virtualbox)
- [Установка LAMP](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20LAMP)
	- [Добавление сайта](#%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%D0%B0%D0%B9%D1%82%D0%B0)
	- [Установка Wildfly](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20Wildfly)


## Установка Debian на Virtualbox
-

## Установка LAMP

[How To Install Linux, Apache, MariaDB, PHP (LAMP) stack on Debian 11 | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mariadb-php-lamp-stack-on-debian-11)

[tpt/Nelus_tpt/9_lamp/README.md at main · xprgclr/tpt](https://github.com/xprgclr/tpt/blob/main/Nelus_tpt/9_lamp/README.md)

```
sudo -i
apt install -y apache2
apt install -y mariadb-server mariadb-client
apt install php libapache2-mod-php php-mysql
php -v
```

### Добавление сайта

Чтобы добавить новый порт нужно в файле **/etc/apache2/ports.conf** добавить строку
Listen 8081 например

Идём в **/etc/apache2/sites-available/** и создаем там конфиг для нового сайта, например **mywebsite.conf** и добавляем след. конфигурацию в файл:

```
<VirtualHost *:8081>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/mywebsite
    ServerName mywebsite.local
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

где **DocumentRoot** меняем на путь к файлам(директории)
и **ServerName**  на доменное имя ( если нет доменного имени то можем закоментировать #)
создаем директорию для файла сайа и кидаем туда **index.html**
`sudo mkdir /var/www/mywebsite`

Активизация сайта и рестарт апача
```
sudo a2ensite mywebsite.conf
sudo systemctl restart apache2
```

Если включен брандмауер, открываем порт
`sudo ufw allow 8081/tcp`

Теперь ваш сайт должен быть доступен по IP-адресу сервера и порту 8081, например: [http://your-server-ip:8081](http://your-server-ip:8081).

P.S: возможно нужно менять права пользователя на папку через
`sudo chown -R $USER:$USER /var/www/your_domain`

### Настройка Mariadb
-


## Установка Wildfly

> Links:
[How to Install WildFly Java Application Server with Nginx on Ubuntu 22.04](https://www.youtube.com/watch?v=nDclAK-E4Do)
[How to Install WildFly Application Server on Ubuntu](https://www.youtube.com/watch?v=yKNp1VnjGVI&list=LL&index=1)
[How to Install and Configure WildFly (JBoss) on Debian 11](https://www.howtoforge.com/how-to-install-and-configure-wildfly-jboss-on-debian-11/)


```
java --version
sudo -i
groupadd -r wildfly
useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly

wget https://github.com/wildfly/wildfly/releases/download/33.0.2.Final/wildfly-33.0.2.Final.zip
unzip wildfly-33.0.2.Final.zip
mv wildfly-33.0.2.Final /opt/wildfly
chown -RH wildfly: /opt/wildfly

mkdir -p /etc/wildfly
cp /opt/wildfly/wildfly-33.0.2.Final/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly
cp /opt/wildfly/wildfly-33.0.2.Final/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system
cp /opt/wildfly/wildfly-33.0.2.Final/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
chmod +x /opt/wildfly/bin/*.sh


systemctl daemon-reload
systemctl start wildfly
systemctl enable wildfly
systemctl status wildfly
```
