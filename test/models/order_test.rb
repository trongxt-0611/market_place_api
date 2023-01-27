require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
    @product1 = products(:one)
    @product2 = products(:two)
  end
  # test "the truth" do
  #   assert true
  # end
  #test the order should have a positive total


  test  'should set total' do
    order = Order.new user_id: @order.user_id
    order.products << products(:one)
    order.products << products(:two)
    order.save
    assert_equal order.total, (@product1.price + @product2.price)
  end

  test 'builds 2 placements for the order' do
    @order.build_placements_with_product_ids_and_quantities [
      {product_id: @product1.id, quantity: 2},
      {product_id: @product2.id, quantity: 3},
    ]
    assert_difference('Placement.count', 2) do
      @order.save
    end
  end

  test 'an order should command not too much product than available' do
    @order.placements << Placements.new(product_id: @product1.id, quantity: (@product1.quantity + 1))
    assert_not @order.valid?
  end
end
