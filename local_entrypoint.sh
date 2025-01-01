#!/bin/sh

mysql_host="github-actions-test-mysql"
mysql_user="user"
mysql_port="3306"
mysql_password="password"

echo "github-actions-test-mysqlへの接続を試みています: $mysql_host:$mysql_port"
if ! mysql --ssl=0 -h "$mysql_host" -P "$mysql_port" -u "$mysql_user" -p"$mysql_password" -e 'SELECT 1'; then
    echo "github-actions-test-mysqlへの接続に失敗しました"
    exit 1
fi

echo "github-actions-test-mysqlへの接続に成功しました"

# airを起動
exec air -c .air.toml
