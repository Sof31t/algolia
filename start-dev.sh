#!/bin/sh
echo "Waiting for database to be ready"
./wait-for-it.sh algolia-db:5432

echo "Creating database..."
rake db:create

echo "Migrating database"
rake db:migrate

echo "Run Server"
rm /src/tmp/pids/server.pid
rails s
