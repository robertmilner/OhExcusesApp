require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

  test "should get tag" do
    get :tag
    assert_response :success
  end

  test "should get favorite" do
    get :favorite
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

end
