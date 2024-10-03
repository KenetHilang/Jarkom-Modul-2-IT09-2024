#!/bin/bash

apt-get update
apt-get install lynx apache2 -y

a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests

service apache2 start

echo '<VirtualHost *:8080>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/it02

    ProxyRequests Off
    <Proxy balancer://mycluster>
        BalancerMember http://10.68.2.3:8080
        BalancerMember http://10.68.2.4:8080
        BalancerMember http://10.68.2.5:8080
        ProxySet lbmethod=byrequests
    </Proxy>

    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

a2ensite it09.conf

service apache2 restart