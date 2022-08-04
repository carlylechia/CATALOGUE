require 'json'
require 'pry'

module SaveData
  def self.file_init(items)
    File.write("./json_files/#{items}.json", []) unless File.exist?("./json_files/#{items}.json")
    File.write("./json_files/#{items}.json", []) if File.empty?("./json_files/#{items}.json")
  end

  def self.save_games(games)
    file_init('games')
    games_array = JSON.parse(File.read('./json_files/games.json'))
    games.map do |game|
      games_array <<
        { class_instance: 'Game', id: game.id, name: game.name, multiplayer: game.multiplayer,
          last_played_at: game.last_played_at, publish_date: game.publish_date,
          first_name: game.author.first_name, last_name: game.author.last_name }
    end
    File.write('./json_files/games.json', JSON.generate(games_array))
  end
end
