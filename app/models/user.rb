class User < ActiveRecord::Base
  has_secure_password

  has_many :rants

  validates :first_name, :last_name, :bio, :rant_freq, :image, :presence => true

  validates :username, :presence => true, uniqueness: {case_sensitive: false}

  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize
  end

end