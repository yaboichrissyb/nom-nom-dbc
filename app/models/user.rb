require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :comments, foreign_key: :commenter_id
  has_many  :meals, foreign_key: :cook_id
  has_many  :events, foreign_key: :creator_id

  validates_presence_of   :name, :hashed_password, :email
  validates_uniqueness_of :email


include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(attempt)
    self.password == attempt
  end

end
