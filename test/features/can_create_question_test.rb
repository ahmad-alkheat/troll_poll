require "test_helper"

class CanCreateQuestionTest < Capybara::Rails::TestCase
  def setup
    @poll = create(:poll)
    @question = create(:question)
  end

  test 'can create a question that belongs to a poll' do
    visit new_question_path(@poll,@question)
  end
end
