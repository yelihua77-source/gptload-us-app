FROM alpine:3.20
RUN apk add --no-cache curl ca-certificates bash
WORKDIR /app
RUN curl -fsSL https://github.com/tbphp/gpt-load/releases/download/v2.0.0-rc.44/gpt-load-linux-amd64 -o gpt-load && chmod +x gpt-load
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENV HOST=0.0.0.0 PORT=8080 DATA_DIR=/app/data
EXPOSE 8080
CMD ["/bin/sh", "/app/start.sh"]
