require 'test_helper'

class GrievancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grievance = grievances(:one)
  end

  test "should get index" do
    get grievances_url
    assert_response :success
  end

  test "should get new" do
    get new_grievance_url
    assert_response :success
  end

  test "should create grievance" do
    assert_difference('Grievance.count') do
      post grievances_url, params: { grievance: { list_name: @grievance.list_name, office_id: @grievance.office_id } }
    end

    assert_redirected_to grievance_url(Grievance.last)
  end

  test "should show grievance" do
    get grievance_url(@grievance)
    assert_response :success
  end

  test "should get edit" do
    get edit_grievance_url(@grievance)
    assert_response :success
  end

  test "should update grievance" do
    patch grievance_url(@grievance), params: { grievance: { list_name: @grievance.list_name, office_id: @grievance.office_id } }
    assert_redirected_to grievance_url(@grievance)
  end

  test "should destroy grievance" do
    assert_difference('Grievance.count', -1) do
      delete grievance_url(@grievance)
    end

    assert_redirected_to grievances_url
  end
end
