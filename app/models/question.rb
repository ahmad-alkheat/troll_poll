class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :possible_answers, dependent: :destroy
  delegate :title, prefix: :true, to: :poll
  validates_presence_of :title
  validates_inclusion_of :kind, in: ApplicationHelper::QUESTION_KINDS
  validate :require_two_possible_answers
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attr| attr['title'].blank? }, allow_destroy: true

  def require_two_possible_answers
    errors.add(:base, "You need at least two choices") if self.possible_answers.length < 2 && self.kind == "choices"
  end
end
