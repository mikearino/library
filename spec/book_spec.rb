require 'spec_helper'

describe '#Book' do

  describe('.all') do
    it("returns an empty array when there are no books") do
      expect(Book.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a book") do
      book = Book.new({:title => "Wheres Waldo", :id => nil, :author => "Ron"})
      book.save
      book2 = Book.new({:title => "Hot Trash", :id => nil, :author => "Doinkus"})
      book2.save
      expect(Book.all).to(eq([book, book2]))
    end
  end

  describe('.clear') do
    it("clears all books") do
      book = Book.new({:title => "Wheres Waldo", :id => nil, :author => "Ron"})
      book.save
      book2 = Book.new({:title => "Hot Trash", :id => nil, :author => "Doinkus"})
      book2.save
      Book.clear
      expect(Book.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      book = Book.new({:title => "Wheres Waldo", :id => nil, :author => "Ron"})
      book2 = Book.new({:title => "Wheres Waldo", :id => nil, :author => "Ron"})
      expect(book).to(eq(book2))
    end
  end

  describe('.find') do
    it('finds a book by id') do
      book = Book.new({:title => "Wheres Waldo", :id => nil, :author => "Ron"})
      book.save
      book2 = Book.new({:title => "Hot Trash", :id => nil, :author => "Doinkus"})
      book2.save
      expect(Book.find(book.id)).to(eq(book))
    end
  end
end
