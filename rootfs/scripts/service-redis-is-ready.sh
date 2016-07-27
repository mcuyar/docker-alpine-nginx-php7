#!/usr/bin/with-contenv bash

apk add redis

function test_redis {
  redis-cli -h "${CACHE_PORT_6379_TCP_ADDR}" PING
}

count=0
# Chain tests together by using &&
until ( test_redis )
do
  ((count++))
  if [ ${count} -gt 50 ]
  then
    echo "Redis did not become ready in time"
    exit 1
  fi
  sleep 2
done