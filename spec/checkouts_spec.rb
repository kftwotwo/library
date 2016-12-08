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
      checkout = DateTime.new
      expect(@checkout.checkout_date).to eq(checkout)
    end
  end

  describe('#return') do
    it "will show the returned date" do
      return_date = DateTime.new
      expect(@checkout.return).to eq (return_date)
    end
  end

  describe('#due_date') do
    it "will add a month to the current date" do
      expect(@checkout.due_date).to eq (DateTime.new)
    end
  end
end
