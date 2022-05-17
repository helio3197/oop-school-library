class Book
  attr_accessor :title, :author, :id
  attr_reader :rentals

  def initialize(title, author, id: nil)
    @id = id || Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
