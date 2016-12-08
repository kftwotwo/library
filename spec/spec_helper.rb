require("rspec")
require('pry')
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
    DB.exec("DELETE FROM books_checkout *;")
    DB.exec("DELETE FROM authors_books *;")

    DB.exec('ALTER SEQUENCE books_id_seq RESTART WITH 1')
    DB.exec('ALTER SEQUENCE checkouts_id_seq RESTART WITH 1')
  end
end
