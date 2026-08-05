
dstr := $(shell cat .env | grep DISTRO | cut -d '=' -f 2)

up:
	docker-compose up -d

down:
	docker-compose down

start:
	docker start ${dstr}

in:
	docker exec -it ${dstr} bash

in-ubuntu:
	docker exec -u ubuntu -it ${dstr} bash


stop:
	docker stop ${dstr}
