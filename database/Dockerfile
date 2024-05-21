FROM postgres:latest
# database should not be accessible from outside the compose anyways
ENV POSTGRES_PASSWORD=1234
ENV POSTGRES_USER=fetcher1
ENV POSTGRES_DB=main
#make a fresh database.
COPY resetTables.sh docker-entrypoint-initdb.d/resetTables.sh 
#optionally, import a dump
#COPY restore_dump.sh docker-entrypoint-initdb.d/restore_dump.sh 
#COPY pg_dump /pg_dump