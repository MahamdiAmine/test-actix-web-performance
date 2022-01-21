# builder :: used to build the binary
FROM rust AS builder

COPY . /app
WORKDIR /app
RUN cargo build --release

# we only need the packaged app from the builder
FROM debian:buster-slim
COPY --from=builder /app/target/release/actix-web-api /app/actix-web-api
WORKDIR /app

CMD ["./actix-web-api"]