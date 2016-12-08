require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/authors')
require('./lib/books')
require('./lib/checkouts')
require('./lib/patrons')
require('pg')

DB = PG.connect({:dbname => "library"})

get('/') do
  erb(:index)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

# get('/books/new') do
#   erb(:new_book)
# end
#
# post('/books/new') do
#   title = params[:title]
#   book = Book.new({:title => 'Nemo'})
#   book.save()
#   erb(:thank_you)
# end
