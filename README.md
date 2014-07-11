# Doorkeeper Provider Example

## How to use

### Setup

    git clone https://github.com/znz/doorkeeper-provider-app
    cd doorkeeper-provider-app
    bundle install
    ./bin/rake db:migrate
    ./bin/rake db:seed
    ./bin/rails server

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

    heroku create
    heroku addons:add heroku-postgresql
    heroku config:set SECRET_KEY_BASE=$(rake secret) DEVISE_SECRET_KEY=$(rake secret) --remote heroku
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:seed
    heroku open

## Test with Client examples

see https://github.com/doorkeeper-gem/doorkeeper/wiki/Example-Applications

Clone the client example:

    git clone https://github.com/doorkeeper-gem/doorkeeper-sinatra-client
    cd doorkeeper-sinatra-client

Register app to your provider with callback url `http://localhost:9393/callback`,
and create env.rb:

    # env.rb
    ENV['OAUTH2_CLIENT_ID']           = "129477f..."
    ENV['OAUTH2_CLIENT_SECRET']       = "c1eec90..."
    ENV['OAUTH2_CLIENT_REDIRECT_URI'] = "http://localhost:9393/callback"
    ENV['SITE'] = "http://(your deployed provider).herokuapp.com/"

And run client:

    bundle install
	bundle exec rackup config.ru -p 9393

And open `http://localhost:9393`.

You can use `Sign in with OAuth 2 provider` link and `My Credentials` page,
but `Profiles` page shows `OAuth2::Error` (because the API is not implemented).
