require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
