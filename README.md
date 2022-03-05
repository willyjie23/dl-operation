# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Environment

The setups steps expect following tools installed on the system.

- Ruby 3.0.2
- Rails 6.1.4
- SQLite

## Repo

##### 1. Check out the repository

repo url : git@github.com:willyjie23/dl-operation.git

```bash
git clone git@github.com:willyjie23/dl-operation.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```bash
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```bash
rails server
```

login user
```
## admin user
email: 'admin@gmail.com',
password: '123456'

## client user
email: 'client@gmail.com',
password: '123456'
```

And now you can visit the site with the URL http://localhost:3000