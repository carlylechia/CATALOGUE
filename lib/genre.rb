class Genre
    attr_accessor :name

    def initialize(name)
        @name = name
        @id = id: rand(1..1000)
        @items = []
    end

    def add_item(item)
        @items << item
        item.add_genre(self)
    end

end