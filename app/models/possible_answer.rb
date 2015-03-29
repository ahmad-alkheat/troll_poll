class PossibleAnswer < ActiveRecord::Base
  belongs_to :question
  has_many :answers, dependent: :destroy
end
