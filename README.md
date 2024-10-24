# Jarkom-Modul-2-IT09-2024

## Angggota

| Anggota | NRP  |
| ------- | --- |
| Michael Kenneth Salim | 5027231008 |
| Tio Axelino | 5027231065 |

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

## Soal Nomor 1
Untuk mempersiapkan peperangan World War MMXXIV (Iya sebanyak itu), Sriwijaya membuat dua kotanya menjadi web server yaitu Tanjungkulai, dan Bedahulu, serta Sriwijaya sendiri akan menjadi DNS Master. Kemudian karena merasa terdesak, Majapahit memberikan bantuan dan menjadikan kerajaannya (Majapahit) menjadi DNS Slave. 

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

## Soal Nomor 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke Solok dengan alamat sudarsana.xxxx.com dengan alias www.sudarsana.xxxx.com, dimana xxxx merupakan kode kelompok. Contoh: sudarsana.it01.com.

### Set Sriwijaya (DNS Master)

Nyalakan akses jaringan ke luar
```sh
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.68.0.0/16
```

Download Update dan alat alat yg dibutuhkan
```sh
apt-get update
apt-get install bind9 -y
```

Tambahkan isi dari folder `/etc/bind/named.conf.local`
```sh
zone "sudarsana.it09.com" {
	type master;
	file "/etc/bind/it09/sudarsana.it09.com";
};
```

Lakukan modifikasi pada folder dan file
```sh
mkdir /etc/bind/it09

cp /etc/bind/db.local /etc/bind/it09/sudarsana.it09.com

nano /etc/bind/it09/sudarsana.it09.com
```

Masukkan kode ini ke dalam `/etc/bind/it09/sudarsana.it09.com`
```sh
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
www		IN		CNAME	sudarsana.it09.com.

```

Masukkan IP dari Sriwijaya ke file resolv.conf milik Solok

```sh
echo nameserver 10.68.2.1 > /etc/resolv.conf
```

### Testing
![Testing 1](./Asset/image-1.png)

## Soal Nomor 3
Para pasukan juga perlu mengetahui mana titik yang akan diserang, sehingga dibutuhkan domain lain yaitu pasopati.xxxx.com dengan alias www.pasopati.xxxx.com yang mengarah ke Kotalingga.

Tambah isi dari folder `/etc/bind/named.conf.local`
```sh
zone "pasopati.it09.com" {
	type master;
	file "/etc/bind/it09/pasopati.it09.com";
};
```

Lakukan modifikasi pada folder dan file
```sh
cp /etc/bind/db.local /etc/bind/it09/pasopati.it09.com

nano /etc/bind/it09/pasopati.it09.com
```

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
@       IN      A       10.68.2.5
@       IN      AAAA    ::1
www		IN		CNAME	pasopati.it09.com.
```

### Testing
![Testing 2](./Asset/image.png)

## Soal Nomor 4
Markas pusat meminta dibuatnya domain khusus untuk menaruh informasi persenjataan dan suplai yang tersebar. Informasi dan suplai meme terbaru tersebut mengarah ke Tanjungkulai dan domain yang ingin digunakan adalah rujapala.xxxx.com dengan alias www.rujapala.xxxx.com.

Tambah isi dari folder `/etc/bind/named.conf.local`
```sh
zone "rujapala.it09.com" {
	type master;
	file "/etc/bind/it09/rujapala.it09.com";
};
```

Lakukan modifikasi pada folder dan file
```sh
cp /etc/bind/db.local /etc/bind/it09/rujapala.it09.com

nano /etc/bind/it09/rujapala.it09.com
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

Restart Bind9
```sh
service bind9 restart
```

### Testing
![Testing 3](./Asset/image-2.png)

## Soal Nomer 5
Pastikan domain-domain tersebut dapat diakses oleh seluruh komputer (client) yang berada di Nusantara.

Untuk semua Client
```sh
echo nameserver 10.68.2.1 > /etc/resolv.conf
```

### Testing

Pastikan Semua Client dapat mengakses 
#### GrahamBell
![GrahamBell](./Asset/Grahambell.png)

#### Mulawarman
![Mulawarman](./Asset/Mulawarman.png)

#### Samaratungga
![Samaratungga](./Asset/Samaratungga.png)

#### Srikandi
![Srikandi](./Asset/Srikandi.png)

## Nomer 6
Beberapa daerah memiliki keterbatasan yang menyebabkan hanya dapat mengakses domain secara langsung melalui alamat IP domain tersebut. Karena daerah tersebut tidak diketahui secara spesifik, pastikan semua komputer (client) dapat mengakses domain pasopati.xxxx.com melalui alamat IP Kotalingga (Notes: menggunakan pointer record).

