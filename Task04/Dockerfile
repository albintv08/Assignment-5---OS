# Example web-tier image for the result portal
FROM nginx:stable-alpine

LABEL project="University Result Portal"
LABEL component="web"

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1
