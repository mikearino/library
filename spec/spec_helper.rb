require 'rspec'
require 'pg'
require 'book'
require 'customer'
require 'pry'


DB = PG.connect({:dbname => 'library'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM customers *;")
  end
end
