require 'yaml/store'

class Book
  attr_accessor :title, :pages
end

store = YAML::Store.new('books.yml')

book = Book.new
book.title = "Head First Ruby"
book.pages = 450

store.transaction do
  store['HFRB'] = book
end