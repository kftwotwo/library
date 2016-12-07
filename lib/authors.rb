class Author
 attr_reader(:name, :id)

 def initialize(attrs)
   @name = attrs[:name]
   @id = attrs[:id]
 end

 class << self
    def all
      returned_authors = DB.exec('SELECT * FROM authors;')
      authors = []
      returned_authors.each do |author|
        name = author[@name]
        id = author[@id].to_i
        authors.push(author)
      end
      authors
    end
  end

  def ==(other)
    @name == other.name && @id == other.id
  end

  def save
   DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
  end
end
