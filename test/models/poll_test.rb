require 'test_helper'

class PollTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
end
