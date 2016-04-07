feature 'Resetting Password' do
  before do
    user_sign_up
    Capybara.reset!
  end
  let(:user){ User.first }

  scenario 'can see a link to reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content('Please enter your email address')
    expect(current_path).to eq '/users/recover'
  end

  scenario 'enter my email and instructions to check inbox' do
    recover_password
    expect(page).to have_content 'Thanks, Please check your inbox for the link.'
  end

  scenario 'assigned a reset token to the user when they recover' do
    recover_password
    expect(user.password_token).not_to be_nil
  end

  scenario 'it will not allow you to use the token after an hour' do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content 'Your token is invalid'
    end
  end

  scenario 'it asks for your new password when your token is valid' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content('Please enter your new password')
  end

  scenario 'it lets you enter a new password with a valid token' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'new_password'
    fill_in :password_confirmation, with: 'new_password'
    click_button 'Submit'
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
  end

  scenario 'it lets you sign in after password reset' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'newpassword'
    fill_in :password_confirmation, with: 'newpassword'
    click_button 'Submit'
    user_log_in(username: 'Deadpool', password: 'newpassword')
    expect(page).to have_content 'Logged in as Deadpool'
  end

  scenario 'it lets you know if your passwords do not match' do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    fill_in :password, with: 'newpassword'
    fill_in :password_confirmation, with: 'wrongpassword'
    click_button 'Submit'
    expect(page).to have_content('Password does not match the confirmation')
  end
end
