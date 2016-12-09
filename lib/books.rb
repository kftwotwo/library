class Book
 attr_reader(:title, :id)

 def initialize(attrs)
   @title = attrs[:title]
   @id = attrs[:id]
 end

 class << self
    def all
      # returned_books = DB.exec('SELECT * FROM books;')
      # books = []
      # returned_books.each do |book|
      #   title = book[@title]
      #   id = book[@id].to_i
      #   books.push(book)
      # end
      # books
      DB.exec('SELECT * FROM books')
    end

    def checkouts(id)
      DB.exec("SELECT books.title, checkouts.due_date, checkouts.return, checkouts.checkout_date FROM books JOIN books_checkout ON (books.id = books_checkout.book_id) JOIN checkouts ON (checkouts.id = books_checkout.checkout_it) WHERE books.id = #{id};")
    end

    def find(title)
      DB.exec("SELECT * FROM books WHERE title = '#{title}';")
    end

    def authors(id)
      DB.exec("SELECT authors.first_name, authors.last_name FROM books JOIN authors_books ON (books.id = authors_books.book_id) JOIN authors ON (authors.id = authors_books.author_id) WHERE books.id = #{id};")
    end
  end

  def ==(other)
    @title == other.title && @id == other.id
  end

  def save
    begin
      DB.exec("INSERT INTO books (title) VALUES ('#{@title}');")
      true
    rescue StandardError => e
      puts e.message
      false
    end
  end

  def delete
    begin
      DB.exec("DELETE FROM books WHERE title = '#{@title}'")
      true
    rescue StandardError => e
      puts e.message
      false
    end
  end

  def update(attributes)
    @title = attributes[:title]
    DB.exec("UPDATE books SET title = '#{@title}' RETURNING id;")
  end
end
