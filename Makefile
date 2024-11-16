run:
	docker compose up -d --build --force-recreate
stop:
	docker compose stop
start:
	docker compose start
client:
	docker compose exec -it db mariadb -u root -p
restart: stop start
destroy:
	docker compose down -v