Tambahkan isi dari folder `/etc/bind/named.conf.local`
```sh
zone "2.68.10.in-addr.arpa" {
    type master;
    notify yes;
    file "/etc/bind/it09/2.68.10.in-addr.arpa";
};
```
Lakukan modifikasi pada folder dan file
```sh
cp /etc/bind/db.local /etc/bind/it09/2.68.10.in-addr.arpa

nano /etc/bind/it09/2.68.10.in-addr.arpa
```

Masukkan ini ke dalam `/etc/bind/it09/2.68.10.in-addr.arpa`
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

### Testing
![Nomer 6](./Asset/Nomer6.png)

## Soal Nomor 7
Akhir-akhir ini seringkali terjadi serangan brainrot ke DNS Server Utama, sebagai tindakan antisipasi kamu diperintahkan untuk membuat DNS Slave di Majapahit untuk semua domain yang sudah dibuat sebelumnya yang mengarah ke Sriwijaya.

### Master Config
Ubah Config dari Sriwijaya
```sh
zone "sudarsana.it09.com" {
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
	file "/etc/bind/it09/rujapala.it09.com";
};

```

### Slaves Config
Ubah Config dari Majapahit
```sh
zone "sudarsana.it09.com" {
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
```

Restart kedua bind9 
```sh
service bind9 restart
```

### Testing
![Mati](./Asset/Mati.png)
![Testing](./Asset/Testing.png)

## Soal Nomor 8
Kamu juga diperintahkan untuk membuat subdomain khusus melacak kekuatan tersembunyi di Ohio dengan subdomain cakra.sudarsana.xxxx.com yang mengarah ke Bedahulu.

ubahlah isi dari `/etc/bind/it09/sudarsana.it09.com` menjadi seperti di bawah ini
```sh
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
```

### Testing
![chakra](./Asset/Chakra.png)

## Soal Nomor 9
Karena terjadi serangan DDOS oleh shikanoko nokonoko koshitantan (NUN), sehingga sistem komunikasinya terhalang. Untuk melindungi warga, kita diperlukan untuk membuat sistem peringatan dari siren man oleh Frekuensi Freak dan memasukkannya ke subdomain panah.pasopati.xxxx.com dalam folder panah dan pastikan dapat diakses secara mudah dengan menambahkan alias www.panah.pasopati.xxxx.com dan mendelegasikan subdomain tersebut ke Majapahit dengan alamat IP menuju radar di Kotalingga.

Ubah isi dari `/etc/bind/it09/pasopati.it09.com` di sriwijaya
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
@       IN      A       10.68.2.5
@       IN      AAAA    ::1
www     IN      CNAME   pasopati.it09.com.
ns1     IN      A     10.68.1.1
panah   IN      NS    ns1
```
### Testing
![Panah](./Asset/Panah.png)

## Soal Nomor 10
Markas juga meminta catatan kapan saja meme brain rot akan dijatuhkan, maka buatlah subdomain baru di subdomain panah yaitu log.panah.pasopati.xxxx.com serta aliasnya www.log.panah.pasopati.xxxx.com yang juga mengarah ke Kotalingga.

Ubah isi dari `/etc/bind/panah/panah.pasopati.it09.com` di Majapahit
```sh
com
; Zone file for pasopati.it09.com
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
```

### Testing
![Log](./Asset/Log.png)

## Soal Nomor 11
Setelah pertempuran mereda, warga IT dapat kembali mengakses jaringan luar dan menikmati meme brainrot terbaru, tetapi hanya warga Majapahit saja yang dapat mengakses jaringan luar secara langsung. Buatlah konfigurasi agar warga IT yang berada diluar Majapahit dapat mengakses jaringan luar melalui DNS Server Majapahit.

### Setup DNS pada DNS Master

Edit file `/etc/bind/named.conf.options` menjadi seperti berikut ini

```sh
options {
    directory \"/var/cache/bind\";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

	forwarders {
		192.168.122.1;
	};

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    //dnssec-validation auto;
    allow-query {any;};

    auth-nxdomain no;
    listen-on-v6 { any; };
}
```

Merestart service dari bind9

```sh
service bind9 restart
```

### Testing
![Test](./Asset/Test.png)

## Soal Nomor 12
Karena pusat ingin sebuah laman web yang ingin digunakan untuk memantau kondisi kota lainnya maka deploy laman web ini (cek resource yg lb) pada Kotalingga menggunakan apache.

### Setup Website pada Kotalingga

Instalasi dependencies yang diperlukan

```sh
apt-get update
apt-get install lynx apache2 php libapache2-mod-php7.0 wget unzip -y
```

Buat file `it09.conf` pada `/etc/apache2/sites-available/`

```sh
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/it09.conf
```

Hapus file `000-default.conf` pada `/etc/apache2/sites-enabled/`

```sh
rm /etc/apache2/sites-enabled/000-default.conf
```

Edit file `it09.conf` pada `/etc/apache2/sites-available/` menjadi seperti berikut ini

```sh
<VirtualHost *:8080>
ServerAdmin webmaster@localhost
DocumentRoot /var/www/html
</VirtualHost>
```

Tambahkan `Listen 8080` pada `/etc/apache2/ports.conf/` menjadi seperti berikut ini

```sh
Listen 80
Listen 8080

