require 'test_helper'

class TestformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testform = testforms(:one)
  end

  test "should get index" do
    get testforms_url
    assert_response :success
  end

  test "should get new" do
    get new_testform_url
    assert_response :success
  end

  test "should create testform" do
    assert_difference('Testform.count') do
      post testforms_url, params: { testform: { date: @testform.date, name: @testform.name } }
    end

    assert_redirected_to testform_url(Testform.last)
  end

  test "should show testform" do
    get testform_url(@testform)
    assert_response :success
  end

  test "should get edit" do
    get edit_testform_url(@testform)
    assert_response :success
  end

  test "should update testform" do
    patch testform_url(@testform), params: { testform: { date: @testform.date, name: @testform.name } }
    assert_redirected_to testform_url(@testform)
  end

  test "should destroy testform" do
    assert_difference('Testform.count', -1) do
      delete testform_url(@testform)
    end

    assert_redirected_to testforms_url
  end
end
