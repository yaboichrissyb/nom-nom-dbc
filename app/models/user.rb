require 'bcrypt'

class User < ActiveRecord::Base
include BCrypt

  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  has_many :posts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(attempt)
    self.password == attempt
  end

end
