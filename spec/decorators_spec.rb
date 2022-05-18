require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'

describe 'Tests for decorator classes' do
  context Decorator do
    it 'A decorator object should contain a "correct_name" method and it shoud raise a "NotImplementedError"' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name) { raise NotImplementedError }
      decorator = Decorator.new(nameable)

      expect { decorator.correct_name }.to raise_error(NotImplementedError)
    end
  end

  context CapitalizeDecorator do
    it 'A CapitalizeDecorator decorator should return a capitalized string for correct_name method' do
      person = double('person')
      allow(person).to receive(:correct_name) { 'test' }

      capitalize_decorator = CapitalizeDecorator.new(person)

      expect(capitalize_decorator.correct_name).to eql 'Test'
    end
  end

  context TrimmerDecorator do
    it 'A TrimmerDecorator decorator should return a trimmed string for correct_name method when the string length is more than 10' do
      person = double('person')
      allow(person).to receive(:correct_name) { 'testtesttest' }

      trimmer_decorator = TrimmerDecorator.new(person)

      expect(trimmer_decorator.correct_name).to eql 'testtestte'
    end
  end
end
