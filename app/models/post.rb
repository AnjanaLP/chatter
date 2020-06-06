class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 300 }

  default_scope -> { order(created_at: :desc) }
end
