class Product < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than_or_equal_to: Settings.product.min_price }, presence: true
  validates :title, :user_id,  presence: true
end
