class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :possible_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  delegate :title, prefix: :true, to: :poll
  validates_presence_of :title
  validates_inclusion_of :kind, in: ApplicationHelper::QUESTION_KINDS
  validate :require_two_possible_answers
  validate :max_5_choices
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attr| attr['title'].blank? }, allow_destroy: true

  def require_two_possible_answers
    errors.add(:base, "You need at least two choices") if self.possible_answers.length < 2 && self.kind == "choices"
  end

  def max_5_choices
    errors.add(:base, "You are limited to 5 choices, you have #{self.possible_answers.length}") if self.possible_answers.length > 5 && self.kind == 'choices'
  end

end
