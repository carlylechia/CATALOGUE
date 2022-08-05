class Genre
  attr_reader :items, :name

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(music_album)
    @items << music_album
    music_album.add_genre(self)
  end
end
