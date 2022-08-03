require "./item"

class MusicAlbum < Item
    def initialize(on_sportify)
        @on_sportify = on_sportify
        super
    end

    def can_be_archived?
        return true if super && @on_sportify

        false
    end
end

