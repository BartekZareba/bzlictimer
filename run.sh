#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Użycie: $0 <st|sp> <up|down|restart>"
  exit 1
fi

ENV="$1"
CMD="$2"

case "$ENV" in
  st) ENVFILE=".st-env" ;;
  sp) ENVFILE=".sp-env" ;;
  *)
    echo "Błąd: pierwszy argument musi być 'st' lub 'sp'"
    exit 2
    ;;
esac

case "$CMD" in
  up|down|restart) ;;
  *)
    echo "Błąd: drugi argument musi być 'up', 'down' lub 'restart'"
    exit 3
    ;;
esac

if [ ! -f "$ENVFILE" ]; then
  echo "Błąd: plik $ENVFILE nie istnieje"
  exit 4
fi

set -o allexport
source "$ENVFILE"
set +o allexport

if [ -z "$HOST" ]; then
  echo "Błąd: zmienna HOST w pliku $ENVFILE nie jest ustawiona lub jest pusta"
  exit 5
fi

if [ ! -d "html" ]; then
  echo "Błąd: katalog 'html' nie istnieje w tym katalogu $(pwd)"
  exit 6
fi

if [ "$CMD" = "up" ]; then
  docker-compose build
  docker-compose up -d
elif [ "$CMD" = "down" ]; then
  docker-compose down
elif [ "$CMD" = "restart" ]; then
  docker-compose down
  docker-compose build
  docker-compose up -d
fi

