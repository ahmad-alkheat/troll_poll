require "test_helper"

class CanCreateQuestionTest < Capybara::Rails::TestCase
  def setup
    @question = create(:question)
  end

  test 'can create a question that belongs to a poll' do
    visit new_poll_question_path(@question.poll_id)
    assert_equal "/polls/#{@question.poll_id}/questions/new", current_path
    fill_in "Title", :with => "what is your name?"
    fill_in "Kind", :with => "open"
    click_button 'Save'
    assert page.has_content?("Question was successfully created.")
  end

  test ' can edit a question' do 
    visit root_path
    click_link "#{@question.poll.title}"
    click_link "Edit Question"
    fill_in "Title", :with => "Edited title"
    click_button 'Save'
    #assert_equal 'asd',page.body
    assert page.has_content?("Question was successfully updated.")
  end
end