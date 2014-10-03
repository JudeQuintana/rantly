class User < ActiveRecord::Base
  has_secure_password

  validates :username, :first_name, :last_name, :bio, :rant_freq, :presence => true


end