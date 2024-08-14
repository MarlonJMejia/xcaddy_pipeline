FROM caddy:builder AS builder

RUN xcaddy build master \
    --with github.com/caddy-dns/duckdns \
    --with github.com/corazawaf/coraza-caddy/v2@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