<IfModule ssl_module>
    Listen 443
</IfModule>

<IfModule mod_gnutls.c>
    Listen 443
</IfModule>
```

Nyalakan situs web yang telah di Setup pada `it09.conf`

```sh
a2ensite it09.conf
```

Unduh file `index.php`, dan letakkan pada `/var/www/html/`

```sh
$ mkdir -p /var/www/html/configuration/

$ wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O /var/www/html/configuration/lb.zip

$ unzip /var/www/html/configuration/lb.zip -d /var/www/html/configuration/

$ mv /var/www/html/configuration/worker/index.php /var/www/html/

$ rm -rf /var/www/html/configuration/
```

Nyalakan service apache

```sh
service apache2 start
```

### Testing

```sh
lynx 10.68.2.5/index.php
```
![tesweb](./Asset/tesweb.png)

## Soal Nomor 13
Karena Sriwijaya dan Majapahit memenangkan pertempuran ini dan memiliki banyak uang dari hasil penjarahan (sebanyak 35 juta, belum dipotong pajak) maka pusat meminta kita memasang load balancer untuk membagikan uangnya pada web nya, dengan Kotalingga, Bedahulu, Tanjungkulai sebagai worker dan Solok sebagai Load Balancer menggunakan apache sebagai web server nya dan load balancer nya.

### Setup Website pada Kotalingga, Bedahulu, Tanjungkulai

Instalasi dependencies yang diperlukan

```sh
apt-get update
apt-get install lynx apache2 php libapache2-mod-php7.0 wget unzip -y
```

Buat file `it09.conf` pada `/etc/apache2/sites-available/`

```sh
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/it09.conf
```

Hapus file `000-default.conf` pada `/etc/apache2/sites-enabled/`

```sh
rm /etc/apache2/sites-enabled/000-default.conf
```

Edit file `it09.conf` pada `/etc/apache2/sites-available/` menjadi seperti berikut ini

```sh
<VirtualHost *:8080>
ServerAdmin webmaster@localhost
DocumentRoot /var/www/html
</VirtualHost>
```

Tambahkan `Listen 8080` pada `/etc/apache2/ports.conf/` menjadi seperti berikut ini

```sh
Listen 80
Listen 8080

<IfModule ssl_module>
    Listen 443
</IfModule>

<IfModule mod_gnutls.c>
    Listen 443
</IfModule>
```

Nyalakan situs web yang telah di Setup pada `it09.conf`

```sh
a2ensite it09.conf
```

Unduh file `index.php`, dan letakkan pada `/var/www/html/`

```sh
$ mkdir -p /var/www/html/configuration/

$ wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O /var/www/html/configuration/lb.zip

$ unzip /var/www/html/configuration/lb.zip -d /var/www/html/configuration/

$ mv /var/www/html/configuration/worker/index.php /var/www/html/

$ rm -rf /var/www/html/configuration/
```

Nyalakan service apache

```sh
service apache2 start
```

### Setup load balancer pada Solok

Instalasi dependencies yang diperlukan

```sh
apt-get update
apt-get install lynx apache2 -y
```

Nyalakan modul modul yang diperlukan

```sh
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests
```

c. Jalankan service apache

```sh
service apache2 start
```

d. Edit file `default-8080.conf` pada `/etc/apache2/sites-available/` menjadi seperti berikut ini

```sh
<VirtualHost *:8080>
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
</VirtualHost>
```

f. Nyalakan Setup pada `it09.conf`

```sh
a2ensite it09.conf
```

Restart service apache

```sh
service apache2 restart
```

### Testing

#### Kotalingga

```sh
lynx 10.68.2.5:8080/index.php
```
![tesweb](./Asset/tesweb.png)

#### Bedahulu

```sh
lynx 10.68.2.4:8080/index.php
```
![Bedahuluweb](./Asset/bedahuluweb.png)

#### Tanjungkulai

```sh
lynx 10.68.2.3:8080/index.php
```
![Tanjungkulaiweb](./Asset/Tanjungkulaiwe.png)

## Soal Nomor 14
Selama melakukan penjarahan mereka melihat bagaimana web server luar negeri, hal ini membuat mereka iri, dengki, sirik dan ingin flexing sehingga meminta agar web server dan load balancer nya diubah menjadi nginx.