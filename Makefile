# general commands
include .env
export

prepare:
	docker compose up es-8-setup

start:
	docker compose up -d es-8-node-1 es-8-node-2 es-7-node-1 es-7-node-2 es-6-node-1 es-6-node-2 es-5-node-1 es-2-node-1 es-1-node-1

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

check: check-8 check-7 check-6 check-5 check-2 check-1

seed: 
	./seed.sh

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

# elasticsearch 5

5:
	docker compose up -d es-5-node-1

bash-5:
	docker compose exec es-5-node-1 bash

check-5:
	curl "http://localhost:9505"

# elasticsearch 2

2:
	docker compose up -d es-2-node-1

bash-2:
	docker compose exec es-2-node-1 bash

check-2:
	curl "http://localhost:9502"

# elasticsearch 1

1:
	docker compose up -d es-1-node-1

bash-1:
	docker compose exec es-1-node-1 bash

check-1:
	curl "http://localhost:9501"
