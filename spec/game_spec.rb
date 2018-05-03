require 'game'

describe Game do
  let(:player) { double :player, hit_points: the_hit_points }
  let(:the_hit_points) { 100 }
  let(:normal_attack) { 'normal' }
  let(:normal_attack_value) { 10 }

  context 'Can do a normal attack' do
    it 'Reduces player hit points by 10' do
      allow(player).to receive(:reduce_hit_points).and_return(the_hit_points - normal_attack_value)
      expect(subject.attack(normal_attack, player)).to eq the_hit_points - normal_attack_value
    end
  end
end
