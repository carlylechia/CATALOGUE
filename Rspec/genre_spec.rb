require_relative '../lib/genre'
require_relative '../lib/item'

RSpec.describe Genre do
    before(:all) do
      @genre = Genre.new('Comedy')
    end

    context 'when a new Genre is created' do

    it 'should be an instance of Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should have a name attribute' do
      expect(@genre).to have_attributes(name: 'Comedy')
    end

  end
end
