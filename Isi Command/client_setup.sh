echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install -y bind9 bind9utils bind9-doc dnsutils
echo nameserver 10.68.2.1 > /etc/resolv.conf
echo nameserver 10.68.1.1 >> /etc/resolv.conf