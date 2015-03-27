require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_inclusion_of(:kind).in_array(ApplicationHelper::QUESTION_KINDS)
end
