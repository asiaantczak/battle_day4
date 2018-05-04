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

  feature 'View hit hitpoints' do
    scenario 'See players 2 hit points' do
      sign_in_and_play
      expect(page).to have_content("#{player_2_name}: #{starting_hit_points} HP")
    end
  end

  feature 'Attack player' do
    scenario 'Player 1 attacks Player 2' do
      sign_in_and_play
      click_button('Attack Player 2')
      expect(page).to have_content("#{player_2_name} has been hit!")
    end

    scenario 'Player 2 attacks Player 1' do
      sign_in_and_play
      click_button('Attack Player 1')
      expect(page).to have_content("#{player_1_name} has been hit!")
    end
  end

  feature 'Hit points' do
    scenario 'Reduce Player 2 hit points and the reduce Player 1 hit points' do
      sign_in_and_play
      click_button('Attack Player 2')
      click_link('return_to_battle')
      expect(page).to have_content(
        "#{player_2_name}: #{starting_hit_points - attack_value} HP")
      click_button('Attack Player 1')
      click_link('return_to_battle')
      expect(page).to have_content(
        "#{player_1_name}: #{starting_hit_points - attack_value} HP")
    end
  end
end
