class Activity < ActiveRecord::Base
  has_many :like_activities, dependent: :destroy

  belongs_to :user
end
