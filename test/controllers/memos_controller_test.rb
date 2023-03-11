require "test_helper"

class MemosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memos_index_url
    assert_response :success
  end

  test "should get show" do
    get memos_show_url
    assert_response :success
  end

  test "should get edit" do
    get memos_edit_url
    assert_response :success
  end
end
