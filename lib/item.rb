require 'securerandom'
require 'date'

class Item
  attr_accessor :date, :author, :label, :source, :genre

  def initialize(date, archived)
    @id = SecureRandom.uuid
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    return true if Date.parse(published_date).year.to_i - Date.today.year.to_i > 10

    false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
