require "test_helper"

class UserSignUpTest < Capybara::Rails::TestCase
  test "can sign up" do
    visit new_user_registration_path
    fill_in "Email", with: "test@test.test"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
    assert page.has_content?("Welcome! You have signed up successfully.")
    assert_equal "http://www.example.com/", current_url
  end
end
