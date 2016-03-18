require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :comments, foreign_key: :commenter_id
  has_many  :meals, foreign_key: :cook_id
  has_many  :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :joined_events, through: :meals, source: :event
  has_many :shared_meals, through: :joined_events, source: :meals
  has_many :event_meals, through: :created_events, source: :meals

  validates_presence_of   :name, :hashed_password, :email
  validates_uniqueness_of :email


include BCrypt

  def all_meals
    total_meals = (shared_meals + event_meals)
    meals.each do |meal|
      total_meals.delete(meal)
    end
    return total_meals
  end

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
