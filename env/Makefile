
dstr := $(shell cat .env | grep DISTRO | cut -d '=' -f 2)

.PHONY: init up down start in inu stop

up:
	docker-compose up -d

upr:
	docker compose -f docker-compose.release.yml up -d

down:
	docker-compose down

downr:
	docker compose -f docker-compose.release.yml down


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
