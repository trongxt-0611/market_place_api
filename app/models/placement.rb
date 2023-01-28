class Placement < ApplicationRecord
  after_create :decrement_product_quantity!
  #inverse_of :placements: This gives a little boost when
  #referencing the parent object.
  belongs_to :product, inverse_of: :placements
  belongs_to :order

  def decrement_product_quantity!
    product.decrement!(:quantity, self.quantity)
  end
end
