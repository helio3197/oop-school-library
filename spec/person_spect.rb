require 'rspect'
require './person'

describe Person do
    context 'Create a Person' do
        it 'Can create a person' do
            name = 'Van Darkholme'
            age = 16
            permission = true
            person = Person.new(age, name: name, parent_permission: permission)
            expect(person.age).to eq(16)
            expect(person.correct_name).to eq('Van Darkholme')
        end
        it 'Can have correct name' do
            name = 'Van Darkholme'
            age = 16
            person = Person.new(age, name: name)
            expect(person.correct_name).to eq('Van Darkholme')
        end
        it 'Can have parent permission' do
            age = 16
            permission = true
            person = Person.new(age, parent_permission: permission)
            expect(person.parent_permission).to eq(true)
        end
    end
end