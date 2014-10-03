class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :bio, :rant_freq, :presence => true

  validates :username, :presence => true, uniqueness: {case_sensitive: false}



end