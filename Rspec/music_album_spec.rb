require_relative '../lib/music_album'

RSpec.describe MusicAlbum do
  before(:all) do
    @music = MusicAlbum.new('Sorry You feel that way', 'Bill Burr', '2011-02-19', 'Y')
  end

  context 'When creating a new Music do'

  it 'takes four parameters and returns a MusicAlbum object' do
    expect(@music).to be_instance_of MusicAlbum
  end

  it 'returns the correct name' do
    expected_value = 'Sorry You feel that way'
    expect(@music.album_name).to eq(expected_value)
  end
end
