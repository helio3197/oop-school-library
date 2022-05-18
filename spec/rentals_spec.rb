require 'rspec'
require './rental'
require './teacher'
require './student'
require './book'
require './person'

describe Rental do
    describe '#rental' do
        it 'Should return an empty array' do
            person = Person.new(0)
            expect(person.rentals.size).to eq(0)
        end
    end

    describe 'initialize' do
        it 'Should initialize a rental with a date' do
            classroom  = double('classroom')
            allow(classroom).to receive(:students) { [] }
            age = 16
            id = nil
            book = Book.new('Silmarillion', 'J.R.R. Tolkien')
            student = Student.new(classroom, age, id, 'Van Darkholme', parent_permission: true)
            rental = Rental.new('20220626', book, student)
            expect(rental.date).to eq('20220626')
        end
    end

    describe 'book' do
        it 'Should return a book' do
            classroom  = double('classroom')
            allow(classroom).to receive(:students) { [] }
            age = 16
            id = nil
            book = Book.new('Silmarillion', 'J.R.R. Tolkien')
            student = Student.new(classroom, age, id, 'Van Darkholme', parent_permission: true)
            rental = Rental.new('20220626', book, student)
            expect(rental.book).to eq(book)
        end
    end

    describe 'person' do
        it 'Should return a person' do
            classroom  = double('classroom')
            allow(classroom).to receive(:students) { [] }
            age = 16
            id = nil
            book = Book.new('Silmarillion', 'J.R.R. Tolkien')
            student = Student.new(classroom, age, id, 'Van Darkholme', parent_permission: true)
            rental = Rental.new('20220626', book, student)
            expect(rental.person).to eq(student)
        end
    end
end
