class UserToken < ActiveRecord::Base

  before_create :generate_token, :generate_expires_at

  belongs_to :user

  def self.make(user: nil, device: nil)
    t = UserToken.create user: user, device: device
    t
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserToken.exists? token: random_token
    end
  end

  def generate_expires_at
    self.expires_at = 100.days.from_now
  end
end
