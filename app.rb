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
  @checkouts = Checkout.all
  erb :books
end

post('/books/search') do
  search_input = params[:search]
  @results = Book.search(search_input)
  erb :search_results
end

get('/books/:id') do
  @book = Book.find(params[:id].to_i)
  @customers = Customer.all
  erb :book
end

post('/books/:id') do
  @book = Book.find(params[:id].to_i)
  @customers = Customer.all
  customer_id = params[:customer]

  new_checkout = Checkout.new(:customer_id => customer_id, :book_id => @book.id, :due_date => '2001-4-20', :id => nil)
  new_checkout.save
  redirect to '/books'
end
