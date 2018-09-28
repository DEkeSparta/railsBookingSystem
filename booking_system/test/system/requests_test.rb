require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "creating a Request" do
    visit requests_url
    click_on "New Request"

    fill_in "Category", with: @request.category
    fill_in "Created At", with: @request.created_at
    fill_in "Date", with: @request.date
    fill_in "Description", with: @request.description
    fill_in "End", with: @request.end
    fill_in "Pending", with: @request.pending
    fill_in "Room", with: @request.room_id
    fill_in "Start", with: @request.start
    fill_in "Updated At", with: @request.updated_at
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "updating a Request" do
    visit requests_url
    click_on "Edit", match: :first

    fill_in "Category", with: @request.category
    fill_in "Created At", with: @request.created_at
    fill_in "Date", with: @request.date
    fill_in "Description", with: @request.description
    fill_in "End", with: @request.end
    fill_in "Pending", with: @request.pending
    fill_in "Room", with: @request.room_id
    fill_in "Start", with: @request.start
    fill_in "Updated At", with: @request.updated_at
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "destroying a Request" do
    visit requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request was successfully destroyed"
  end
end
