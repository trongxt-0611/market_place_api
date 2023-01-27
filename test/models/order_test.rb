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
    @order.placements =[
      Placement.new(product_id: @product1.id, quantity: 2),
      Placement.new(product_id: @product2.id, quantity: 2),
    ]
    @order.set_total!
    expected_total = @product1.price * 2 + @product2.price * 2
    assert_equal @order.total, expected_total
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
    @order.placements << Placement.new(product_id: @product1.id,
                                       quantity: (@product1.quantity + 1))
    assert_not @order.valid?
  end
end
