require_relative '../lib/book'

describe Book do
  before :each do
    @book = Book.new('name', 'publisher', 'cover_state', '2011-02-10')
  end
  context 'When creating @book, an instance of class Book ' do
    it 'takes four parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end
  end
  context 'When retrieving the name of a book' do
    it 'returns the correct name' do
      expected_value = 'name'
      expect(@book.name).to eq(expected_value)
    end
  end
  context 'When archiving a book' do
    it 'archives the book' do
      can_be_archived = @book.can_be_archived?
      expect(can_be_archived).to be_truthy
    end
  end
  context 'When archiving a book published not up to ten years ago' do
    it 'is not archivable' do
      @book.publish_date = Date.strptime('2022-02-10', '%Y-%m-%d')
      can_be_archived = @book.can_be_archived?
      expect(can_be_archived).to be_falsey
    end
  end
end
