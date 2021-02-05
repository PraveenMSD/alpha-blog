class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :database_authenticatable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
end