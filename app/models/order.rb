class Order < ApplicationRecord
  belongs_to :user
  validates :total, presence: true,
                   numericality: { greater_than_or_equal_to: 0 }
  has_many :placements, dependent: :restrict_with_exception
  has_many :products, through: :placements, dependent: :restrict_with_exception
end
