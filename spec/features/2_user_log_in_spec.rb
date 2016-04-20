feature 'User Log In' do
  feature 'Registered user' do
    before do
      user_sign_up
      click_button('Log out')
      user_log_in(username: 'Deadpool', password: 'ihatewolverine92')
      expect(page).to have_content('Logged in as Deadpool!')
    end

    scenario 'cannot sign up/log in when already signed up' do
      visit '/'
      expect(page).not_to have_button('Sign up')
      expect(page).not_to have_button('Log in')
    end
  end

  feature 'Not registered user' do
    scenario 'cannot enter the website' do
      user_log_in(username: 'Magneto', password: 'ihateXavier46')
      expect(page).not_to have_content('Logged in as Magneto! Chit away!')
      expect(page).to have_content('Incorrect username or password. 
        Check your details or please sign up.')
    end
  end
end
