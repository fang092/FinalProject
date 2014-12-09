require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get draftpicks" do
    get :draftpicks
    assert_response :success
  end

  test "should get picklist" do
    get :picklist
    assert_response :success
  end

end
