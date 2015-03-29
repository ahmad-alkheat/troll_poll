class Reply < ActiveRecord::Base
  belongs_to :poll
  has_many :asnwers
  accepts_nested_attributes_for :answers
end
