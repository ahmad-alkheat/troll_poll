require "test_helper"

class QuestionWithPossibleAnswersTest < Capybara::Rails::TestCase
  
    def setup
      @poll = create(:poll)
    end

    test 'create a multiple choice question' do 
      visit root_path
      click_link "#{@poll.title}"
      click_link 'Add new question to this poll'
      fill_in "Title", :with => "What's your favorite language?"
      select "choices", :from => 'Kind'
      fill_in "question_possible_answers_attributes_0_title", with: "Ruby"
      fill_in "question_possible_answers_attributes_1_title", with: "Ruby"
      click_button 'Save'
      assert page.has_content?("Question was successfully created.")
      #assert_equal "df", page.body
    end
end
