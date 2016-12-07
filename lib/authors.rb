class Author
  attr_reader(:name, :id)

  def initialize(attrs)
    @name = attrs[:name]
    @id = attrs[:id]
  end

  # class << self
  #   def all
  #     returned_authors = DB.exec('select * from authors')
  #     authors = []
  #     returned_authors.each() do |author|
  #       name = author.fetch("name")
  #       authors.push(Author.new({:name => name}))
  #     end
  #     authors
  #   end
  # end
  #
  # def save
  #   DB.exec("INSERT INTO authors (id_authors, name) VALUES (#{@id or 'NULL'}, '#{@name}')")
  # end
  #
  # def ==(other)
  #   @name = other.name and @id = other.id
  # end
end
