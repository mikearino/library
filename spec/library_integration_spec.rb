require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('show landing page', {:type => :feature}) do
  it('clicks on a book, selects a customer and checks out ') do
    DB.exec("INSERT INTO books (title, author) values ('The Jangus Saga', 'Steve Krungus');")
    DB.exec("INSERT INTO customers (name) values ('George Hair');")
    visit('/books')
    click_on('The Jangus Saga')
    click_on('Rent')
    expect(page).to have_content('George Hair The Jangus Saga Due Date: 2001-04-20')
  end
end
