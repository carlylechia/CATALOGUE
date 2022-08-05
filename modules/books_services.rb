require_relative '../lib/book'
require_relative '../lib/label'
require_relative 'save_data'

module BooksServices
  def get_input_label(input)
    output = ''
    while output.empty?
      print "Enter #{input} of the label for the book: "
      output = gets.chomp
      puts "Label #{input}  cannot be blank, please enter a valid label #{input}\n".colorize(:red) if output.empty?
    end
    output
  end

  def get_input_book(input)
    output = ''
    while output.empty?
      print "Enter the #{input} of the book: "
      output = gets.chomp
      puts "Book #{input}  cannot be blank, please enter a valid #{input}\n".colorize(:red) if output.empty?
    end
    output
  end

  def valid_date_string?(input)
    return false unless input.is_a?(String)
    return false unless input =~ /\A\d+-\d+-\d+\z/

    parts = input.split('-').map(&:to_i)
    Date.valid_date?(*parts)
  end

  def valid_date
    loop do
      print 'Enter book publish date (yyyy-mm-dd): '
      input_date = gets.chomp
      return input_date if valid_date_string?(input_date)

      puts "Invalid date given. Please try again...\n".colorize(:red)
    end
    input_date
  end

  def add_book
    books = []
    book_name = get_input_book('name')
    publisher_name = get_input_book('publisher name')
    cover_state = get_input_book('cover state')
    publish_date = valid_date
    label_title = get_input_label('title')
    label_color = get_input_label('color')

    book = Book.new(book_name, publisher_name, cover_state, publish_date)
    puts "Book #{book_name} created successfully\n".colorize(:green)
    sleep 0.5
    label = Label.new(label_title, label_color)
    book.add_label(label)
    books << book
    SaveData.save_books(books)
  end
end
