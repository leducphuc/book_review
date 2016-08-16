class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :sub_comments, class_name: "Comment", foreign_key: "parent_id",
    dependent: :destroy
  belongs_to :parent_comment, class_name: "Comment"
end
