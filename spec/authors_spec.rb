require('spec_helper')

describe(Author) do
  before :each do
    @author = Author.new({:first_name => 'andrew', :last_name => 'joe'})
    @author2 = Author.new({:first_name => 'andrew', :last_name => "joe"})
  end

  describe('#initialize') do
    it "will initialize name, last and id" do
      expect(@author2.first_name).to eq 'andrew'
      expect(@author2.last_name).to eq 'joe'
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

  describe('.find') do
    it "will find a author" do
      @author = Author.new({:first_name => 'Bobbie', :last_name => 'Maggie'})
      author = @author.save
      expect(Author.find(@author.last_name).first['id']).to eq '1'
    end
  end

  describe('.books') do
    it "will show book id to the joined table authors book" do
      @author = Author.new({:first_name => "Bobbie", :last_name => "Maggie"})
      @author.save
      DB.exec("INSERT INTO authors_books (book_id, author_id) VALUES (1, 1);")
      DB.exec("INSERT INTO books (title) VALUES ('Hello');")
      author = Author.find(@author.last_name)
      expect(Author.books(author.first['id']).count).to eq 1
    end
  end
end
