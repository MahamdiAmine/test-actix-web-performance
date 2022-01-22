# multi-stage build feature
FROM rust AS builder

COPY . /app
WORKDIR /app
RUN cargo build --release

# we only need the packaged app from the builder
FROM scratch
WORKDIR /app
COPY --from=builder /app/target/release/actix-web-api actix-web-api
ENTRYPOINT ["./actix-web-api"]