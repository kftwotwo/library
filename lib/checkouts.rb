class Checkout
  attr_reader(:id)

  def initialize(attrs)
    @id = attrs[:id]
  end

end
