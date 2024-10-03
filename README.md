# Jarkom-Modul-2-IT09-2024

## Angggota

| Anggota | NRP  |
| ------- | --- |
| Michael Kenneth Salim | 5027231008 |
| Tio Axelino | 50272310XX |

## List IP Address

| Nama Kota   | Interface | IP Address | Getaway |
| ----------- | --------- | ---------- | ------- |
| Nusantara   |    eth1       |            |         |
| Tanjungkulai|    eth0       |            |         |
| Bedahulu    |    eth0       |            |         |
| Sriwijaya   |    eth0       |            |         |
| Majapahit   |    eth0       |            |         |
| Solok       |    eth0       |            |         |
| Kotalingga  |    eth0       |            |         |


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

