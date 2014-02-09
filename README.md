## Information
Very simple application for applying dynamo as angular-resource backend. It creates and updates simple object with rails's scaffold like interface.

![htmlimage](https://raw.github.com/parroty/dynamo_angular/master/image/image.png)

### Prerequisites
- Install PostgreSQL
- Create "ecto_simple" database on PostgreSQL
    - ecto repo is defined as `ecto://postgres:postgres@localhost/ecto_simple`.

```
$ psql postgres
psql (9.1.11)
Type "help" for help.

postgres=# create database ecto_simple;
postgres=# \q
```

### Trying Sample

Download the sample.

    $ git clone git://github.com/parroty/dynamo_angular.git
    $ cd dynamo_angular

Install prerequisite component.

    $ mix deps.get

Migrate database

    $ mix ecto.migrate Repo

Launch server.

    $ mix server

Open the url with the browser

    $ open http://localhost:4000
