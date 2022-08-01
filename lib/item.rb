class Item
    attr_accessor: :genre, :author, :label, :date
    def initialize(id, genre, author, label, date, archived)
        @id = id
        @genre = genre
        @author = author
        @label = label
        @publish_date = date
        @archived = archived
    end
end