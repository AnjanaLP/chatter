class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  has_many :posts, dependent: :destroy

  has_many :active_friendships, class_name:  "Friendship",
                                foreign_key: "follower_id",
                                dependent:   :destroy

  has_many :following, through: :active_friendships, source: :followed

  has_many :passive_friendships, class_name:  "Friendship",
                                 foreign_key: "followed_id",
                                 dependent:   :destroy

  has_many :followers, through: :passive_friendships, source: :follower
end
