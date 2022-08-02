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
    JSON.parse(File.read('./json_files/books.json'))
  end

  def list_all_books
    books = read_file('books')
    if books.empty?
      puts "There are no books in the catalog, please add some books\n"
    else
      puts "Loading list of books in the catalog...\n"
      sleep 0.75
      books.each_with_index do |book, index|
        puts "#{index + 1}) Book Name: #{book['name']} || Book publisher: #{book['publisher']} ||
        \r   Cover state: #{book['cover_state']} || Label title: #{book['label_title']} ||
        \r   Label color: #{book['label_color']} || Released on: #{book['publish_date']} ||\n\n"
      end
    end
  end

  def list_all_music_albums
    music_albums = read_file('music_albums')
    if music_albums.empty?
      puts "There are no music albums in the catalog, please add some music albums\n"
    else
      puts "Loading list of music albums in the catalog...\n"
      sleep 0.75
      music_albums.each_with_index do |music_album, index|
        puts "#{index + 1}) Album Name: #{music_album['album_name']}  Album Genre: #{music_album['genre']}
        Artist Name: #{music_album['artist_name']}  Released on: #{music_album['publish_date']}\n\n"
      end
    end
  end

  def list_all_genres
    music_albums = read_file('music_albums')
    if music_albums.empty?
      puts "There are no genres in the catalog, please add some music albums\n"
    else
      music_albums.each_with_index do |music_album, index|
        puts "#{index + 1}) Genre Name: #{music_album['genre']}"
      end
    end
  end

  def list_all_labels
    books = read_file('books')
    if books.empty?
      puts "There are no label in the catalog, please add some books\n"
    else
      books.each_with_index do |book, index|
        puts "\r#{index + 1}) Label title: #{book['label_title']} || Label color: #{book['label_color']} ||"
      end
    end
  end

  def list_all_games
    games = read_file('games')
    if games.empty?
      puts "There are no games in the catalog, please add some games\n"
    else
      puts "Loading list of games in the catalog...\n"
      sleep 0.75
      games.each_with_index do |game, index|
        puts "#{index + 1}) Game Name: #{game['name']} || Game multiplayer: #{game['multiplayer']} ||
        \r   Last palayed at: #{game['last_played_at']} || Author first name: #{game['first_name']} ||
        \r   Author last name: #{game['last_name']} || Released on: #{game['publish_date']} ||\n\n"
      end
    end
  end

  def list_all_authors
    games = read_file('games')
    if games.empty?
      puts "There are no author in the catalog, please add some authors\n"
    else
      games.each_with_index do |game, index|
        puts "\r#{index + 1}) Author first name: #{game['first_name']} || Author last name: #{game['last_name']} ||"
      end
    end
  end
end