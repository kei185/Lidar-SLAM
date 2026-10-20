
dstr := $(shell cat .env | grep DISTRO | cut -d '=' -f 2)

.PHONY: init up down start in inu stop

up:
	docker-compose up -d

upr:
	docker compose up -d -f docker-compose.release.yml

down:
	docker-compose down

downr:
	docker compose down  -f docker-compose.release.yml


start:
	docker start ${dstr}

in:
	docker exec -it ${dstr} bash

inu:
	docker exec -u ubuntu -it ${dstr} bash


stop:
	docker stop ${dstr}


init:
	sh init.sh
