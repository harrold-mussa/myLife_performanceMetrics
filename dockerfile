FROM postgres:15-alpine

ARG DB_USER
ARG DB_PASSWORD

ENV POSTGRES_USER=${DB_USER}
ENV POSTGRES_PASSWORD=${DB_PASSWORD}
ENV POSTGRES_DB=mylife_performancemetrics

COPY ./data/warehouse/ddl_schema.sql /docker-entrypoint-initdb.d/schema.sql