#!/bin/bash
source gloableVar.sh
source fun.sh
if checkRoot == 0
then
        echo -e $noRootRuntimeWaringText
fi
#cd /etc/mysql/mariadb.conf.d/
#sed -i 's/127.0.0.1/0.0.0.0/' 50-server.cnf
#sed -i 's/#port/port/' 50-server.cnf
cd $cerentPWD
