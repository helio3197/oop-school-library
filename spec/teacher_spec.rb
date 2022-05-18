require './teacher'

describe Teacher do
  context 'Tests for the Teacher class' do
    before(:all) do
      @teacher = Teacher.new('Teach', '32', 'Test Teacher')
    end

    it 'A teacher object should contain a "specialization" attribute' do
      expect(@teacher.specialization).to eql 'Teach'
    end

    it 'A teacher object should contain an "age" attribute' do
      expect(@teacher.age).to eql '32'
    end

    it 'A teacher object should contain an "name" attribute' do
      expect(@teacher.name).to eql 'Test Teacher'
    end

    it 'A teacher object should contain an "id" attribute' do
      expect(@teacher.id).to be_instance_of Integer
    end

    it 'A teacher object should contain an "can_use_services?" method' do
      expect(@teacher.can_use_services?).to eql true
    end
  end
end
