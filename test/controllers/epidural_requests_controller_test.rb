require 'test_helper'

class EpiduralRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epidural_request = epidural_requests(:one)
  end

  test "should get index" do
    get epidural_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_epidural_request_url
    assert_response :success
  end

  test "should create epidural_request" do
    assert_difference('EpiduralRequest.count') do
      post epidural_requests_url, params: { epidural_request: {  } }
    end

    assert_redirected_to epidural_request_url(EpiduralRequest.last)
  end

  test "should show epidural_request" do
    get epidural_request_url(@epidural_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_epidural_request_url(@epidural_request)
    assert_response :success
  end

  test "should update epidural_request" do
    patch epidural_request_url(@epidural_request), params: { epidural_request: {  } }
    assert_redirected_to epidural_request_url(@epidural_request)
  end

  test "should destroy epidural_request" do
    assert_difference('EpiduralRequest.count', -1) do
      delete epidural_request_url(@epidural_request)
    end

    assert_redirected_to epidural_requests_url
  end
end
