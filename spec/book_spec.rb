require 'rspec'
require './book'

describe Book do
  context 'Tests for the Book class' do
    before(:all) do
      @book = Book.new('Test Title', 'Test Author')
    end

    it 'A book object should contain an id attribute' do
      expect(@book.id).to be_instance_of Integer
    end

    it 'A book object should contain a title attribute' do
      expect(@book.title).to eql 'Test Title'
    end 

    it 'Abook object should contain an author attribute' do
      expect(@book.author).to eql 'Test Author'
    end
  end
end
