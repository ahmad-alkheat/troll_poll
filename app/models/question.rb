class Question < ActiveRecord::Base
  belongs_to :poll
  delegate :title, prefix: :true, to: :poll
  validates_presence_of :title
  validates_inclusion_of :kind, in: ApplicationHelper::QUESTION_KINDS
end
