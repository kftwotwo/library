class Checkout
  attr_reader(:id)

  def initialize(attrs)
    @id = attrs[:id]
  end

  def checkout_date
    checkout = DateTime.now
  end
  #
  def return
    return_date = DateTime.now
  end

  def due_date
    new_date = DateTime.now
  end


end
