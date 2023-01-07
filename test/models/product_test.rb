require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #test should filter products by name
  test "should filter products by name" do
    assert_equal 2, Product.filter_by_title('tv').count
  end
  #test should filter products by name and sort them
  test "should filter products by name and sort them" do
    assert_equal [products(:another_tv), products(:one)], Product.filter_by_title('tv').sort
  end

  #test should filter products by price and sort them
  test "should filter products by price and sort them" do
    assert_equal [products(:two), products(:one)], Product.above_or_equal_to_price(200).sort
  end

  #test should filter products by price lower and sort them
  test "should filter products by price lower and sort them" do
    assert_equal [products(:another_tv)], Product.below_or_equal_to_price(200).sort
  end

  #test should sort products by most recent
  test "should sort products by most recent" do
    #touch product to update them
    products(:two).touch
    assert_equal [products(:another_tv), products(:one), products(:two)], Product.recent.to_a
  end
end
