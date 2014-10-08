class Rant < ActiveRecord::Base

  belongs_to :user

  validates :title, :body, presence: true, length: {minimum: 2}

end