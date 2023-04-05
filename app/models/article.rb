class Article < ApplicationRecord
  # makes sure that the form has something in the field & meets length requirements
  belongs_to :user
  has_one_attached :image
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 6, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 5000}
end