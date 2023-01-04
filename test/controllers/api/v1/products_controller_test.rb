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

  #test show list of products
  test "should get index" do
    get products_url(), as: :json
    assert_response :success
  end


  #test should show product
  test "should show product" do
    get api_v1_product_url(@product), as: :json
    assert_response :success

    json_response  = JSON.parse(response.body)
    assert_equal @product.title, json_response["title"]

  end
end
