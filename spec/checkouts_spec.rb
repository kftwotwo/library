require('spec_helper')

describe(Checkout) do
  before :each do
    @checkout = Checkout.new({:id => nil })
  end

  describe('#initialize') do
    it "will return the id" do
      expect(@checkout.id()).to(eq(nil))
    end
  end

  describe('#checkout_date') do
    it "will show the checked out date" do
      checkout = Time.new.to_s
      checkout = checkout.split(" ")
      checkout = checkout.first
      expect(@checkout.checkout_date).to eq (checkout)
    end
  end
end
