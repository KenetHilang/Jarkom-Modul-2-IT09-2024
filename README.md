# Jarkom-Modul-2-IT09-2024

## Angggota

| Anggota | NRP  |
| ------- | --- |
| Michael Kenneth Salim | 5027231008 |
| Tio Axelino | 50272310XX |

## List IP Address

| Nama Kota   | Interface | IP Address | Getaway |
| ----------- | --------- | ---------- | ------- |
| Nusantara   |    eth1       |    10.68.1.2        |         |
| 			  |    eth2       |    10.68.2.2        |         |
| Sriwijaya   |    eth0       |    10.68.2.1        |  10.68.2.2       |
| Tanjungkulai|    eth0       |    10.68.2.3        |  10.68.2.2       |
| Bedahulu    |    eth0       |    10.68.2.4        |  10.68.2.2      |
| Kotalingga   |    eth0       |    10.68.2.5        | 10.68.2.2        |
| Srikandi       |    eth0       |    10.68.2.6        | 10.68.2.2        |
| Solok       |    eth0       |    10.68.2.7        | 10.68.2.2        |
| Majapahit  |    eth0       |    10.68.1.1        |  10.68.1.2       |
| Mulawarman  |    eth0       |    10.68.1.3        | 10.68.1.2        |
| GrahamBell  |    eth0       |    10.68.1.4        | 10.68.1.2        |
| Samaratungga  |    eth0       |    10.68.1.5       | 10.68.1.2        |

## Soal Nomer 1
Untuk mempersiapkan peperangan World War MMXXIV (Iya sebanyak itu), Sriwijaya membuat dua kotanya menjadi web server yaitu Tanjungkulai, dan Bedahulu, serta Sriwijaya sendiri akan menjadi DNS Master. Kemudian karena merasa terdesak, Majapahit memberikan bantuan dan menjadikan kerajaannya (Majapahit) menjadi DNS Slave. 

## Soal Nomer 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke Solok dengan alamat sudarsana.xxxx.com dengan alias www.sudarsana.xxxx.com, dimana xxxx merupakan kode kelompok. Contoh: sudarsana.it01.com.

### Nusantara Config
```sh
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.68.1.2
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.68.2.2
	netmask 255.255.255.0
```

### Sriwijaya Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.1
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Tanjungkulai Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.3
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Bedahulu Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.4
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Kotalingga Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.5
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Srikandi Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.6
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Solok Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.2.7
	netmask 255.255.255.0
	gateway 10.68.2.2
```

### Majapahit Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.1.1
	netmask 255.255.255.0
	gateway 10.68.1.2
```

### Mulawarman Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.1.3
	netmask 255.255.255.0
	gateway 10.68.1.2
```

### GrahamBell Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.1.4
	netmask 255.255.255.0
	gateway 10.68.1.2
```

### Samaratungga Config
```sh
auto eth0
iface eth0 inet static
	address 10.68.1.5
	netmask 255.255.255.0
	gateway 10.68.1.2
```

## Set Sriwijaya (DNS Master)

Download Update dan alat alat yg dibutuhkan
```sh
apt-get update

apt-get install bind9 -y
```


### isi dari folder `/etc/bind/named.conf.local`

Masukkan Teks ini ke dalam file tersebut

```sh
zone "sudarsono.it09.com" {
	type master;
	file "/etc/bind/it09/sudarsono.it09.com";
};
```

```sh
mkdir /etc/bind/it09

cp /etc/bind/db.local /etc/bind/it09/sudarsono.it09.com

nano /etc/bind/it09/sudarsono.it09.com
```


Masukkan kode ini ke dalam `/etc/bind/it09/sudarsono.it09.com`
```sh
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sudarsono.it09.com. root.sudarsono.it09.com. (
                            2         ; Serial
                       604800         ; Refresh
                        86400         ; Retry
                      2419200         ; Expire
                       604800 )       ; Negative Cache TTL
;
@       IN      NS      sudarsono.it09.com.
@       IN      A       10.68.2.7
@       IN      AAAA    ::1
www		IN		CNAME	sudarsono.it09.com.

```

### Shell Solok

Masukkan IP dari Sriwijaya ke file resolv.conf
```sh
echo nameserver 10.68.2.1 > /etc/resolv.conf
```

```sh
zone "pasopati.it09.com" {
	type master;
	file "/etc/bind/it09/pasopati.it09.com";
};
```


### Shell

Masukkan ini ke dalam `/etc/bind/it09/pasopati.it09.com`
```sh
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
@       IN      A       10.68.2.6
@       IN      AAAA    ::1
www		IN		CNAME	pasopati.it09.com.
```

Masukkan ini ke dalam `/etc/bind/it09/rujapala.it09.com`
```sh
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
www	IN	CNAME	rujapala.it09.com.
```

Untuk semua Client
```sh
echo nameserver 10.68.2.1 > /etc/resolv.conf
```

## Nomer 6

```sh
mkdir /etc/bind/it09/2.68.10.in-addr.arpa
```

```sh
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
```

### Master Config
```sh
zone "sudarsono.it09.com" {
	type master;
	notify yes;
	also-notify { 10.68.1.1; };
    allow-transfer { 10.68.1.1; };
	file "/etc/bind/it09/sudarsono.it09.com";
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
	file "/etc/bind/it09/rujapala.it09.com";
};

```

### Slaves Config

```sh
zone "sudarsono.it09.com" {
    type slave;
    masters { 10.68.2.1; }; //IP Sriwijaya
    file "/var/lib/bind/sudarsono.it09.com";
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
```