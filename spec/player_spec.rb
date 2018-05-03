require 'player'

describe Player do
  let(:player_name) { 'Fred' }
  let(:starting_hit_points) { 100 }
  subject(:player) { described_class.new(player_name) }

  context 'On set-up' do
    it 'Has player name' do
      expect(player.name).to eq player_name
    end
    it 'Has player hit points' do
      expect(player.hit_points).to eq starting_hit_points
    end
  end
end
