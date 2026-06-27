dev:
	uv run python manage.py runserver

makemigr:
	uv run python manage.py makemigrations

migrate:
	uv run python manage.py migrate

test:
	uv run python manage.py test

.PHONY: install
install:
	uv sync

.PHONY: collectstatic
collectstatic:
	uv run python manage.py collectstatic --noinput

.PHONY: build
build:
	./build.sh

.PHONY: render-start
render-start:
	gunicorn task_manager.wsgi --bind 0.0.0.0:$PORT

test-coverage:
	coverage run --source='.' manage.py test
	coverage xml -o coverage.xml