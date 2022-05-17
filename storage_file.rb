require 'json'
require_relative 'app'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'

def save_persons(persons)
  person_data = []
  persons.each do |person|
    if person.instance_of?(Teacher)
      person_data.push({ id: person.id, name: person.name, age: person.age,
                         specialization: person.specialization })
    elsif person.instance_of?(Student)
      person_data.push({ id: person.id, name: person.name, age: person.age,
                         parent_permission: person.parent_permission })
    end
  end
  File.write('persons.json', JSON.generate(person_data))
end

def save_books(books)
  books_arr = []
  books.each do |book|
    books_arr.push({ id: book.id, title: book.title, author: book.author })
  end
  File.write('books.json', JSON.generate(books_arr))
end

def save_rentals(rentals)
  rentals_data = []
  rentals.each do |rental|
    rentals_data.push({ date: rental.date, person_id: rental.person.id, book_id: rental.book.id })
  end
  File.write('rentals.json', JSON.generate(rentals_data))
end
