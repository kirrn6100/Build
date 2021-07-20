#!/bin/bash

if [[ -z $(ip a|grep ppp) ]]
	then
	pon rt
	while [[ -z $(ip a|grep ppp) ]]
		do
		sleep 1
	done
	echo 'nameserwer 1.1.1.1' > /etc/resolv.conf
	while [[ -z $(ip a|grep -F 'ppp'|sed -n 3p|awk '{print $2}'|awk 'BEGIN{FS="/"}{print $1}') ]]
		do
		sleep 1
	done
	ip=$(ip a|grep -F 'ppp'|sed -n 3p|awk '{print $2}'|awk 'BEGIN{FS="/"}{print $1}')
	iptables -t nat -A POSTROUTING -s 192.168.211.0/24 -o ppp0 -j SNAT --to-source $ip
	while ((1))
		do
		sleep 1
	done
fi
