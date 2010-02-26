require 'test_helper'

class AdTest < ActiveSupport::TestCase
  test "search should find results in title" do
    results = Ad.search("empregos")
    assert_equal 1, results.size 
    results = Ad.search("ofereço")
    assert_equal 2, results.size 
  end
  test "search should find results in body" do
    results = Ad.search("rails")
    assert_equal 1, results.size 
    results = Ad.search("anúncio")
    assert_equal 2, results.size
  end
  test "search should be case insensitive" do
    results = Ad.search("NOTEBOOK")
    assert_equal 2, results.size
  end
  test "search should only find what is there" do
    results = Ad.search("misterouswordthatisnotthere")
    assert_equal 0,  results.size
  end
  test "should not search for the email" do
    results = Ad.search("joao")
    assert_equal 0, results.size
  end
  test "should search words separately (both should be present)" do
    results = Ad.search("ofereço anúncio")
    assert_equal(2, results.count)
  end
  
  test "should return a secret code" do
    assert ads(:one).secret_code
  end
  
end
