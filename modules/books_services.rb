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

end
