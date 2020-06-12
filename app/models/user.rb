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

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
end
