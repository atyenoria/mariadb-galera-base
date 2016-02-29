FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install -y  software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb [arch=amd64,i386] http://ftp.yz.yamagata-u.ac.jp/pub/dbms/mariadb/repo/10.1/debian jessie main'


RUN apt-get update
RUN apt-get -y --no-install-recommends --no-install-suggests install host socat unzip ca-certificates wget rsync
RUN apt-get -y install mariadb-server mariadb-client xtrabackup galera


RUN wget -O /bin/galera-healthcheck 'https://github.com/sttts/galera-healthcheck/releases/download/v20150303/galera-healthcheck_linux_amd64'
RUN test "$(sha256sum /bin/galera-healthcheck | awk '{print $1;}')" = "86f60d9d82b1f9d2d474368ed7e81a0a361508031a292244847136b0ed2ee770"
RUN chmod +x /bin/galera-healthcheck



# configure mysqld
RUN sed -i 's/#? *bind-address/# bind-address/' /etc/mysql/my.cnf
RUN sed -i 's/#? *log-error/# log-error/' /etc/mysql/my.cnf
# ADD conf.d/utf8.cnf /etc/mysql/conf.d/utf8.cnf
# ADD conf.d/galera.cnf /etc/mysql/conf.d/galera.cnf
# RUN chmod 0644 /etc/mysql/conf.d/utf8.cnf
# RUN chmod 0644 /etc/mysql/conf.d/galera.cnf

RUN echo "alias lso=\"lsof -i -n -P\"" >> ~/.bashrc

EXPOSE 3306 4444 4567 4568
VOLUME ["/var/lib/mysql"]
# COPY mysqld.sh /mysqld.sh
# COPY start /start
# RUN chmod 555 /start /mysqld.sh
# ENTRYPOINT ["/start"]


ENV XTRABACKUP_PASSWORD root
ENV MYSQL_ROOT_PASSWORD root