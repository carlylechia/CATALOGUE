require 'colorize'

class App

  def run
    loop do
      app_description
      option = gets.chomp.to_i
      select_option(option)
    end
  end

  def app_description
    puts " \n\nWelcome to The Catalogue of Items 😎 !\n\n".colorize(:light_green)
    sleep 0.5
    puts "Please choose an option by entering a number: \n".colorize(:light_blue)
    puts '  1 - List All Books'
    puts '  2 - List All Music Albums'
    puts '  3 - List All Games'
    puts '  4 - List All Labels'
    puts '  5 - List All Genres'
    puts '  6 - List All Authors'
    puts '  7 - Add A Book'
    puts '  8 - Add A Music Album'
    puts '  9 - Add A Game'
    puts '  10 - Exit'
  end

  def select_option(option)
    case option
    when 1..6
      list_service(option)
    when 7
      puts 'Awesome Let\'s add a book 📖'.colorize(:magenta)
      sleep 0.5
      add_book
    when 8
      puts 'Awesome Let\'s add a music album 🎶'.colorize(:magenta)
      sleep 0.5
      add_music_album
    when 9
      puts 'Awesome Let\'s add a game 🏈'
      sleep 0.5
      add_game
    when 10
      puts "Thank you for using the Catalogue of Items 👍\n".colorize(:green)
      sleep 0.5
      puts 'Goodbye, See you next Time 😀'.colorize(:magenta)
      exit
    else
      puts 'Please enter an option from the list'
    end
  end
end
