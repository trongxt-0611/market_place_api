class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :published, :price
  belongs_to :user
end
