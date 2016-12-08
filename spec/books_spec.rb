require('spec_helper')

describe(Book) do
  describe('#initialize') do
    it "will initialize title and id" do
      @book2 = Book.new({:title => "Desert Solitaire"})
      @book2.save
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
      @book = Book.new({:title => "Desert Solitaire"})
      @book2 = Book.new({:title => "Desert Solitaire"})
      @book.save
      @book2.save
      expect(@book).to eq(@book2)
    end
  end

  describe '.save' do
    it "will save the book to database" do
      @book = Book.new({:title => "Desert Solitaire"})
      @book.save()
      expect(Book.all).to be_an_instance_of(Array)
    end
  end

  describe('.find') do
    it "will find a book" do
      @book = Book.new({:title => "Desert_Solitaire"})
      book = @book.save
      expect(Book.find(@book.title).first['id']).to eq '1'
    end
  end

  describe '.checkouts' do
    it "show the history of the book" do
      @book = Book.new({:title => "Desert_Solitaire"})
      @book.save
      DB.exec("INSERT INTO checkouts (due_date, return, checkout_date) VALUES ('2016-31-0', '2016-12-12', '2016-12-07');")
      DB.exec("INSERT INTO books_checkout (checkout_it, book_id) VALUES (1, 1);")
      book = Book.find(@book.title)
      expect(Book.checkouts(book.first['id']).count).to eq 1
    end
  end

  describe('.authors') do
    it "will show author id to the joined table authors book" do
      @book = Book.new({:title => "Desert_Solitaire"})
      @book.save
      DB.exec("INSERT INTO authors_books (book_id, author_id) VALUES (1, 1);")
      DB.exec("INSERT INTO authors (first_name, last_name) VALUES ('Bobbie', 'Maggie');")
      book = Book.find(@book.title)
      expect(Book.authors(book.first['id']).count).to eq 1
    end
  end
end
