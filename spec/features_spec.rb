feature 'The whole lot' do
  let(:player_1_name) { "Asia" }
  let(:player_2_name) { "Alastair" }
  let(:starting_hit_points) { 100 }
  let(:attack_value) { 10 }

  feature 'battle' do
    scenario 'Add player names' do
      sign_in_and_play
      expect(page).to have_content("#{player_1_name} Vs. #{player_2_name}")
    end
  end

  feature 'view hit hitpoints' do
    scenario 'See players 2 hit points' do
      sign_in_and_play
      expect(page).to have_content("#{player_2_name}: #{starting_hit_points} HP")
    end
  end

  feature 'attack player' do
    scenario 'Player 1 attacks Player 2' do
      sign_in_and_play
      click_button('attack')
      expect(page).to have_content("#{player_2_name} has been hit!")
    end
  end

  feature 'attack player' do
    scenario 'Reduce Player 2 hit points' do
      sign_in_and_play
      click_button('attack')
      click_link('return_to_battle')
      expect(page).to have_content(
        "#{player_2_name}: #{starting_hit_points - attack_value} HP")
    end
  end
end
