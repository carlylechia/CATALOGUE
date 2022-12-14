require 'date'

class Item
  attr_reader :id, :archived, :label, :genre, :author
  attr_accessor :publish_date

  def initialize(publish_date, archived: false, id: rand(1..1000))
    @id = id
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end
end
