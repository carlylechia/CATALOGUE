require 'json'
require_relative './app'

module ListServices
  def list_service(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_music_albums
    when 3
      list_all_games
    when 4
      list_all_labels
    when 5
      list_all_genres
    when 6
      list_all_authors
    end
  end

  def read_file(items)
    File.write("./json_files/#{items}.json", []) unless File.exist?("./json_files/#{items}.json")
    File.write("./json_files/#{items}.json", []) if File.empty?("./json_files/#{items}.json")
    JSON.parse(File.read("./json_files/#{items}.json"))
  end

  def list_all_books
    books = read_file('books')
    if books.empty?
      puts "There is no book in the catalogue right now, please add some books\n"
    else
      puts "Loading list of books in the catalogue...\n"
      sleep 0.75
      books.each_with_index do |book, index|
        puts "#{index + 1}) Book Name: #{book['name']} || Book publisher: #{book['publisher']} ||
        \r   Cover state: #{book['cover_state']} || Label title: #{book['label_title']} ||
        \r   Label color: #{book['label_color']} || Released on: #{book['publish_date']} ||\n\n"
      end
    end
  end

  def list_all_labels
    books = read_file('books')
    if books.empty?
      puts "There is no book-label in the catalogue, please add some\n"
    else
      books.each_with_index do |book, index|
        puts "\r#{index + 1}) Label title: #{book['label_title']} || Label color: #{book['label_color']} ||"
      end
    end
  end
end
