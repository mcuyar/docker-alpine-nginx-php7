#!/usr/bin/with-contenv bash

apk add postgresql

function test_postgresql {
  pg_isready -h "${POSTGRES_PORT_5432_TCP_ADDR}" -U "${POSTGRES_ENV_POSTGRES_USER}"
}

count=0
# Chain tests together by using &&
until ( test_postgresql )
do
  ((count++))
  if [ ${count} -gt 50 ]
  then
    echo "PostgreSQL did not become ready in time"
    exit 1
  fi
  sleep 2
done
