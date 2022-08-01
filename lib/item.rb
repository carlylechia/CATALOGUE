require 'securerandom'
require 'date'


class Item
    attr_accessor :date
    attr_reader :author, :label, :source, :genre

    def initialize(date, archived)
        @id = SecureRandom.uuid
        @publish_date = date
        @archived = archived
    end

    def author=(author)
        @author = author
    end

    def label=(label)
        @label = label
    end

    def source=(source)
        @source = source
    end

    def genre=(genre)
        @genre = genre
    end

    def can_be_archived?
        return true if Date.parse(published_date).year.to_i -  Date.today.year.to_i > 10
        false
    end

    def move_to_archive()
        if can_be_archived?
            @archived = true
        end
    end
end