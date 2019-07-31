class Book
  attr_accessor :title, :author
  attr_reader :id

  def initialize (attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each do |book|
      title = book.fetch("title")
      id = book.fetch("id").to_i
      author = book.fetch("author").to_i
      books.push(Book.new({:title => title, :id => id, :author => author}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(book_to_compare)
    self.title() == book_to_compare.title()
  end

  def self.clear
    DB.exec("DELETE FROM books *;")
  end

  def self.find(id)
    book = DB.exec("SELECT * FROM books WHERE id = #{id};").first
    title = book.fetch("title")
    id = book.fetch("id").to_i
    author = book.fetch("author")
    Book.new({:title => title, :id => id, :author => author})
  end


end
