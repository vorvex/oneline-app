require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get new_user" do
    get admin_new_user_url
    assert_response :success
  end

end
