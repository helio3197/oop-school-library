require './book'
require './classroom'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @classroom = Classroom.new('Microverse classroom')
    @books_list = []
    @people_list = []
    @rentals = []
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

  def create_teacher(specialization, age, name = 'unknown')
    @people_list << Teacher.new(specialization, age, name)
  end

  def list_rental_by_id(id)
    filter_list = @people_list.filter { |item| item.id == id }
    filter_list[0].rentals
  end

  def create_rental(date, book, person)
    @rentals << Rental.new(date, book, person)
  end
end
