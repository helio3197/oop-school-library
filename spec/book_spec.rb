require 'rspec'
require './book'

describe Book do
  context 'Tests for the Book class' do
    before(:all) do
      @book = Book.new('Test Title', 'Test Author')
    end

    it 'A book object should contain an "id" attribute' do
      expect(@book.id).to be_instance_of Integer
    end

    it 'A book object should contain a "title" attribute' do
      expect(@book.title).to eql 'Test Title'
    end

    it 'A book object should contain an author attribute' do
      expect(@book.author).to eql 'Test Author'
    end

    it 'A book object should contain a working "add_rental" method' do
      rental = double('rental')

      allow(rental).to receive(:date) { '05/18/2022' }
      allow(rental).to receive(:book) { 'Test book' }
      allow(rental).to receive(:person) { 'Test person' }

      @book.add_rental(rental)

      expect(@book.rentals[0].date).to eql '05/18/2022'
      expect(@book.rentals[0].book).to eql 'Test book'
      expect(@book.rentals[0].person).to eql 'Test person'
    end
  end
end
