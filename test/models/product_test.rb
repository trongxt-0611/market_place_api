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
    assert_equal [ products(:two),products(:another_tv), products(:one)], Product.recent.to_a
  end

  #test search should not find 'video game' and '100' as min price
  test "should find 'video game' and '100' as min price" do
    search_hash = {keyword: 'video game', min_price: 100}
    assert Product.search(search_hash).empty?
  end

  #test search should show cheap Tv
  test "should show cheap Tv" do
    search_hash = {keyword: 'tv', min_price: 50, max_price: 200}
    assert_equal [products(:another_tv)], Product.search(search_hash)
  end

  #test should show all products when no parameters are passed
  test "should show all products when no parameters are passed" do
    search_hash = {}
    assert_equal Product.all.to_a, Product.search(search_hash)
  end

  #test should filter products by ids
  test "should filter products by ids" do
    search_hash = {product_ids: [products(:one).id]}
    assert_equal [products(:one)], Product.search(search_hash)
  end
end
