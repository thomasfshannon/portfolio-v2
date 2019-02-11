# Development
local_test:
	docker exec -it develoship_website_app python manage.py test

create_superuser:
	docker exec -it develoship_website_app python manage.py createsuperuser

dev_build:
	docker-compose -f docker-compose.yml up --build --remove-orphans

dev_up:
	docker-compose -f docker-compose.yml up --remove-orphans

pipenv_freeze:
	pipenv lock -r > requirements.txt

# Production
build:
	docker build -t develoship_website_app:${CI_PIPELINE_ID} -f var/Dockerfile .

test:
	docker-compose --project-name ${CI_COMMIT_SHA} -f docker-compose-testing.yml run backend_tests

test_cleanup:
	docker-compose --project-name ${CI_COMMIT_SHA} -f docker-compose-testing.yml down -v

prod_db_migrate:
	make build
	docker-compose --project-name ${CI_COMMIT_SHA} -f var/docker/compose-db-migrations.yml run develoship_website_app

prod_db_migrate_cleanup:
	docker-compose --project-name ${CI_COMMIT_SHA} -f var/docker/compose-db-migrations.yml down -v

docker_cleanup:
	docker system prune -f -a