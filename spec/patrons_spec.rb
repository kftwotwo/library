require('spec_helper')

describe(Patron) do
  before :each do
    @patron = Patron.new({:name => 'kevin'})
    @patron2 = Patron.new({:name => 'kevin'})
  end

  describe('#initialize') do
    it "will initialize name and id" do
      expect(@patron2.name).to eq 'kevin'
      expect(@patron2.id).to eq nil
    end
  end

  describe('.all') do
    it "will show empty every time" do
      expect(Patron.all).to eq []
    end
  end

  describe '#==' do
    it "will set equal database entries of the same name" do
      expect(@patron).to eq(@patron2)
    end
  end

  describe '#save' do
    it "will save the patron to database" do
      @patron.save()
      expect(Patron.all).to be_an_instance_of(Array)
    end
  end
end
