require 'spec_helper'

describe '#Customer' do

  describe('.all') do
    it("returns an empty array when there are no customers") do
      expect(Customer.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a customer") do
      customer = Customer.new({:name => "Wheres Waldo", :id => nil})
      customer.save
      customer2 = Customer.new({:name => "Hot Trash", :id => nil})
      customer2.save
      expect(Customer.all).to(eq([customer, customer2]))
    end
  end

  describe('.clear') do
    it("clears all customers") do
      customer = Customer.new({:name => "Wheres Waldo", :id => nil})
      customer.save
      customer2 = Customer.new({:name => "Hot Trash", :id => nil})
      customer2.save
      Customer.clear
      expect(Customer.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      customer = Customer.new({:name => "Wheres Waldo", :id => nil})
      customer2 = Customer.new({:name => "Wheres Waldo", :id => nil})
      expect(customer).to(eq(customer2))
    end
  end

  describe('.find') do
    it('finds a customer by id') do
      customer = Customer.new({:name => "Wheres Waldo", :id => nil})
      customer.save
      customer2 = Customer.new({:name => "Hot Trash", :id => nil})
      customer2.save
      expect(Customer.find(customer.id)).to(eq(customer))
    end
  end
end
