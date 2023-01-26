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

end
