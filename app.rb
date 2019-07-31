require('sinatra')
require('sinatra/reloader')
require('./lib/checkout')
require('./lib/book')
require('./lib/customer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "library"})

get ('/') do
  redirect('/books')
end

get('/books') do
  @books = Book.all
  erb :books
end

get('/books/:id') do
  @book = Book.find(params[:id].to_i)
  erb :book
end

post('/books/search') do
  search_input = params[:search]
  @results = Book.search(search_input)
  erb :search_results
end
