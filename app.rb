require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/customer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "library"})
