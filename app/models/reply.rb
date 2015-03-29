class Reply < ActiveRecord::Base
  belongs_to :poll
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: proc { |a| a["title"] == nil && a["possible_answer_id"] == nil}

end
