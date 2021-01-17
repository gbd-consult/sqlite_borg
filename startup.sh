#!/bin/bash

echo "sqlite backup container yeah"

#init repo

/bin/borg init --encryption=repokey-blake2

if [ $RUN_AT_STARTUP -eq 1 ]
then
  /backup.sh
fi

crond -f