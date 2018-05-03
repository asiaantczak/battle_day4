require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1, hit_points: the_hit_points }
  let(:player_2) { double :player_2, hit_points: the_hit_points }
  let(:the_hit_points) { 100 }
  let(:normal_attack) { 'normal' }
  let(:normal_attack_value) { 10 }

  context '#initialize' do
    it "initialises game with two players" do
      expect(subject.players.length).to eq 2
    end
  end

  context 'Can do a normal attack' do
    it 'Reduces player hit points by 10' do
      allow(player_2).to receive(:reduce_hit_points).and_return(the_hit_points - normal_attack_value)
      expect(subject.attack(normal_attack, player_2)).to eq the_hit_points - normal_attack_value
    end
  end
end
