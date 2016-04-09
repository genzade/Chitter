require 'mailgun'

class SendRecoverLink
  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MAILGUN_APIKEY'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message("#{ENV['SANDBOX_DOMAIN_NAME']}.mailgun.org", {
      from:     "chitterhamid@mail.com",
      to:       user.email,
      subject:  "reset your password",
      text:     "click here to reset your password http://chitter-hamid.herokuapp.com/users/reset_password?token=#{user.password_token}"
    })
  end

  private
  attr_reader :mailer
end
