class Checkout
  attr_accessor :customer_id, :book_id, :due_date
  attr_reader :id

  def initialize (attributes)
    @customer_id = attributes.fetch(:customer_id)
    @book_id = attributes.fetch(:book_id)
    @id = attributes.fetch(:id)
    @due_date = attributes.fetch(:due_date)
  end

  def self.all
    returned_checkouts = DB.exec("SELECT * FROM checkouts")
    checkouts = []
    returned_checkouts.each do |checkout|
      binding.pry
      book_id = checkout["book_id"].to_i
      id = checkout["id"].to_i
      customer_id = checkout["customer_id"].to_i
      due_date = checkout["due_date"]
      checkouts.push(Checkout.new({:customer_id => customer_id, :book_id => book_id, :due_date => due_date, :id => id}))
    end
    checkouts
  end

  def save
    result = DB.exec("INSERT INTO checkouts (customer_id, book_id, due_date) VALUES (#{@customer_id}, #{@book_id}, '#{@due_date}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(checkout_to_compare)
    self.id() == checkout_to_compare.id()
  end

  def self.clear
    DB.exec("DELETE FROM checkouts *")
  end

end
