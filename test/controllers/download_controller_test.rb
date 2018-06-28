require 'test_helper'

class DownloadControllerTest < ActionDispatch::IntegrationTest
  test "should get datenschuty" do
    get download_datenschuty_url
    assert_response :success
  end

end
