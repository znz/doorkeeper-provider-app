# Doorkeeper Provider Example

## How to use

### Setup

```
    git clone https://github.com/znz/doorkeeper-provider-app
    cd doorkeeper-provider-app
    bundle install
    ./bin/rake db:migrate
    ./bin/rake db:seed
    ./bin/rails server
```

and open `http://localhost:3000`

### Register your applications

- Sign in with `admin@example.com` and `adminpass`
- Click `OAuth Applications` link in navigation bar
- Click `New Application` button
- And register your applications

## Example Users

See `db/seeds.rb`.

- Email: `admin@example.com`,
  Password: `adminpass`
- Email: `user@example.com`,
  Password: `password`

## Setup in Heroku

```
    heroku create
    heroku addons:add heroku-postgresql
    heroku config:set SECRET_KEY_BASE=$(rake secret) DEVISE_SECRET_KEY=$(rake secret) --remote heroku
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:seed
    heroku open
```
