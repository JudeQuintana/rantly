class Rant < ActiveRecord::Base

  belongs_to :user
  has_many :favorites

  validates :title, :body, presence: true
  validates :title, length: {minimum: 2}
  validates :body, length: {minimum: 2}

  default_scope { order(id: :desc)}
end