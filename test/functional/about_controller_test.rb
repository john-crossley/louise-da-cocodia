require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get objectives" do
    get :objectives
    assert_response :success
  end

  test "should get volunteering" do
    get :volunteering
    assert_response :success
  end

end
