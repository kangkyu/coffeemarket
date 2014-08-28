require 'test_helper'

class RoastingsControllerTest < ActionController::TestCase
  setup do
    @roasting = roastings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roastings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roasting" do
    assert_difference('Roasting.count') do
      post :create, roasting: { description: @roasting.description, name: @roasting.name, price: @roasting.price }
    end

    assert_redirected_to roasting_path(assigns(:roasting))
  end

  test "should show roasting" do
    get :show, id: @roasting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roasting
    assert_response :success
  end

  test "should update roasting" do
    patch :update, id: @roasting, roasting: { description: @roasting.description, name: @roasting.name, price: @roasting.price }
    assert_redirected_to roasting_path(assigns(:roasting))
  end

  test "should destroy roasting" do
    assert_difference('Roasting.count', -1) do
      delete :destroy, id: @roasting
    end

    assert_redirected_to roastings_path
  end
end
