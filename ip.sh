#!/bin/bash
read -p "interface: "  ifname
read -p "ip address: " ipaddr
read -p "prefix: "     prefix
read -p "gateway: "    gateway
read -p  "dns: "       dns

ipfile=/etc/sysconfig/network-scripts/ifcfg-$ifname
cat <<EOF >$ipfile
DEVICE=$ifname
ONBOOT=yes
IPV6INIT=no
BOOTIPROTO=none
IPADDR=$ipaddr
PREFIX=$prefix
EOF

if [ -n "$gateway" ];then
 sed -i "\$aGATEWAY=$gateway" $ipfile
fi

if [ -n "$dns" ];then
 sed -i "\$aDNS1=$dns" $ipfile
fi
