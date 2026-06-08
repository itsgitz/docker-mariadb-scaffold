.PHONY: run stop start restart client logs ps backup restore destroy

run:
	docker compose up -d

stop:
	docker compose stop

start:
	docker compose start

restart: stop start

client:
	docker compose exec db mariadb -u root -p

logs:
	docker compose logs -f db

ps:
	docker compose ps

backup:
	docker compose exec db sh -c 'mariadb-dump -u root -p"$$MARIADB_ROOT_PASSWORD" --all-databases' > backup_$$(date +%Y%m%d_%H%M%S).sql

restore:
	docker compose exec -T db sh -c 'mariadb -u root -p"$$MARIADB_ROOT_PASSWORD"' < $(FILE)

destroy:
	@echo "WARNING: This will permanently delete the mariadb volume and all data."
	docker compose down -v
