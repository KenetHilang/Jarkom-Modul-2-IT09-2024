#!/bin/bash

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install -y bind9 bind9utils bind9-doc dnsutils

mkdir /etc/bind/it09

echo 'zone "sudarsana.it09.com" {
	type master;
	notify yes;
	also-notify { 10.68.1.1; };
    allow-transfer { 10.68.1.1; };
	file "/etc/bind/it09/sudarsana.it09.com";
};

zone "pasopati.it09.com" {
	type master;
	notify yes;
	also-notify { 10.68.1.1; };
    allow-transfer { 10.68.1.1; };
	file "/etc/bind/it09/pasopati.it09.com";
};

zone "rujapala.it09.com" {
	type master;
	notify yes;
	also-notify { 10.68.1.1; };
    allow-transfer { 10.68.1.1; };
	file "/etc/bind/it09/rujapala.it09.com";
};

zone "2.68.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.68.1.1; };
    allow-transfer { 10.68.1.1; };
    file "/etc/bind/it09/2.68.10.in-addr.arpa";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/it09/sudarsana.it09.com
cp /etc/bind/db.local /etc/bind/it09/pasopati.it09.com
cp /etc/bind/db.local /etc/bind/it09/rujapala.it09.com
cp /etc/bind/db.local /etc/bind/it09/2.68.10.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sudarsana.it09.com. root.sudarsana.it09.com. (
                            2         ; Serial
                       604800         ; Refresh
                        86400         ; Retry
                      2419200         ; Expire
                       604800 )       ; Negative Cache TTL
;
@       IN      NS      sudarsana.it09.com.
@       IN      A       10.68.2.7
@       IN      AAAA    ::1
www     IN      CNAME   sudarsana.it09.com.
cakra   IN      A       10.68.2.4
' > /etc/bind/it09/sudarsana.it09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it09.com. root.pasopati.it09.com. (
                            2         ; Serial
                       604800         ; Refresh
                        86400         ; Retry
                      2419200         ; Expire
                       604800 )       ; Negative Cache TTL
;
@       IN      NS      pasopati.it09.com.
@       IN      A       10.68.2.5
@       IN      AAAA    ::1
www     IN      CNAME   pasopati.it09.com.
ns1     IN      A     10.68.1.1
panah   IN      NS    ns1
' > /etc/bind/it09/pasopati.it09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     rujapala.it09.com. root.rujapala.it09.com. (
                            2         ; Serial
                       604800         ; Refresh
                        86400         ; Retry
                      2419200         ; Expire
                       604800 )       ; Negative Cache TTL
;
@       IN      NS      rujapala.it09.com.
@       IN      A       10.68.2.3
@       IN      AAAA    ::1
www     IN      CNAME	rujapala.it09.com.
' > /etc/bind/it09/rujapala.it09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it09.com. root.pasopati.it09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.68.10.in-addr.arpa.       IN      NS      pasopati.it09.com.
5                            IN      PTR     pasopati.it09.com.
' > /etc/bind/it09/2.68.10.in-addr.arpa

echo 'options {
        directory "/var/cache/bind";
        allow-query { any; };
        auth-nxdomain no;
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart
