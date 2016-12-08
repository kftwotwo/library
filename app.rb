require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/authors')
require('./lib/books')
require('./lib/checkouts')
require('./lib/patrons')
require('pg')

DB = PG.connect({:dbname => "library_test"})

get('/') do
  erb(:index)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

get('/books/new') do
  erb(:new_book)
end
#
post('/books/new') do
  title = params[:title]
  id = params[:id]
  book = Book.new({:title => title, :id => id})
  book.save()
  erb(:thank_you)
end

get('/books/:id') do
  @books = Book.all()
  title = params[:title]
  id = params[:id]
  book = Book.new({:title => title, :id => id})
  book.save()
  Book.find(book)
  book = Book.find(params["id"].to_i())
  erb(:book)
end
