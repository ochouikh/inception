FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD [ "bash", "tools/script.sh" ]
