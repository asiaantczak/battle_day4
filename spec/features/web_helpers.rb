def sign_in_and_play
  visit('/')
  fill_in('player_1_name', with: 'Asia')
  fill_in('player_2_name', with: 'Alastair')
  click_button 'Submit'
end
