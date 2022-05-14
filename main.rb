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

def create_book
  print 'Title: '
  title = gets.chomp

  print 'Author: '
  author = gets.chomp

  @app.create_book(title, author)

  print "Book created successfully\n\n"
end

def print_books
  if @app.list_books.length.zero?
    puts 'There aren\'t books yet.'
  else
    @app.list_books.each do |book|
      puts "Title: \"#{book.title}\", Author: \"#{book.author}\""
    end
  end

  print "\n"
end

def print_people
  if @app.list_people.length.zero?
    puts 'There aren\'t persons yet.'
  else
    @app.list_people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  print "\n"
end

def print_books_for_rental
  puts 'Select a book from the following list by number'

  @app.list_books.each_with_index do |book, index|
    puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\""
  end

  print 'Enter a number: '
  selection = gets.chomp
  if selection.to_i >= @app.list_books.length || /\D/.match?(selection)
    print "Invalid input.\n\n"

    return 'invalid'
  end

  print "\n"

  selection.to_i
end

def print_persons_for_rental
  puts 'Select a person from the following list by number (not id)'

  @app.list_people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  print 'Enter a number: '
  selection = gets.chomp
  if selection.to_i >= @app.list_people.length || /\D/.match?(selection)
    print "Invalid input.\n\n"

    return 'invalid'
  end

  print "\n"

  selection.to_i
end

def create_rental
  return print "There aren\'t persons yet.\n\n" if @app.list_people.empty?
  return print "There aren\'t books yet.\n\n" if @app.list_books.empty?

  book_index = print_books_for_rental
  return create_rental if book_index == 'invalid'

  person_index = print_persons_for_rental
  return create_rental if person_index == 'invalid'

  print 'Date: '
  date = gets.chomp

  @app.create_rental(date, @app.list_books[book_index], @app.list_people[person_index])

  puts 'Rental created successfully'
  print "\n"
end

def print_rentals_by_id
  return print "There aren\'t persons yet.\n\n" if @app.list_people.empty?

  print 'ID of person: '
  id = gets.chomp

  if /\D/.match?(id)
    print "Invalid ID\n\n"

    return print_rentals_by_id
  end

  id = id.to_i

  filter_person = @app.list_people.filter { |item| item.id == id }

  return print "There is no person with id = #{id}.\n\n" if filter_person.empty?

  return print "There are no rentals for this person.\n\n" if filter_person[0].rentals.empty?

  puts 'Rentals:'
  filter_person[0].rentals.each do |rental|
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
  end

  print "\n"
end

def run_selection(selection)
  case selection
  when '1'
    print_books
  when '2'
    print_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    print_rentals_by_id
  else
    puts 'Invalid option'
  end
end

def main
  @app = App.new
  Kernel.loop { run_selection(print_options) }
end

main
