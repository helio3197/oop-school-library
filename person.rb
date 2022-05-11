class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1000)
  end

  private

  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
