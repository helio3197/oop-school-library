require 'json'
require_relative 'classroom'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def read_books
  data = []
  if File.exist?('books.json')
    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book|
      data.push(Book.new(book['title'], book['author'], book['id']))
    end
  end
  data
end

def read_people
  persons = []
  if File.exist?('persons.json')
    classroom = Classroom.new('Microverse classroom')
    people_data = JSON.parse(File.read('persons.json'))
    people_data.each do |person|
      if person['specialization']
        persons.push(Teacher.new(person['specialization'], person['age'], person['name'], person['id']))
      else
        persons.push(Student.new(classroom, person['age'], person['name'], person['id'],
                                 parent_permission: person['parent_permission']))
      end
    end
  end
  [persons, classroom]
end

def read_rentals(books, persons)
  rentals = []
  if File.exist?('rentals.json')
    rentals_data = JSON.parse(File.read('rentals.json'))
    rentals_data.each do |rental|
      person = persons.select { |item| item.id == rental['person_id'] }
      book = books.select { |item| item.id == rental['book_id'] }
      rentals.push(Rental.new(rental['date'], book[0], person[0]))
    end
  end
  rentals
end
