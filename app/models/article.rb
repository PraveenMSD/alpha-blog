class Article < ApplicationRecord
    has_rich_text :content
    has_many :comments, dependent: :destroy
    has_many :likes
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10 }

    def liked?(user)
        !!self.likes.find{|like| like.user_id == user.id}
    end

  
end