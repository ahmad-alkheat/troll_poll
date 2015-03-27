class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :possible_answers, dependent: :destroy
  delegate :title, prefix: :true, to: :poll
  validates_presence_of :title
  validates_inclusion_of :kind, in: ApplicationHelper::QUESTION_KINDS
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attr| attr['title'].blank? }
end
