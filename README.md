# Rails The Originate Way

This is a sample application with recommended gems and configurations. Where appropriate branches have been made for specific topics or application specific set ups.

You are free to clone this as is and merge the approriate branches for your project or it may be better for you to start a new project but use this project as a guideline for gems and configuration you may want to use.

## Setup

### PostgreSQL

Assumes you have a role 'sample_app' with password '123456'

    rake db:create
    rake db:migrate
    rake db:test:prepare

### Redis

Assumes you have Redis installed. Redis is used for Sidekiq. Just make sure you have a .redis directory where it will store your dump files and logs.

    redis-server redis.conf

### Environment

When environement variables are needed, they should be added to your .env file as Foreman will use this to set the environment appropriately. A sample.env file has been included.

### Testing

Tests are done using rspec and capybara. Poltergeist is used so you will need to:

    brew install phantomjs

### Development

The application uses foreman so to fire everything up just do:

    ./bin/foreman start

Because you may have environment variables set in your `.env`, you should use foreman to run your console. A handy file has been added to the bin directory.

    ./bin/console

## Comments

Comments have been added through out several of the configuration files explaining why certain things were done the way they were done.