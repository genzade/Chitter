require 'send_recover_link'

describe SendRecoverLink do
  let(:user){ double :user, email: "example@gmail.com", password_token: "12345678" }
  let(:mail_gun_client){ double :mail_gun_client }
  let(:sandbox_domain_name) { ENV["sandbox_domain_name"] }

  scenario "sends a message to mailgun when it is called" do
    params = {
      from:    "chitterhamid@mail.com",
      to:      user.email,
      subject: "reset your password",
      text:    "click here to reset your password http://chitter-hamid.herokuapp.com/reset_password?token=#{user.password_token}"
    }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end

  scenario 'it calls the SendRecoverLink service to send the link' do
    expect(SendRecoverLink).to receive(:call).with(user)
    recover_password
  end
end
