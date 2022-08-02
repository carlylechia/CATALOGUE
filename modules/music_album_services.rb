require_relative '../lib/music_album'
require_relative '../lib/genre'
require_relative 'save_data'

module MusicAlbumServices
  include SaveData
  def music_album_data(input)
    output = ''
    while output.empty?
      print "Enter the #{input} of the music album: "
      output = gets.chomp
      puts "#{input} cannot be blank, please enter a valid #{input}\n".colorize(:red) if output.empty?
    end
    output
  end

  def valid_date_string?(input)
    return false unless input.is_a?(String)
    return false unless input =~ /\A\d+-\d+-\d+\z/

    parts = input.split('-').map(&:to_i)
    Date.valid_date?(*parts)
  end

  def valid_album_date
    loop do
      print 'Enter book publish date (yyyy-mm-dd): '
      input_date = gets.chomp
      return input_date if valid_date_string?(input_date)

      puts "Invalid date format given. Please try again...\n".colorize(:red)
    end
    input_date
  end

  def spotify_listing
    correct_input = false
    until correct_input
      print 'Is the album on Spotify [Y/N]:'
      on_spotify_input = gets.chomp.downcase
      correct_input = %w[y n].include?(on_spotify_input)
      puts "Incorrect option! Please enter Y or N only\n".colorize(:red)
    end
    _on_spotify = on_spotify_input == 'y'
  end

  def genre_data(input)
    output = ''
    while output.empty?
      print "Enter #{input} of the music album: "
      output = gets.chomp
      puts "#{input}  cannot be blank, please enter a valid #{input}\n".colorize(:red) if output.empty?
    end
    output
  end

  def add_music_album
    music_albums = []
    album_name = music_album_data('Name')
    artist_name = music_album_data('Artist Name')
    publish_date = valid_album_date
    genre_name = genre_data('Genre')
    on_spotify = spotify_listing

    music_album = MusicAlbum.new(album_name, artist_name, publish_date, on_spotify)
    puts "The music album #{album_name} was created successfully\n".colorize(:green)
    sleep 0.5
    genre = Genre.new(genre_name)
    music_album.add_genre(genre)
    music_albums << music_album
    SaveData.save_music_albums(music_albums)
  end
end