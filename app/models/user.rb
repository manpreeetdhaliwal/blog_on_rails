class User < ApplicationRecord
    #Associations:
    has_many :posts, dependent: :nullify
    has_many :comments, dependent: :nullify
    has_secure_password
    #Validations:

    validates :email, presence: true, uniqueness: true, 
    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    #The above VALID_EMAIL_REGEX format is available because we 
    #uncommented the bcrypt gem
    
    validates :first_name, :last_name, presence: true
    def full_name
        "#{first_name} #{last_name}"
    end
end
