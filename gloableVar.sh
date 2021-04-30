#!/bin/bash

# bash main file 
mainFile="test.sh"
# bash function file
functionFile='fun.sh'

# bash runtime path
runtimePWD=`pwd`

# warning text no-root permission
noRootRuntimeWaringText="\e[1;31m please run as root. \e[1;32m  \ne.g: \e[0m \n sudo ./$mainFile "

# sofeware need to install , before bash run .
installSoftwareList="apache2 mariadb-server php"
