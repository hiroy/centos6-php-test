NETWORK_NAME = shared-network

.PHONY: up
up:
	@if [ -z "`docker network ls | grep $(NETWORK_NAME)`" ]; then\
		docker network create $(NETWORK_NAME) --driver bridge --subnet 172.25.10.0/24;\
	fi
	docker-compose up -d

.PHONY: connect
connect:
	docker-compose exec app bash

.PHONY: down
down:
	docker-compose down

.PHONY: down_network
down_network:
	docker network rm $(NETWORK_NAME)
