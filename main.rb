require './app'

def print_options
  puts 'Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit'

  print 'Enter option: '
  gets.chomp
end

def create_student
  print 'Age: '
  age = gets.chomp
  if /\D/.match?(age) || age.length.zero?
    puts 'Invalid input. Age field must contain only integers.'
    return create_person
  end

  print 'Name: '
  name = gets.chomp

  print 'Has parent permission? [Y/N]: '
  permission = gets.chomp
  if %w[y Y].include?(permission) then permission = true
  elsif %w[n N].include?(permission) then permission = false
  else
    puts 'Invalid input. Parent permission field must contain only Y or N.'
    return create_person
  end

  @app.create_student(age, name, has_permission: permission)

  print "Person created successfully\n\n"
end

def create_teacher
  print 'Age: '
  age = gets.chomp
  if /\D/.match?(age) || age.length.zero?
    puts 'Invalid input. Age field must contain only integers.'
    return create_person
  end

  print 'Name: '
  name = gets.chomp

  print 'Specialization: '
  specialization = gets.chomp

  @app.create_teacher(specialization, age, name)

  print "Person created successfully\n\n"
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  selection = gets.chomp

  case selection
  when '1'
    create_student
  when '2'
    create_teacher
  else
    print "Invalid input.\n\n"
  end
end

def run_selection(selection)
  case selection
  when '1'
    @app.list_books
  when '2'
    puts @app.list_people[0].class
  when '3'
    create_person
  else
    puts 'Invalid option'
  end
end

def main
  @app = App.new
  Kernel.loop { run_selection(print_options) }
end

main