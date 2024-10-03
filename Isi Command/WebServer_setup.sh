echo nameserver 10.68.2.1 > /etc/resolv.conf
echo nameserver 10.68.1.1 >> /etc/resolv.conf

apt-get update
apt-get install lynx apache2 php libapache2-mod-php7.0 wget unzip -y

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/it09.conf

rm /etc/apache2/sites-enabled/000-default.conf

cat <<EOT > /etc/apache2/sites-available/it09.conf
<VirtualHost *:8080>
ServerAdmin webmaster@localhost
DocumentRoot /var/www/html
</VirtualHost>
EOT

cat <<EOT > /etc/apache2/ports.conf
Listen 80
Listen 8080

<IfModule ssl_module>
    Listen 443
</IfModule>

<IfModule mod_gnutls.c>
    Listen 443
</IfModule>
EOT

a2ensite it09.conf

mkdir -p /var/www/html/configuration/

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O /var/www/html/configuration/lb.zip

unzip /var/www/html/configuration/lb.zip -d /var/www/html/configuration/

mv /var/www/html/configuration/worker/index.php /var/www/html/

rm -rf /var/www/html/configuration/

service apache2 start