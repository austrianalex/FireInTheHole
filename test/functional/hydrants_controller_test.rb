require 'test_helper'

class HydrantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hydrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hydrant" do
    assert_difference('Hydrant.count') do
      post :create, :hydrant => { }
    end

    assert_redirected_to hydrant_path(assigns(:hydrant))
  end

  test "should show hydrant" do
    get :show, :id => hydrants(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hydrants(:one).to_param
    assert_response :success
  end

  test "should update hydrant" do
    put :update, :id => hydrants(:one).to_param, :hydrant => { }
    assert_redirected_to hydrant_path(assigns(:hydrant))
  end

  test "should destroy hydrant" do
    assert_difference('Hydrant.count', -1) do
      delete :destroy, :id => hydrants(:one).to_param
    end

    assert_redirected_to hydrants_path
  end
end
