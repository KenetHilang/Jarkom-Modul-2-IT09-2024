#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

# Update packages and install bind9 (DNS server)
apt-get update
apt-get install -y bind9 bind9utils bind9-doc
apt-get install dnsutils

mkdir /etc/bind/panah

# Konfigurasi bind9 untuk DNS Slave
echo 'zone "sudarsana.it09.com" {
    type slave;
    masters { 10.68.2.1; }; //IP Sriwijaya
    file "/var/lib/bind/sudarsana.it09.com";
};

zone "pasopati.it09.com" {
    type slave;
    masters { 10.68.2.1; }; //IP Sriwijaya
    file "/var/lib/bind/pasopati.it09.com";
};

zone "rujapala.it09.com" {
    type slave;
    masters { 10.68.2.1; }; //IP Sriwijaya
    file "/var/lib/bind/rujapala.it09.com";
};

zone "2.68.10.in-addr.arpa" {
    type slave;
    file "/var/lib/bind/2.68.10.in-addr.arpa";
    masters { 10.68.2.1; };  # Sriwijaya sebagai master
};

zone "panah.pasopati.it09.com" {
    type master;
    file "/etc/bind/panah/panah.pasopati.it09.com";
};' > /etc/bind/named.conf.local

echo 'options {
        directory "/var/cache/bind";
         forwarders {
              192.168.122.1;
         };
        allow-query {any;};
        auth-nxdomain no;
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

cp /etc/bind/db.local /etc/bind/panah/panah.pasopati.it09.com

echo '; Zone file for pasopati.it09.com
\$TTL 604800
@ IN SOA panah.pasopati.it09.com. root.panah.pasopati.it09.com. (
                2         ; Serial
           604800         ; Refresh
            86400         ; Retry
          2419200         ; Expire
           604800 )       ; Negative Cache TTL

@     IN  NS    panah.pasopati.it09.com.
@     IN  A     10.68.2.5
@     IN  AAAA   ::1
www   IN  CNAME panah.pasopati.it09.com.
log     IN      A       10.68.2.5
www.log IN  CNAME   log.panah.pasopati.it09.com.
' > /etc/bind/panah/panah.pasopati.it09.com

# Restart BIND9 dan enable service
service bind9 restart

echo "Setup Majapahit (DNS Slave) selesai."
