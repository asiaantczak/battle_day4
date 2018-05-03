require 'player'

describe Player do
  let(:player_name) { 'Fred' }
  subject(:player) { described_class.new(player_name) }

  context 'On set-up' do
    it 'Can add name' do
      expect(player.name).to eq player_name
    end
  end
end
