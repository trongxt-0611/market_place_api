require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @product = products(:one)
  end

  teardown do
    Rails.cache.clear
  end

  # #test show list of products
  # test "should get index" do
  #   get products_url(), as: :json
  #   assert_response :success
  # end


  # #test should show product
  # test "should show product" do
  #   get api_v1_product_url(@product), as: :json
  #   assert_response :success

  #   json_response  = JSON.parse(response.body, symbolize_names: true)
  #   assert_equal @product.title, json_response.dig(:data, :attributes, :title)
  #   assert_equal @product.user.id.to_s, json_response.dig(:data, :relationships, :user, :data, :id)
  #   assert_equal @product.user.email, json_response.dig(:included, :attributes, :email)
  # end
    # Hash#dig. It is a Ruby method allowing you to retrieve
    # elements in an nested Hash by avoiding errors if an element
    #   is not present.

  # #test should create product
  # test "should create product" do
  #   assert_difference("Product.count") do
  #     post api_v1_products_url, params: { product: { title: @product.title, price: @product.price, published: @product.published } },
  #     headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) }, as: :json
  #   end
  #   assert_response :created
  # end

  # #test should forbid create product
  # test "should forbid create product" do
  #   assert_no_difference("Product.count") do
  #     post api_v1_products_url, params: { product: { title: @product.title, price: @product.price, published: @product.published } },
  #     as: :json
  #   end
  #   assert_response :forbidden
  # end

  # #test should update product
  # test "should update product" do
  #   put api_v1_product_url(@product),
  #     params: { product: { title:@product.title, price: @product.price, published: @product.published }},
  #     headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) } ,
  #     as: :json
  #   assert_response :success
  # end

  # #test should forbid update product
  # test "should forbid update product" do
  #   put api_v1_product_url(@product),
  #     params: { product: { title:@product.title, price: @product.price, published:@product.published }},
  #     headers: { Authorization: JsonWebToken.encode(user_id: users(:two).id)},
  #     as: :json
  #   assert_response :forbidden
  # end

  # #test should destroy product
  # test "should destroy product" do
  #   assert_difference("Product.count", -1) do
  #     delete api_v1_product_url(@product),
  #       headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) },
  #       as: :json
  #     assert_response :no_content
  #   end
  # end

  # #test should forbid destroy product
  # test "should forbid destroy product" do
  #   assert_no_difference("Product.count") do
  #     delete api_v1_product_url(@product),
  #       headers: { Authorization: JsonWebToken.encode(user_id: users(:two).id) },
  #       as: :json
  #     assert_response :forbidden
  #   end
  # end

  # test 'should show products paginated' do
  #   get api_v1_products_url, as: :json
  #   assert_response :success

  #   json_response = JSON.parse(response.body, symbolize_names: true)
  #   assert_not_nil json_response.dig(:links, :first)
  #   assert_not_nil json_response.dig(:links, :last)
  #   assert_not_nil json_response.dig(:links, :prev)
  #   assert_not_nil json_response.dig(:links, :next)

  # end

end
