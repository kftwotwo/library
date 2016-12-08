class Author
 attr_reader(:first_name, :last_name, :id)

 def initialize(attrs)
   @first_name = attrs[:first_name]
   @last_name = attrs[:last_name]
   @id = attrs[:id]
 end

 class << self
    def all
      returned_authors = DB.exec('SELECT * FROM authors;')
      authors = []
      returned_authors.each do |author|
        authors.push(author)
      end
      authors
    end

    def find(last_name)
      DB.exec("SELECT * FROM authors WHERE last_name = '#{last_name}';")
    end

    def books(id)
      DB.exec("SELECT books.title FROM authors JOIN authors_books ON (authors.id = authors_books.author_id) JOIN books ON (books.id = authors_books.book_id) WHERE authors.id = #{id};")
    end
  end

  def ==(other)
    @first_name == other.first_name && @last_name == other.last_name && @id == other.id
  end

  def save
   DB.exec("INSERT INTO authors (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
  end
end
