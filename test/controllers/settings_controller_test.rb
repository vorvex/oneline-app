require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get company" do
    get settings_company_url
    assert_response :success
  end

end
