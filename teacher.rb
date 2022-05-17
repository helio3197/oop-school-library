require './person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :id

  def initialize(specialization, age, name = 'unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @id = id || Random.rand(1..1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
