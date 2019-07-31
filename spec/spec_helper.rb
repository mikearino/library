require 'rspec'
require 'pg'
require 'book'
require 'customer'
require 'checkout'
require 'pry'


DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM customers *;")
    DB.exec("DELETE FROM checkouts *;")
  end
end
