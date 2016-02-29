

            cat >/tmp/bootstrap.sql <<EOF
CREATE USER 'xtrabackup'@'localhost' IDENTIFIED BY '$XTRABACKUP_PASSWORD';
GRANT RELOAD,LOCK TABLES,REPLICATION CLIENT ON *.* TO 'xtrabackup'@'localhost';
CREATE USER 'clustercheck'@'localhost' IDENTIFIED BY '$CLUSTERCHECK_PASSWORD';
GRANT PROCESS ON *.* TO 'clustercheck'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
FLUSH PRIVILEGES;
EOF