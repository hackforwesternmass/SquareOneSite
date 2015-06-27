require 'test_helper'

class TimeOffsControllerTest < ActionController::TestCase
  setup do
    @time_off = time_offs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_off" do
    assert_difference('TimeOff.count') do
      post :create, time_off: { approved: @time_off.approved, comments: @time_off.comments, endDate: @time_off.endDate, provider_id: @time_off.provider_id, startDate: @time_off.startDate }
    end

    assert_redirected_to time_off_path(assigns(:time_off))
  end

  test "should show time_off" do
    get :show, id: @time_off
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_off
    assert_response :success
  end

  test "should update time_off" do
    patch :update, id: @time_off, time_off: { approved: @time_off.approved, comments: @time_off.comments, endDate: @time_off.endDate, provider_id: @time_off.provider_id, startDate: @time_off.startDate }
    assert_redirected_to time_off_path(assigns(:time_off))
  end

  test "should destroy time_off" do
    assert_difference('TimeOff.count', -1) do
      delete :destroy, id: @time_off
    end

    assert_redirected_to time_offs_path
  end
end
