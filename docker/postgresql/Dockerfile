FROM postgres:10-alpine
RUN apk update; \
    apk upgrade;

ADD ./initdb/event_presention_db.sql /docker-entrypoint-initdb.d/event_presention_db.sql
