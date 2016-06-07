require 'test_helper'

class ExtrasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get howTo" do
    get :howTo
    assert_response :success
  end

end
