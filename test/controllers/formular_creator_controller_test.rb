require 'test_helper'

class FormularCreatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formular_creator_index_url
    assert_response :success
  end

  test "should get new" do
    get formular_creator_new_url
    assert_response :success
  end

  test "should get create" do
    get formular_creator_create_url
    assert_response :success
  end

  test "should get edit" do
    get formular_creator_edit_url
    assert_response :success
  end

  test "should get update" do
    get formular_creator_update_url
    assert_response :success
  end

  test "should get destroy" do
    get formular_creator_destroy_url
    assert_response :success
  end

end
