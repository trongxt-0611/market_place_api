class Product < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than_or_equal_to: Settings.product.min_price }, presence: true
  validates :title, :user_id,  presence: true

  scope :filter_by_title, lambda {|keyword|
    where("LOWER(title) LIKE?", "%#{keyword.downcase}%")
  }
  scope :above_or_equal_to_price, -> (price) {
    where("price >=?", price)
  }
  scope :below_or_equal_to_price, -> (price) {
    where("price <=?", price)
  }
  scope :recent, -> { order(:updated_at) }
end
