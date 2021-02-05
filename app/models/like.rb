class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user

  scope :active, -> { where(like: true) }
end
