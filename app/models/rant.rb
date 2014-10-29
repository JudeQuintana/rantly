class Rant < ActiveRecord::Base

  belongs_to :user

  validates :title, :body, presence: true
  validates :title, length: {minimum: 2}
  validates :body, length: {minimum: 2}
end