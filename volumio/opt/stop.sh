






#!/bin/bash

if [[ -n $(ip a|grep ppp) ]]
	then
	poff
	iptables -t nat -F
fi
