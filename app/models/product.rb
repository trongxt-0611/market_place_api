class Product < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than_or_equal_to: Settings.product.min_price }, presence: true
  validates :title, :user_id,  presence: true

  scope :filter_by_title, lambda {|keyword|
    where("LOWER(title) LIKE ?", "%#{keyword.downcase}%")
  }
  scope :above_or_equal_to_price, -> (price) {
    where("price >= ?", price)
  }
  scope :below_or_equal_to_price, -> (price) {
    where("price <= ?", price)
  }
  scope :recent, -> { order(updated_at: :desc) }

  def self.search (params = {})
    #base case: search by ids or return all products
    products = params[:product_ids].present? ? Product.where(id: params[:product_ids]) : Product.all

    products = products.filter_by_title(params[:keyword]) if params[:keyword].present?
    products = products.above_or_equal_to_price(params[:min_price]) if params[:min_price].present?
    products = products.below_or_equal_to_price(params[:max_price]) if params[:max_price].present?
    products = products.recent if params.has_key?(:recent) #abc?recent => params { "recent" => nil ...}
    return products
  end
end
