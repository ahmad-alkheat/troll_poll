require "test_helper"

class CanCreateNewPollTest < Capybara::Rails::TestCase

  def login(user)
    page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end

  let (:user) { create(:user) }

  before do
    login user
  end

  test "creates new poll" do
    visit root_path
    click_link "New Poll"
    fill_in "Title", :with => "TestPoll"
    click_button "Save"
    assert page.has_content?("TestPoll")
    assert page.has_content?("Edit")
  end

  test "creates unvalid new poll" do
    visit root_path
    click_link "New Poll"
    fill_in "Title", :with => ""
    click_button "Save"
    assert page.has_content?("Title can't be blank")
  end
end
