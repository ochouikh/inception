FROM debian:bullseye

RUN apt update && apt install -y redis-server

EXPOSE 6379

# COPY tools/script.sh .

CMD redis-server --protected-mode no
