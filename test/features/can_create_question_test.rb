require "test_helper"

class CanCreateQuestionTest < Capybara::Rails::TestCase
  def setup
    @poll = create(:poll)
    @question = create(:question)
  end

  test 'can create a question that belongs to a poll' do
    p @question
    p @poll
    visit new_poll_question_path(@poll.id)
    assert_equal "/polls/#{@poll.id}/questions/new", current_path
    fill_in "Title", :with => "what is your name?"
    fill_in "Kind", :with => "open"
    click_button 'Save'
    assert page.has_content?("Question was successfully created.")
  end

  test ' can edit a question' do 
    visit 
  end
end