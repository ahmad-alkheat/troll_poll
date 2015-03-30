class User < ActiveRecord::Base
  has_many :polls
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
