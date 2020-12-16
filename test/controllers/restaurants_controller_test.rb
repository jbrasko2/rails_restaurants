require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get restaurants_show_url
    assert_response :success
  end

  test "should get index" do
    get restaurants_index_url
    assert_response :success
  end
end
