require('spec_helper')

describe(Author) do
  before :each do
    @author = Author.new({:name => 'andrew'})
    @author2 = Author.new({:name => 'andrew'})
  end

  describe('#initialize') do
    it "will initialize name and id" do
      expect(@author2.name).to eq 'andrew'
      expect(@author2.id).to eq nil
    end
  end

  describe('.all') do
    it "will show empty every time" do
      expect(Author.all).to eq []
    end
  end

  describe '#==' do
    it "will set equal database entries of the same name" do
      expect(@author).to eq(@author2)
    end
  end

  describe '#save' do
    it "will save the author to database" do
      @author.save()
      expect(Author.all).to be_an_instance_of(Array)
    end
  end
end
