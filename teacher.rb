require './person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :id

  def initialize(specialization, age, name = 'unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
