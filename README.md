# DB2 ODBCAdapter

[![Gem Version](https://badge.fury.io/rb/db2_odbc_adapter.svg)](https://badge.fury.io/rb/db2_odbc_adapter)

An ActiveRecord DB2 ODBC adapter. 
It is a fork of [ActiveRecord odbc_adapter](https://github.com/localytics/odbc_adapter) with a minor hack so that it can work only with DB2 Connection on Rails 6+.

## Installation

Ensure you have the ODBC driver installed on your machine. And have a DB2 server to connect.

Add this line to your application's Gemfile:

```ruby
gem 'db2_odbc_adapter'
```

And then execute:
```
  $ bundle
```

Or install it yourself as:
```
  $ gem install db2_odbc_adapter
```

## Usage

Configure your `database.yml` by using the `dsn` to point to a DSN that corresponds to a valid entry in your `~/etc/odbc.ini` file. Since Rails 6+ support multiple database, so the database configuration is as follow: 

```
# config/database.yml

default: &default
.
.
.
db2_connection: &db2_connection   // as you wish
  adapter: odbc                   // compulsory 
  dsn: YourDatabaseDSN            // as in the odbc.ini file

development:
  primary:
    .
    .
    .
  db2:
    <<: *db2_connection

test:
  primary:
    .
    .
    .
  db2:
    <<: *db2_connection

production:
  primary:
    .
    .
    .
  db2:
    <<: *db2_connection

```

and use it at your model as follow.

Single table connection

```ruby
  class MyTable < ActiveRecord::Base
    establish_connection :db2
    self.table_name  = "TableName"       #table name at DB2 server
    self.primary_key = 'column_name'    #colum that have unique content since db2 have RRN instead of id 
  end

```

Raw SQL connection

```ruby
  class MyCustomModel < ActiveRecord::Base
    establish_connection :db2
    scope :scope_name, -> arg {
      connection.exec_query("SELECT * FROM .........WHERE ..'#{arg}...")
    }
  end
```

ActiveRecord models that use this connection will now be connecting to the configured database using the ODBC driver.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
