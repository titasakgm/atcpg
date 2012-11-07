require 'test_helper'

class AtccodesControllerTest < ActionController::TestCase
  setup do
    @atccode = atccodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atccodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atccode" do
    assert_difference('Atccode.count') do
      post :create, :atccode => { :code => @atccode.code, :detail => @atccode.detail }
    end

    assert_redirected_to atccode_path(assigns(:atccode))
  end

  test "should show atccode" do
    get :show, :id => @atccode
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @atccode
    assert_response :success
  end

  test "should update atccode" do
    put :update, :id => @atccode, :atccode => { :code => @atccode.code, :detail => @atccode.detail }
    assert_redirected_to atccode_path(assigns(:atccode))
  end

  test "should destroy atccode" do
    assert_difference('Atccode.count', -1) do
      delete :destroy, :id => @atccode
    end

    assert_redirected_to atccodes_path
  end
end
