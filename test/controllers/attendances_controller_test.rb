require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase
  setup do
    @attendance = attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post :create, attendance: { absent: @attendance.absent, childTermDate: @attendance.childTermDate, child_id: @attendance.child_id, dateCreated: @attendance.dateCreated, dateEdited: @attendance.dateEdited, dateOfService: @attendance.dateOfService, provider_id: @attendance.provider_id, timeIn: @attendance.timeIn, timeOut: @attendance.timeOut, whoCreated: @attendance.whoCreated, whoEdited: @attendance.whoEdited }
    end

    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should show attendance" do
    get :show, id: @attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance
    assert_response :success
  end

  test "should update attendance" do
    patch :update, id: @attendance, attendance: { absent: @attendance.absent, childTermDate: @attendance.childTermDate, child_id: @attendance.child_id, dateCreated: @attendance.dateCreated, dateEdited: @attendance.dateEdited, dateOfService: @attendance.dateOfService, provider_id: @attendance.provider_id, timeIn: @attendance.timeIn, timeOut: @attendance.timeOut, whoCreated: @attendance.whoCreated, whoEdited: @attendance.whoEdited }
    assert_redirected_to attendance_path(assigns(:attendance))
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete :destroy, id: @attendance
    end

    assert_redirected_to attendances_path
  end
end
