class User < ActiveRecord::Base

  # class UserValidator < ActiveModel::Validator
  #   def validate(record)
  #     if record.email.nil? or record.phone.nil? or record.email.empty? or record.phone.empty?
  #       record.errors[:email] << '是必填的'
  #     end
  #   end
  # end

  # attr_accessor :password, :password_confirmation

  has_secure_password

  validates :nickname, length: {minimum: 2}, uniqueness: true
  validates :email, presence: true, uniqueness: true  # TODO: either email or phone number is valid
  # validates_with UserValidator
  # validates_presence_of :password, :on => :create

  has_many :user_tokens

end
