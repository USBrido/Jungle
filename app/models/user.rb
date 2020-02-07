class User < ActiveRecord::Base

  def self.authenticte_with_credentials(email, password)
    email
    user = User.find_by_email(email)
    user ? user.authenticate(password)? user : nil : nil

  end 

    has_secure_password
  #validates  user form
  validates :name, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 3}, confirmation: true
  validates :password_confirmation, presence: true, length: {minimum: 3}
  before_save :clear_email

  def clear_email
    self.email.downcase!
    self.email.strip!
  end
end
