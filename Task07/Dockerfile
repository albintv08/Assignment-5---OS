FROM python:3.13-alpine

LABEL project="University Result Portal"
LABEL task="Assignment 5 - Docker Containerisation"

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --chown=appuser:appgroup app/server.py .

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
 CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8080/health')"

CMD ["python", "-u", "server.py"]
