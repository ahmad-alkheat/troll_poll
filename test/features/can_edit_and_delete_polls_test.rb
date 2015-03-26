require "test_helper"

class CanEditAndDeletePollsTest < Capybara::Rails::TestCase
  
  def setup
    @poll = create(:poll)
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
