require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  # # test should show user
  # test "should show user" do
  #   get api_v1_user_url(@user), as: :json
  #   assert_response :success
  #   #test to ensure response contains the correct email
  #   json_response = JSON.parse(self.response.body, symbolize_names: true)
  #   assert_equal @user.email, json_response.dig(:data, :attributes, :email)
  #   assert_equal @user.products.first.id.to_s, json_response.dig(:data, :relationships, :products, :data, 0, :id)
  #   assert_equal @user.products.first.title, json_response.dig(:included, 0, :attributes, :title)
  # end

  # # test should create user
  # test "should create user" do
  #   assert_difference("User.count") do
  #     post api_v1_users_url, params: { user: { email: 'test@example.com', password:'123123' } }, as: :json
  #   end
  #   assert_response :created
  # end

  # # test not create user with taken email
  # test "should not create user with taken email" do
  #   assert_no_difference("User.count") do
  #     post api_v1_users_url, params: { user: { email: @user.email, password:'123123' } }, as: :json
  #   end
  #   assert_response :unprocessable_entity
  # end

  # #test should update user
  # test "should update user" do
  #   put api_v1_user_url(@user), params: { user: { email: @user.email, password:'123123' } }, as: :json
  #   assert_response :success
  # end

  # # test not update user when invalid params are sent
  # test "should not update user when invalid params are sent" do
  #   put api_v1_user_url(@user), params: { user: { email: 'bad_email', password:'123123' } }, as: :json
  #   assert_response :unprocessable_entity
  # end

  # # test should destroy user
  # test "should destroy user" do
  #   assert_difference("User.count", -1) do
  #     delete api_v1_user_url(@user), as: :json
  #   end
  #   assert_response :no_content
  # end

  # test "should update user" do
  #   put api_v1_user_url(@user), params: { user: { email:@user.email } },
  #                               headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
  #                               as: :json
  #   assert_response :success
  # end

  # test "should forbit update user" do
  #   put api_v1_user_url(@user), params: { user: { email: @user.email } },
  #                               as: :json_response
  #   asse

  # test "should destory user" do
  #   assert_difference("User.count", -1) do
  #     delete api_v1_user_url(@user), headers: { Authorization: JsonWebToken.encode(user_id: @user.id)},
  #                                    as: :json
  #   end
  #   assert_response :no_content
  # end

  # test "should forbidden destroy user" do
  #   assert_no_difference("User.count") do
  #     delete api_v1_user_url(@user), as: :json
  #   end
  #   assert_response :forbidden
  # end
end
