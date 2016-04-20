feature 'Not logged In' do
  scenario 'can view chits in reverse chronological order' do
    user_sign_up ; first_chit ; second_chit
    click_button('Log out')
    expect(page).to have_content(
      'Deadpool~/Desktop/Chits(chimichongas@gmail.com):' + ' ' + 'chitted: ' + @second_time + ' ' +'second chit' + ' ' +
      'Deadpool~/Desktop/Chits(chimichongas@gmail.com):' + ' ' + 'chitted: ' + @first_time + ' ' + 'first chit')
  end

  scenario 'can view chits with author' do
    user_sign_up; first_chit
    expect(page).to have_content(
      'Deadpool~/Desktop/Chits(chimichongas@gmail.com):' + ' ' + 'chitted: ' + 
      @first_time + ' ' + 'first chit')
  end
end
