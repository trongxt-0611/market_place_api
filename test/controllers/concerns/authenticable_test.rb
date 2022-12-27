class AuthenticableTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @authentication = MockController.new
  end

#   #test should get user from authorization token
#   test "should get user from authorization token" do
#     @authentication.request.headers["Authorization"] = JsonWebToken.encode(user_id: @user.id)
#     assert_equal @user.id, @authentication.current_user.id
#   end

#   test 'should not get user from empty Authorization token' do
#     @authentication.request.headers["Authorization"] = nil
#     assert_nil @authentication.current_user
#   end
# end


# =begin
# The MockController class simply includes our Authenticable module that we will test. It contains a request attribute that contains a simple
# Struct that mimics the behavior of a Rails request by containing a
# headers attribute of the type Hash
# =end
# class MockController
#   include Authenticable
#   attr_accessor :request

#   def initialize
#     mock_request  = Struct.new(:headers)
#     self.request = mock_request.new({})
#   end
end
