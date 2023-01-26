class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: {with: Settings.user.email_regex}
  validates :password_digest, presence: true
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
