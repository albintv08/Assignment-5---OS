#!/bin/bash

set -e
cd "$(dirname "$0")"

case "${1:-help}" in
  start)
    docker compose up -d --build
    ;;
  stop)
    docker compose down
    ;;
  status)
    docker compose ps
    ;;
  logs)
    docker compose logs
    ;;
  *)
    echo "Usage: $0 {start|stop|status|logs}"
    ;;
esac
