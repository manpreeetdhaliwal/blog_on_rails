class Post < ApplicationRecord
    before_save :capitalize_title
    has_many :comments, dependent: :destroy 
    # ASSOCIATION WITH USER MODEL
    belongs_to :user, optional: true
    validates :title, presence: {message: 'must be provided'},uniqueness: true
   validates :title, uniqueness: true
    validates :body , length:{minimum: 50}
    private
    def capitalize_title
        self.title.capitalize!
    end
end
