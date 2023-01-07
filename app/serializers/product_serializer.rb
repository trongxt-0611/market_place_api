class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :published, :price, :updated_at
  belongs_to :user
end
