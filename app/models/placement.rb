class Placement < ApplicationRecord
  #inverse_of :placements: This gives a little boost when
  #referencing the parent object.
  belongs_to :product, inverse_of: :placements
  belongs_to :order
end
