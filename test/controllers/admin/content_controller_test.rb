require 'test_helper'

class Admin::ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_content_index_url
    assert_response :success
  end

end
