#!/bin/bash


mysql=( mysql --protocol=socket -uroot -hlocalhost --socket=/var/run/mysqld/mysqld.sock -p"${MYSQL_ROOT_PASSWORD:-secret}" )

for i in {30..0}; do
    if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
        break
    fi
    echo 'MySQL init process in progress...'
    sleep 1
done
if [ "$i" = 0 ]; then
    echo >&2 'MySQL init process failed.'
    exit 1
fi

echo "[mysql] adding root user"
"${mysql[@]}" <<-EOSQL
    SET @@SESSION.SQL_LOG_BIN=0;

    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD:-secret}' ;
    GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION ;
    DROP DATABASE IF EXISTS test ;
    FLUSH PRIVILEGES ;
EOSQL

for script in /mysql-entrypoint-initdb.d/*.sql; do
    echo "[mysql] processing initdb file: ${script}"
    /usr/local/bin/gosu root "${mysql[@]}" < "$script" 2>/dev/null
    rm -f "$script"
done

