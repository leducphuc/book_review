class Review < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :book
end
