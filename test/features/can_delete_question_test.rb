require "test_helper"

class CanDeleteQuestionTest < Capybara::Rails::TestCase
  
  def setup
    @question = create(:question)
  end

  test 'delete question' do 
    visit root_path
    click_link "#{@question.poll.title}"
    click_link 'Delete Question'
    assert page.has_content?("Question was successfully destroyed.")
    assert_equal poll_path(@question.poll), current_path
  end
end
