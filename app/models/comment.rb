class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  validates :body, presence: {message: " should be present"}
end
