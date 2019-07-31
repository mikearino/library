class Customer
  attr_accessor :name
  attr_reader :id

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each do |customer|
      name = customer.fetch("name")
      id = customer.fetch("id").to_i
      customers.push(Customer.new({:name => name, :id => id}))
    end
    customers
  end

  def save
    result = DB.exec("INSERT INTO customers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(customer_to_compare)
    self.name() == customer_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM customers *;")
  end

  def self.find(id)
    customer = DB.exec("SELECT * FROM customers WHERE id = #{id};").first
    name = customer.fetch("name")
    id = customer.fetch("id").to_i
    Customer.new({:name => name, :id => id})
  end
end
