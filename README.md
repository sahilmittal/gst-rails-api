# GST India APIs

* Ruby version:  `2.4.0`
* Rails version: `5.1.1`
* Database: `PostgreSQL`
* Application server: `Passenger`
* Web server: `nginx`
* Deployment tool: `capistrano`

## Database

Database creation: 

```
mysql> CREATE DATABASE gst_development;
```

Database migrations:
```
bundle exec rake db:migrate
```

## Running

Start a local server (port: 3000) :

```
> rails s
```

## Deployment

```
> cap production deploy
```