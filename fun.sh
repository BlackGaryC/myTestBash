#!/bin/bash

# check runtime user permission
# if bash is run as root then return 1
# else return 0
checkRoot(){
        if [ $UID -ne 0 ]
        then
                return 0
        fi
        return 1
}
# the default mariadb setting is only connected by socket
# we need to open a port (default port is 3306)
# besides if you only use database in localhost , there is 
# nothing more to change .
# if you need to connect you database by 192.168.1.1/24 or 
# or other ip ,you need to change listened range from 
# 127.0.0.1  to 0.0.0.0
setMariaDbServerListenTo(){
        if [ $UID -ne 0 ]
        then
                cd /etc/mysql/mariadb.conf.d/
                sed -i 's/127.0.0.1/0.0.0.0/' 50-server.cnf
                sed -i 's/#port/port/' 50-server.cnf
        fi
}
