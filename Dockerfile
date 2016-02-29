FROM atyenoria/galera-base



COPY sample.sh /
RUN sh /sample.sh


COPY mysqld.sh /
COPY start /start


RUN echo "alias mysqlm=\"service mysql start --wsrep-new-cluster --init-file=/tmp/bootstrap.sql\"" >> ~/.bashrc
RUN echo "alias mysqls=\"service mysql start --init-file=/tmp/bootstrap.sql\"" >> ~/.bashrc


WORKDIR /etc/mysql
# RUN chmod 555 /start /mysqld.sh
# ENTRYPOINT ["/start"]


