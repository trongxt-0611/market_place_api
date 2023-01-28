class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :published, :price, :updated_at
  belongs_to :user
  cache_options enabled: true, cache_length: 12.hours
end
