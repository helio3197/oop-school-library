require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true, id:nil)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1000)
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end
end
