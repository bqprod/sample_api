# README

## DEVELOPMENT SETUP

### with Docker

- Install Docker and Docker-compose;
- Build docker images:

  ```bash
  docker-compose build
  ```

- Boot the app with docker-compose up:

  ```bash
  docker-compose up
  ```

- Create database, run migrations and seed

  ```bash
  docker-compose exec app rails db:setup
  ```

### without Docker

- Install ruby 2.7.1 (you can use rbenv or rvm)
- Install bundler 2.1.4

  ```bash
  gem install bundler -v 2.1.4
  ```

- Install gems

  ```bash
  bundle install
  ```

- Create database, run migrations and seed

  ```bash
  bundle exec rails db:setup
  ```

## API

### Docs

- /api/docs

### Authentication

- Add some user id to Authorization header

```bash
  Authorization => 1
```
