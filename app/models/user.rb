class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: Settings.email_regex
  validates :password_digest, presence: true
  has_secure_password 
end
