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
end
