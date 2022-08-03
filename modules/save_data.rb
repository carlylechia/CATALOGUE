require 'json'
require 'pry'

module SaveData
  def self.file_init(items)
    File.write("./json_files/#{items}.json", []) unless File.exist?("./json_files/#{items}.json")
    File.write("./json_files/#{items}.json", []) if File.empty?("./json_files/#{items}.json")
  end

  def self.save_books(books)
    file_init('books')
    books_array = JSON.parse(File.read('./json_files/books.json'))

    books.map do |book|
      books_array <<
        { class_instance: 'Book', id: book.id, name: book.name,
          publisher: book.publisher, cover_state: book.cover_state,
          publish_date: book.publish_date, label_title: book.label.title, label_color: book.label.color }
    end
    File.write('./json_files/books.json', JSON.generate(books_array))
  end
end
