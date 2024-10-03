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


## Soal Nomer 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke Solok dengan alamat sudarsana.xxxx.com dengan alias www.sudarsana.xxxx.com, dimana xxxx merupakan kode kelompok. Contoh: sudarsana.it01.com.

### isi dari folder `/etc/bind/named.conf.local`

```sh
zone "sudarsono.it09.com" {
	type master;
	file "/etc/bind/it09/sudarsono.it09.com";
};
```

```sh
cp /etc/bind/db.local /etc/bind/it09/sudarsono.it09.com

nano /etc/bind/it09/sudarsono.it09.com
```

```sh
echo nameserver 10.68.2.1 > /etc/resolv.conf
```