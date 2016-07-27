#!/usr/bin/with-contenv bash

apk add mysql-client

function test_mysql {
  mysqladmin -h "${MYSQL_PORT_3306_TCP_ADDR}" -u"${MYSQL_ENV_MYSQL_USER}" -p"${MYSQL_ENV_MYSQL_PASSWORD}" ping
}

count=0
# Chain tests together by using &&
until ( test_mysql )
do
  ((count++))
  if [ ${count} -gt 50 ]
  then
    echo "MySQL did not become ready in time"
    exit 1
  fi
  sleep 2
done