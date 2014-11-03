class User < ActiveRecord::Base
  has_secure_password

  has_many :rants
  has_many :followed_user_relationships, foreign_key: :follower_id, class_name: 'FollowingRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  validates :first_name, :last_name, :bio, :rant_freq, :image, :presence => true
  validates :username, :presence => true, uniqueness: {case_sensitive: false}


  def follow_user?(user)
    followed_users.include?(user)
  end

end