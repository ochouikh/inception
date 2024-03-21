FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/script.sh .

CMD bash script.sh
