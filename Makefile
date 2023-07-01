# general commands
include .env
export

prepare:
	docker compose up es-8-setup

start:
	docker compose up -d es-8-node-1 es-8-node-2 es-7-node-1 es-7-node-2 es-6-node-1 es-6-node-2 minio

stop:
	docker compose down

restart: stop start

nuke:
	docker compose down -v

pull:
	docker compose pull

logs:
	docker compose logs -f

ps:
	docker compose ps

check: check-8 check-7 check-6

# elasticsearch 8

8:
	docker compose up -d es-8-node-1 es-8-node-2

bash-8:
	docker compose exec es-8-node-1 bash

check-8:
	curl -k "https://elastic:${ELASTIC_PASSWORD}@localhost:9508"

# elasticsearch 7

7:
	docker compose up -d es-7-node-1 es-7-node-2

bash-7:
	docker compose exec es-7-node-1 bash

check-7:
	curl "http://localhost:9507"

# elasticsearch 6

6:
	docker compose up -d es-6-node-1 es-6-node-2

bash-6:
	docker compose exec es-6-node-1 bash

check-6:
	curl "http://localhost:9506"

# minio

minio:
	docker compose up -d minio