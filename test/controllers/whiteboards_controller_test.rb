require 'test_helper'

class WhiteboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whiteboard = whiteboards(:one)
  end

  test "should get index" do
    get whiteboards_url
    assert_response :success
  end

  test "should get new" do
    get new_whiteboard_url
    assert_response :success
  end

  test "should create whiteboard" do
    assert_difference('Whiteboard.count') do
      post whiteboards_url, params: { whiteboard: { patient_id: @whiteboard.patient_id, room_id: @whiteboard.room_id } }
    end

    assert_redirected_to whiteboard_url(Whiteboard.last)
  end

  test "should show whiteboard" do
    get whiteboard_url(@whiteboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_whiteboard_url(@whiteboard)
    assert_response :success
  end

  test "should update whiteboard" do
    patch whiteboard_url(@whiteboard), params: { whiteboard: { patient_id: @whiteboard.patient_id, room_id: @whiteboard.room_id } }
    assert_redirected_to whiteboard_url(@whiteboard)
  end

  test "should destroy whiteboard" do
    assert_difference('Whiteboard.count', -1) do
      delete whiteboard_url(@whiteboard)
    end

    assert_redirected_to whiteboards_url
  end
end
