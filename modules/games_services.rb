require_relative '../lib/game'
require_relative '../lib/author'
require_relative 'save_data'
require 'pry'

module GamesServices
  include SaveData

  def get_input_author(input)
    output = ''
    while output.empty?
      print "Enter #{input} of the author for the game: "
      output = gets.chomp
      puts "Label #{input}  cannot be blank, please enter a valid author #{input} " if output.empty?
    end
    output
  end

  def get_input_game(input)
    output = ''
    while output.empty?
      print "Enter the #{input} of the game: "
      output = gets.chomp
      puts "Game #{input}  cannot be blank, please enter a valid #{input} " if output.empty?
    end
    output
  end

  def valid_date_string?(input)
    return false unless input.is_a?(String)
    return false unless input =~ /\A\d+-\d+-\d+\z/

    parts = input.split('-').map(&:to_i)
    Date.valid_date?(*parts)
  end

  def validate_date(input)
    input_date = ''
    while input_date.empty? || !valid_date_string?(input_date)
      print "Enter Game #{input} date (yyyy-mm-dd): "
      input_date = gets.chomp
      return input_date if valid_date_string?(input_date)

      puts 'Invalid date given. Please try again...'
    end
  end

  def add_game
    games = []
    game_name = get_input_game('name')
    multiplayer = get_input_game('multiplayer')
    last_played_at = validate_date('last played')
    publish_date = validate_date('publish')
    first_name = get_input_author('first name')
    last_name = get_input_author('last name')
    game = Game.new(game_name, multiplayer, last_played_at, publish_date)
    puts "Game #{game_name} created successfully"
    author = Author.new(first_name, last_name)
    game.add_author(author)
    games << game
    SaveData.save_games(games)
  end
end
