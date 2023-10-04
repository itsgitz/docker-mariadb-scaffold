run:
	docker compose up -d --build --force-recreate
stop:
	docker compose stop
start:
	docker compose start
restart: stop start
destroy:
	docker compose down -v
