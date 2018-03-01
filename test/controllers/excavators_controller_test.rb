require 'test_helper'

class ExcavatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excavator = excavators(:one)
  end

  test "should get index" do
    get excavators_url
    assert_response :success
  end

  test "should get new" do
    get new_excavator_url
    assert_response :success
  end

  test "should create excavator" do
    assert_difference('Excavator.count') do
      post excavators_url, params: { excavator: {  } }
    end

    assert_redirected_to excavator_url(Excavator.last)
  end

  test "should show excavator" do
    get excavator_url(@excavator)
    assert_response :success
  end

  test "should get edit" do
    get edit_excavator_url(@excavator)
    assert_response :success
  end

  test "should update excavator" do
    patch excavator_url(@excavator), params: { excavator: {  } }
    assert_redirected_to excavator_url(@excavator)
  end

  test "should destroy excavator" do
    assert_difference('Excavator.count', -1) do
      delete excavator_url(@excavator)
    end

    assert_redirected_to excavators_url
  end
end
