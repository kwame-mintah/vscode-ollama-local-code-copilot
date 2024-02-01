FROM alpine:3.14

# Download cURL
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

# Copy script to container
COPY docker-entrypoint.sh /usr/local/bin/

# Amend permissions so file can be executed
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Execute shell script to pull model(s)
ENTRYPOINT ["docker-entrypoint.sh"]
