class Checkout
  attr_reader(:id)

  def initialize(attrs)
    @id = attrs[:id]
  end

  def checkout_date
    checkout = DateTime.new
  end

  def return
    return_date = DateTime.new
  end

  def due_date
    new_date = DateTime.new
  end
end
