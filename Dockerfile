FROM caddy:2.8.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/duckdns \
    --with github.com/corazawaf/coraza-caddy \
    --with github.com/hslatman/caddy-crowdsec-bouncer

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
