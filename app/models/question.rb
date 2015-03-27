class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :possible_answers
  delegate :title, prefix: :true, to: :poll
  validates_presence_of :title
  validates_inclusion_of :kind, in: ApplicationHelper::QUESTION_KINDS
end
