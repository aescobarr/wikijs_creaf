#!/bin/bash

source .env
DB_CONTAINER_NAME=wikijs-db-1
BACKUP_FILE=wikibackup_2026-05-07-1119.dump

docker compose stop wiki
docker exec -it $DB_CONTAINER_NAME dropdb -U $DB_USER $DB_NAME
docker exec -it $DB_CONTAINER_NAME createdb -U $DB_USER $DB_NAME
cat $BACKUP_FILE | docker exec -i $DB_CONTAINER_NAME pg_restore -U $DB_USER -d $DB_NAME
docker compose start wiki
