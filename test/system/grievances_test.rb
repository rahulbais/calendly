require "application_system_test_case"

class GrievancesTest < ApplicationSystemTestCase
  setup do
    @grievance = grievances(:one)
  end

  test "visiting the index" do
    visit grievances_url
    assert_selector "h1", text: "Grievances"
  end

  test "creating a Grievance" do
    visit grievances_url
    click_on "New Grievance"

    fill_in "List name", with: @grievance.list_name
    fill_in "Office", with: @grievance.office_id
    click_on "Create Grievance"

    assert_text "Grievance was successfully created"
    click_on "Back"
  end

  test "updating a Grievance" do
    visit grievances_url
    click_on "Edit", match: :first

    fill_in "List name", with: @grievance.list_name
    fill_in "Office", with: @grievance.office_id
    click_on "Update Grievance"

    assert_text "Grievance was successfully updated"
    click_on "Back"
  end

  test "destroying a Grievance" do
    visit grievances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grievance was successfully destroyed"
  end
end
