#!/bin/bash

sed -i "s/%PASSWORD%/$SIP_PASSWORD/g" /etc/asterisk/sip.conf
sed -i "s/%USERNAME%/$SIP_USERNAME/g" /etc/asterisk/sip.conf
sed -i "s/%USER_SECRET%/$USER_SECRET/g" /etc/asterisk/sip.conf
sed -i "s/%EXTERN_ADDR%/$EXTERN_ADDR/g" /etc/asterisk/sip.conf



/usr/sbin/asterisk -f -d
