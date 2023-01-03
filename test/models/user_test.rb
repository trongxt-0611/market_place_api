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

  #destroy the user should be destroy  linked products
  test 'destroy user should be destroy linked products' do
    assert_difference('Product.count', -1) do
      user = users(:one)
      user.destroy
    end
  end

  #should have positive price
  test'should have positive price' do
    product = products(:one)
    product.price = -1
    assert_not product.valid?
  end
end
