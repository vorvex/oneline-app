require 'test_helper'

class WebsiteBuilderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get website_builder_index_url
    assert_response :success
  end

  test "should get new_website" do
    get website_builder_new_website_url
    assert_response :success
  end

  test "should get new_page" do
    get website_builder_new_page_url
    assert_response :success
  end

  test "should get new_section" do
    get website_builder_new_section_url
    assert_response :success
  end

  test "should get website_settings" do
    get website_builder_website_settings_url
    assert_response :success
  end

end
