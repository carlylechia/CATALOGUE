require_relative '../lib/game'
describe Game do
  before :each do
    @game = Game.new('football', 'Ali', '2018-01-01', '2010-12-14')
  end
  context 'When creating @game, an instance of class Game ' do
    it 'takes four parameters and return a Game object' do
      expect(@game).to be_instance_of Game
    end
  end
  context 'When retrieving the name of a game' do
    it 'returns the correct name' do
      expected_value = 'football'
      expect(@game.name).to eq(expected_value)
    end
  end
  context 'When archiving a game' do
    it 'archives the game' do
      can_be_archived = @game.can_be_archived?
      expect(can_be_archived).to be_truthy
    end
  end
  context 'When archiving a game not played for more than 2 years' do
    it 'is not archivable' do
      @game.last_played_at = Date.strptime('2022-02-10', '%Y-%m-%d')
      can_be_archived = @game.can_be_archived?
      expect(can_be_archived).to be_falsey
    end
  end
end
