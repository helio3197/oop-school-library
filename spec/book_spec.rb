require 'rspec'
require './book'

describe Book do
  it 'some test' do
    book = Book.new('Test Title', 'Test Author')
    expec(book.id).to instance_of Number
  end
end
