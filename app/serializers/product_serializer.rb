class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :published, :price
end
