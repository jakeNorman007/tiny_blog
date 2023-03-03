class Article < ApplicationRecord
  # makes sure that the form has something in the field & meets length requirements
  validates :title, presence: true, length: {minimum: 6, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end