require './book'

class App
  def initialize
    @books_list = []
  end

  def list_all_books
    @books_list
  end

  def create_book(title, author)
    @books_list << Book.new(title, author)
  end

end
