require "test_helper"

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # #test should get JWT token
  # test "should get JWT token" do
  #   post api_v1_tokens_create_url, params: { user: { email: @user.email, password: 'g00dPass' } }, as: :json
  #   #Simply use the BCrypt::Password.create method in the fixtures of users.yml
  #   assert_response :success
  #   json_response = JSON.parse(response.body)
  #   assert_not_nil json_response['token']
  # end

  # #test should not get JWT token
  # test "should not get JWT token" do
  #   post api_v1_tokens_create_url, params: { user: { email: @user.email, password: 'badPass' } }, as: :json
  #   assert_response :unauthorized
  # end
end
