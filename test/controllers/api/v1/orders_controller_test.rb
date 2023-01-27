require "test_helper"

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @order = orders(:one)
    @order_params = {
      order:{
        product_ids_and_quantities: [
          {product_id: products(:one).id, quantity: 2},
          {product_id: products(:two).id, quantity: 3}
        ]
      }
    }
  end

  # #test should forbid orders  for unlogged users
  # test "should forbid orders for logged users" do
  #   get api_v1_orders_url, as: :json
  #   assert_response :forbidden
  # end

  # #test should show orders
  # test "should show orders" do
  #   get api_v1_orders_url,
  #     headers: {Authorization: JsonWebToken.encode(user_id: @order.user_id)},
  #     as: :json
  #   assert_response :success

  #   json_response = JSON.parse(response.body)
  #   assert_equal @order.user.orders.count, json_response["data"].count
  # end

  # test "should show order" do
  #   get api_v1_orders_url(@order),
  #     headers: {Authorization: JsonWebToken.encode(user_id: @order.user_id)},
  #     as: :json
  #     assert_response :success
  #     json_response = JSON.parse(response.body)
  #     included_product_attr = json_response['included'][0]['attributes']
  #     assert_equal included_product_attr['title'], @order.products.first.title
  # end

  # test "should forbid create order for unlogged users" do
  #   assert_difference('Order.count', 1) do
  #     post api_v1_orders_url, params: @order_params, as: :json
  #   end
  #   assert_response :forbidden
  # end

  # test "should create order with two products" do
  #   assert_difference('Order.count',1) do
  #     post api_v1_orders_url,
  #       params: @order_params,
  #       headers: {Authorization: JsonWebToken.encode(user_id: @order.user_id)},
  #       as: :json
  #   end
  #   assert_response :created
  # end

  # test 'should create order with 2 products and placements' do
  #   assert_difference('Order.count',1) do
  #     assert_difference('Placements.count', 2) do
  #       post api_v1_orders_url,
  #         params: @order_params,
  #         headers:  {Authorization: JsonWebToken.encode(user_id: @order.user_id)},
  #         as: :json
  #     end
  #   end
  #   assert_response :created
  # end
end
