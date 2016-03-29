feature 'Not logged in' do
  scenario 'can view chits in reverse chronological order' do
    user_sign_up ; first_chit ; second_chit
    click_button('Log out')
    expect(page).to have_content(
      'second chit' + ' ' + @second_time + ' ' + 'Deadpool' + ' ' +
      'first chit' + ' ' + @first_time + ' ' + 'Deadpool')
  end

  scenario 'can view chits with author' do
    user_sign_up; first_chit
    expect(page).to have_content('first chit' + ' ' + @first_time + ' ' +
    'Deadpool')
  end
end
