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
  end

  def ==(other)
    @first_name == other.first_name && @last_name == other.last_name && @id == other.id
  end

  def save
   DB.exec("INSERT INTO authors (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
  end
end
