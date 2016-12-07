class Author
 attr_reader(:name, :id)

 def initialize(attrs)
   @name = attrs[:name]
   @id = attrs[:id]
 end
end
