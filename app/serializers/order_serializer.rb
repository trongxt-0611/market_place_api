class OrderSerializer
  include FastJsonapi::ObjectSerializer
  has_many :products
  belongs_to :user
  cache_options enabled: true, cache_length: 12.hours
end
