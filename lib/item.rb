require 'securerandom'


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
end