class Poll < ActiveRecord::Base
  validates_presence_of :title
  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy

end
