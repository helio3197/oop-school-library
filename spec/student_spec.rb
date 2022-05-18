require './student'

describe Student do
  context 'Tests for the Student class' do
    it 'A student object should contain a "classroom" attribute' do
      classroom = double('classroom')
      allow(classroom).to receive(:students) { [] }
      allow(classroom).to receive(:label) { 'Test classroom' }

      student = Student.new(classroom, '21', 'Test Student')
      expect(student.classroom.label).to eql 'Test classroom'
    end

    it 'A student object should contain atributes for "age", "name", "id" and "parent_permission"' do
      classroom = double('classroom')
      allow(classroom).to receive(:students) { [] }
      allow(classroom).to receive(:label) { 'Test classroom' }

      student = Student.new(classroom, '21', 'Test Student')

      expect(student.id).to be_instance_of Integer
      expect(student.age).to eql '21'
      expect(student.name).to eql 'Test Student'
      expect(student.parent_permission).to eql true
    end

    it 'A student object should contain a working "play_hooky" method' do
      classroom = double('classroom')
      allow(classroom).to receive(:students) { [] }
      allow(classroom).to receive(:label) { 'Test classroom' }

      student = Student.new(classroom, '21', 'Test Student')

      expect(student.play_hooky).to eql '¯\(ツ)/¯'
    end
  end
end
