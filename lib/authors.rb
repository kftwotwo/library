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
end
