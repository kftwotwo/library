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
      checkout = DateTime.now
      expect(@checkout.checkout_date).to be_within(0.2).of checkout
    end
  end

  describe('#return') do
    it "will show the returned date" do
      return_date = DateTime.now
      expect(@checkout.return).to be_within(0.2).of return_date
    end
  end

  describe('#due_date') do
    it "will add a month to the current date" do
      new_date = DateTime.now
      expect(@checkout.due_date).to be_within(0.2).of new_date
    end
  end
end
