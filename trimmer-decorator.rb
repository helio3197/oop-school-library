require './decorator.rb'

class TrimmerDecorator < Decorator
  def correct_name
    str = super
    return str[0, 10] if str.length > 10

    str
  end
end
