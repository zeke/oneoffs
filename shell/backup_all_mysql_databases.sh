#!/bin/sh

echo "=== Backing up all MySQL databases ==="
date="/bin/date +%Y.%m.%d-%H.%M.%S"
directory="/Users/elcdeveloper/Desktop/local_mysql_backups_`$date`"
databases=`mysql -uroot -Bse 'show databases'`
dump="mysqldump -uroot"

mkdir -p $directory
if [ -d $backupDirectory ] ; then
  echo "Created new directory for backups: ${directory}"
else
  echo "Cannot create directory ${directory}. Backup aborted."
  exit 1
fi

for db in $databases
do
  echo "-> $db"
  $dump $db > $directory/$db.sql
  gzip $directory/$db.sql
done

echo "=== Done ==="
exit 0