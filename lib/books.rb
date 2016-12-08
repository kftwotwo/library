class Book
 attr_reader(:title, :id)

 def initialize(attrs)
   @title = attrs[:title]
   @id = attrs[:id]
 end

 class << self
    def all
      returned_books = DB.exec('SELECT * FROM books;')
      books = []
      returned_books.each do |book|
        title = book[@title]
        id = book[@id].to_i
        books.push(book)
      end
      books
    end

    def checkouts(id)
      DB.exec("SELECT books.title, checkouts.due_date, checkouts.return, checkouts.checkout_date FROM books JOIN books_checkout ON (books.id = books_checkout.book_id) JOIN checkouts ON (checkouts.id = books_checkout.checkout_it) WHERE books.id = #{id};")
    end

    def find(title)
      DB.exec("SELECT * FROM books WHERE title = '#{title}';")
    end
  end


  def ==(other)
    @title == other.title && @id == other.id
  end

  def save
   DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
  end

end
