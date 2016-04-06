feature 'Resetting Password' do
  before do
    user_sign_up
    Capybara.reset!
  end
  let(:user){User.first}

  scenario 'can see a link to reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content('Please enter your email address')
    expect(current_path).to eq "/users/recover"
  end

  scenario 'enter my email and instructions to check inbox' do
    recover_password
    expect(page).to have_content "Thanks, Please check your inbox for the link."
  end

  scenario 'assigned a reset token to the user when they recover' do
    recover_password
    expect(user.password_token).not_to be_nil
  end
end
