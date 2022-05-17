require 'json'
require_relative 'app'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'

def save_person(person)
    person_data = []
    person.each do |person|
        if person.instance_of?(Teacher)
            person_data.push({ id: person.id, name: person.name, age: person.age, specialization: person.specialization })
        elsif person.instance_of?(Student)
            person_data.push({ id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission })
        end
    end
    File.write('person.json', JSON.generate(people_data))
end

def save_book(books)
    data = []
    books.each do |book|
        data.push({ id: book.id, title: book.title, author: book.author })
    end
    File.write('book.json', JSON.generate(data))
end

def save_rental(rentals)
    rentals_data = []
    rentals.each do |rental|
        rentals_data.push({ date: rental.date, person_id: rental.person.id, book_id: rental.book.id })
    end
    File.write('rental.json', JSON.generate(rentals_data))
end
