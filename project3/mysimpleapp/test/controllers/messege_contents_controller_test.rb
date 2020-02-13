require 'test_helper'

class MessegeContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messege_contents_index_url
    assert_response :success
  end

  test "should get show" do
    get messege_contents_show_url
    assert_response :success
  end

  test "should get new" do
    get messege_contents_new_url
    assert_response :success
  end

  test "should get edit" do
    get messege_contents_edit_url
    assert_response :success
  end

  test "should get delete" do
    get messege_contents_delete_url
    assert_response :success
  end

end
