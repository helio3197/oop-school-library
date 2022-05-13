require './book'
require './classroom'
require './student'
require './teacher'

class App
  def initialize
    @classroom = Classroom.new('Microverse classroom')
    @books_list = []
    @people_list = []
  end

  def list_books
    @books_list
  end

  def create_book(title, author)
    @books_list << Book.new(title, author)
  end

  def list_people
    @people_list
  end

  def create_student(age, name = 'unknown', has_permission: true)
    @people_list << Student.new(@classroom, age, name, parent_permission: has_permission)
  end
end
