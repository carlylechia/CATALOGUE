require_relative '../lib/label'
require_relative '../lib/item'

describe Label do
  before :each do
    @label = Label.new 'Title', 'Color'
  end

  describe '#new' do
    it 'takes two parameters and returns a Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#title' do
    it 'detects the title of label' do
      expect(@label.title).to eq 'Title'
    end
  end

  describe '#color' do
    it 'detects the color of label' do
      expect(@label.color).to eq 'Color'
    end
  end
  it 'should detect the label items' do
    book = Book.new 'name', 'Publisher', 'Cover state', '2011-03-28'
    @label.add_items(book)
    expect(@label.items.include?(book)).to eq true
    expect(book.label).to eq @label
  end
end
