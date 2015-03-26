require "test_helper"

class CanCreateNewPollTest < Capybara::Rails::TestCase
  test "creates new poll" do
    visit root_path
    click_link "New Poll"
    fill_in "Title", :with => "TestPoll"
    click_button "Save"
    assert page.has_content?("TestPoll")
    assert page.has_content?("Edit")
  end
end
