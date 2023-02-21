#!/bin/sh
echo "please type the sql root user password: "
read PASS

echo "please type the .sql filename: "
read RESTORE

DBSERVER=localhost
TARGETDB=PP_MDM
USER=root
#PASS=password
#RESTORE = PP_MDM

sudo mysqldump --opt --user=${USER} --password=${PASS} ${TARGETDB} < ${RESTORE} 
