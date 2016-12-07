require("rspec")
require("./lib/authors")
require("./lib/books")
require("./lib/checkouts")
require("./lib/patrons")
require('pg')

DB = PG.connect({:dbname => "library_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM checkouts *;")
    DB.exec("DELETE FROM patrons *;")
  end
end
