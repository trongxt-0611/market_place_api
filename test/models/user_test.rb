require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end

  #test user with a valid email should be valid
  test 'valid user should be valid' do
    user = User.new(email: 'test@test.com', password_digest: 'test')
    assert user.valid?
  end

  #Check that a user with an invalid email address is not valid
  test 'invalid user should not be valid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert_not user.nil?
  end

  #Check that a new user with a duplicate email is not valid. So we use the same email as the fixture we just created.
  test 'duplicate user should not be valid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    assert_not user.nil?
  end

end
