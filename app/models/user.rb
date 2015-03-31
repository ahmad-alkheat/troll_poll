class User < ActiveRecord::Base
  has_many :polls, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
