require 'test_helper'

class ChildrenControllerTest < ActionController::TestCase
  setup do
    @child = children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child" do
    assert_difference('Child.count') do
      post :create, child: { dob: @child.dob, fName: @child.fName, fundSrc: @child.fundSrc, lName: @child.lName, middle: @child.middle, provider_id: @child.provider_id, startDate: @child.startDate, trans: @child.trans }
    end

    assert_redirected_to child_path(assigns(:child))
  end

  test "should show child" do
    get :show, id: @child
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child
    assert_response :success
  end

  test "should update child" do
    patch :update, id: @child, child: { dob: @child.dob, fName: @child.fName, fundSrc: @child.fundSrc, lName: @child.lName, middle: @child.middle, provider_id: @child.provider_id, startDate: @child.startDate, trans: @child.trans }
    assert_redirected_to child_path(assigns(:child))
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete :destroy, id: @child
    end

    assert_redirected_to children_path
  end
end
