class Checkout
  attr_reader(:id)

  def initialize(attrs)
    @id = attrs[:id]
  end

  def checkout_date
    checkout = Time.new.to_s
    checkout = checkout.split(" ")
    checkout = checkout.first
  end

  def return
    checkout = Time.new.to_s
    checkout = checkout.split(" ")
    checkout = checkout.first
  end
end
