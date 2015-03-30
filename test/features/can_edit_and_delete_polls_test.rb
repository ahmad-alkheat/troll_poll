require "test_helper"
=begin

class CanEditAndDeletePollsTest < Capybara::Rails::TestCase

  def login(user)
    page.driver.post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end

  let (:user) { create(:user) }

  def setup 
    @poll = user.polls.create(title: "test_poll")
  end

  before do
    login user
  end
  

  test 'destroy poll' do 
    visit root_path
    assert page.has_content?("test_poll")
    click_link "Destroy"
    assert page.has_content?("Poll was successfully destroyed.")
  end

  test 'edit poll' do 
    visit root_path
    assert page.has_content?("test_poll")
    click_link "Edit"
    fill_in 'Title', :with => "test_poll_edited"
    click_button 'Save'
    assert page.has_content?("Poll was successfully updated.")
    assert page.has_content?("test_poll_edited")
  end
end
=end