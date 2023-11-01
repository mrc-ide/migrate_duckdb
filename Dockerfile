FROM ubuntu:22.04

RUN  apt-get update \
  && apt-get install -y wget unzip \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/duckdb/duckdb/releases/download/v0.8.1/duckdb_cli-linux-amd64.zip -O duckdb_cli-v0.8.1.zip
RUN unzip duckdb_cli-v0.8.1.zip -d v0.8.1

RUN wget https://github.com/duckdb/duckdb/releases/download/v0.9.1/duckdb_cli-linux-amd64.zip -O duckdb_cli-v0.9.1.zip
RUN unzip duckdb_cli-v0.9.1.zip -d v0.9.1

COPY migrate migrate

ENTRYPOINT ["./migrate"]
