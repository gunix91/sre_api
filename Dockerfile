# Étape 1 : Build
FROM rust:latest AS builder
WORKDIR /usr/src/app
COPY . .
RUN cargo build --release

# Étape 2 : Production
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/app/target/release/sre_api /usr/local/bin/sre_api

EXPOSE 8080
CMD ["sre_api"]
