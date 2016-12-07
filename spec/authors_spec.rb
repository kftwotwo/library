require('spec_helper')



describe(Author) do
  before :each  do
    @andrew = Author.new({:name => "andrew", :id => 1})
  end
  describe('#initialize') do
    it "will return name" do
      expect(@andrew.name).to eq "andrew"
      expect(@andrew.id).to eq 1
    end
  end

  describe('#save') do
    it "will save into the database" do
      @andrew.save()
      expect(Author.all).to eq [@andrew]
    end
  end

  describe(".all") do
    it "will return empty" do
      expect(Author.all()).to eq([])
    end
  end
end

# TODO: save
# TODO: all
