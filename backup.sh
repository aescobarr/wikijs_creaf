#!/bin/bash

source .env
DB_CONTAINER_NAME=wikijs-db-1
NOW=$(date +"%Y-%m-%d-%H%M")

docker exec $DB_CONTAINER_NAME pg_dump $DB_NAME -U $DB_USER -F c > wikibackup_$NOW.dump
