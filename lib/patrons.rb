class Patron
 attr_reader(:name, :id)

 def initialize(attrs)
   @name = attrs[:name]
   @id = attrs[:id]
 end

 class << self
    def all
      returned_patrons = DB.exec('SELECT * FROM patrons;')
      patrons = []
      returned_patrons.each do |patron|
        name = patron[@name]
        id = patron[@id].to_i
        patrons.push(patron)
      end
      patrons
    end
  end

  def ==(other)
    @name == other.name && @id == other.id
  end

  def save
   DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
  end
end
