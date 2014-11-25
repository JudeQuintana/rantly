class Comment < ActiveRecord::Base

  validates_presence_of :body

  belongs_to :commentable, polymorphic: true

  def username
    User.find(user_id).username
  end

end