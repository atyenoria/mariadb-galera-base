#docker build -t galera . && docker run -it -p 8080:8080 -p 3306:3306 --name master -v $(pwd)/mysql:/etc/mysql --rm galera bash
#docker run -it -e XTRABACKUP_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root -p 8080:8080 -p 3306:3306 --name master --rm atyenoria/galera bash

#docker run -it -e XTRABACKUP_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root -p 8080:8080 -p 3306:3306 -v $(pwd)/conf.d:/etc/mysql/conf.d --name master --rm atyenoria/galera seed 192.168.99.100,192.168.99.101,192.168.99.102
#docker run -it -e XTRABACKUP_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root -p 8080:8080 -p 3306:3306 -v $(pwd)/conf.d:/etc/mysql/conf.d --name node --rm atyenoria/galera node 192.168.99.100,192.168.99.101,192.168.99.102

#docker build -t galera . && docker run -it -p 8080:8080 -p 3306:3306 -p 4444:4444 -p 4567:4567 -e IP=192.168.99.100 --name master -v $(pwd)/mysql1:/etc/mysql --rm galera bash
#docker build -t galera . && docker run -it -p 8080:8080 -p 3306:3306 -p 4444:4444 -p 4567:4567 -e IP=192.168.99.101 --name master -v $(pwd)/mysql2:/etc/mysql --rm galera bash
#docker build -t galera . && docker run -it -p 8080:8080 -p 3306:3306 -p 4444:4444 -p 4567:4567 -e IP=192.168.99.102 --name master -v $(pwd)/mysql3:/etc/mysql --rm galera bash


FROM atyenoria/galera-base

# COPY ./conf.d /etc/mysql/conf.d
# RUN chmod 0644 /etc/mysql/conf.d/utf8.cnf
# RUN chmod 0644 /etc/mysql/conf.d/galera.cnf
# COPY sample.sql /
COPY sample.sh /
RUN sh /sample.sh


COPY mysqld.sh /
COPY start /start

RUN echo "alias mysqlm=\"service mysql start --wsrep-new-cluster --init-file=/tmp/bootstrap.sql\"" >> ~/.bashrc
RUN echo "alias mysqls=\"service mysql start --init-file=/tmp/bootstrap.sql\"" >> ~/.bashrc

WORKDIR /etc/mysql
# RUN chmod 555 /start /mysqld.sh
# ENTRYPOINT ["/start"]


