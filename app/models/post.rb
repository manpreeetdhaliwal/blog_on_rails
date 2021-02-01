class Post < ApplicationRecord
    has_many :comments, dependent: :destroy 
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    # validates :title, uniqueness: true
    validates :body , length:{minimum: 50}
end
