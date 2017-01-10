require 'test_helper'

class TeammatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teammates_new_url
    assert_response :success
  end

  test "should get create" do
    get teammates_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teammates_destroy_url
    assert_response :success
  end

end
