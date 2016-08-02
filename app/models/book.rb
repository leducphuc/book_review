class Book < ActiveRecord::Base
  has_many :user_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :user_books

  belongs_to :category

  validates :title, presence: true, uniqueness: true, length: {maximum: 140}
  validates :author, presence: true, length: {maximum: 50}
  validates :number_of_pages, presence: true, numericality: {only_integer: true}, 
    length: {maximum: 5}
end
