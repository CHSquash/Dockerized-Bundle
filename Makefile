build:
	make -C Dockerized-Jenkins $@
	make -C Dockerized-Nginx $@
	make -C Dockerized-Swagger-tool $@

start:
	docker-compose -f docker-compose.yaml up -d

stop:
	docker-compose -f docker-compose.yaml pull
	docker-compose -f docker-compose.yaml rm -f

clean:
	docker rm -f $$(docker ps -qa) || true
	docker rmi -f $$(docker images -q) || true
	docker volume rm $$(docker volume ls -q) || true
