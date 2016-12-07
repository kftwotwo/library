require('spec_helper')

describe(Book) do
  before :each do
    @book = Book.new({:title => "Desert Solitaire"})
    @book2 = Book.new({:title => "Desert Solitaire"})
  end

  describe('#initialize') do
    it "will initialize title and id" do
      expect(@book2.title).to eq "Desert Solitaire"
      expect(@book2.id).to eq nil
    end
  end

  describe('.all') do
    it "will show empty every time" do
      expect(Book.all).to eq []
    end
  end

  describe '#==' do
    it "will set equal database entries of the same title" do
      expect(@book).to eq(@book2)
    end
  end

  describe '#save' do
    it "will save the book to database" do
      @book.save()
      expect(Book.all).to be_an_instance_of(Array)
    end
  end
end
