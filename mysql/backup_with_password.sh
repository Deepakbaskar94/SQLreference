#!/bin/sh

#FILE=backup.sql.
DATE="$(date +'%d/%m/%Y')"
echo "$DATE is today"
#DATE=$(date)

DBSERVER=localhost
DATABASE=PP_MDM
TARGETFILE=pp_mdm
USER=root
PASS=password

FILE=$TARGETFILE-$(date +"%d-%m-%Y").sql

echo "$FILE name created"
unalias rm	2> /dev/null
rm ${FILE} 	2> /dev/null
rm ${FILE}.gz 	2> /dev/null

sudo mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}
#sudo mysql -u root -p PP_MDM > pp_mdm_backup.sql
echo "file created"
#gzip $FILE
#echo "${FILE}.gz was created: "
#ls -l #{FILE}.gz
