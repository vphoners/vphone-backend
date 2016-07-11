#!/bin/sh

sed -i "s/%PASSWORD%/$SIP_PASSWORD/g" /etc/asterisk/pjsip.conf
sed -i "s/%USERNAME%/$SIP_USERNAME/g" /etc/asterisk/pjsip.conf
sed -i "s/%USER_SECRET%/$USER_SECRET/g" /etc/asterisk/pjsip.conf
sed -i "s/%EXTERN_ADDR%/$EXTERN_ADDR/g" /etc/asterisk/pjsip.conf

/usr/sbin/asterisk -cvvvvvddd -f
#sleep 10
#tail -f /var/log/asterisk/*
#asterisk -r
