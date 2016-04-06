require 'bcrypt'
require 'securerandom'

class User
  include DataMapper::Resource

  property :id, Serial
  property :full_name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, Text, required: true
  property :password_token, Text
  property :password_token_time, Time

  has n, :chits
  has n, :replies

  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :password
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save!
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token)
    if (user && user.password_token_time + (60 * 60) > Time.now)
      user
    end
  end
end
