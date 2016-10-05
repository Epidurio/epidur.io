require 'test_helper'

class RoomAllocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_allocation = room_allocations(:one)
  end

  test "should get index" do
    get room_allocations_url
    assert_response :success
  end

  test "should get new" do
    get new_room_allocation_url
    assert_response :success
  end

  test "should create room_allocation" do
    assert_difference('RoomAllocation.count') do
      post room_allocations_url, params: { room_allocation: { patient_id: @room_allocation.patient_id, room_id: @room_allocation.room_id } }
    end

    assert_redirected_to room_allocation_url(RoomAllocation.last)
  end

  test "should show room_allocation" do
    get room_allocation_url(@room_allocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_allocation_url(@room_allocation)
    assert_response :success
  end

  test "should update room_allocation" do
    patch room_allocation_url(@room_allocation), params: { room_allocation: { patient_id: @room_allocation.patient_id, room_id: @room_allocation.room_id } }
    assert_redirected_to room_allocation_url(@room_allocation)
  end

  test "should destroy room_allocation" do
    assert_difference('RoomAllocation.count', -1) do
      delete room_allocation_url(@room_allocation)
    end

    assert_redirected_to room_allocations_url
  end
end
