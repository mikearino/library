require 'spec_helper'

describe '#Checkout' do

  describe('.all') do
    it("returns an empty array when there are no checkouts") do
      expect(Checkout.all).to(eq([]))
    end
  end

  before :each do
    book = Book.new(:title => "Drangus Trials", :author => "Fran Germpkin", :id => nil)
    book2 = Book.new(:title => "Dog Flipping", :author => "Braun McDogFlipper", :id => nil)
    customer = Customer.new(:name => "Gary Riversnap", :id => nil)
    customer2 = Customer.new(:name => "Jane Badfall", :id => nil)
  end

  describe("#save") do
    it("saves a checkout") do
      checkout = Checkout.new({:customer_id => 1, :book_id => 1, :id => nil, :due_date => '1996-07-12'})
      checkout.save
      checkout2 = Checkout.new({:customer_id => 2, :book_id => 2, :id => nil, :due_date => '1996-07-12'})
      checkout2.save
      expect(Checkout.all).to(eq([checkout, checkout2]))
    end
  end

  describe('.clear') do
    it("clears all checkouts") do
      checkout = Checkout.new({:customer_id => 1, :book_id => 1, :id => nil, :due_date => '1996-07-12'})
      checkout.save
      checkout2 = Checkout.new({:customer_id => 2, :book_id => 2, :id => nil, :due_date => '1996-07-12'})
      checkout2.save
      Checkout.clear
      expect(Checkout.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      checkout = Checkout.new({:customer_id => 1, :book_id => 1, :id => nil, :due_date => '15/06/1998'})
      checkout2 = Checkout.new({:customer_id => 1, :book_id => 1, :id => nil, :due_date => '15/06/1998'})
      expect(checkout).to(eq(checkout2))
    end
  end

#   describe('.find') do
#     it('finds a checkout by id') do
#       checkout = Checkout.new({:customer_id => "Wheres Waldo", :id => nil})
#       checkout.save
#       checkout2 = Checkout.new({:customer_id => "Hot Trash", :id => nil})
#       checkout2.save
#       expect(Checkout.find(checkout.id)).to(eq(checkout))
#     end
#   end
end
