require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :comments, foreign_key: :commenter_id
  has_many  :meals, foreign_key: :cook_id
  has_many  :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :joined_events, through: :meals, source: :event
  has_many :shared_meals, through: :joined_events, source: :meals
  has_many :event_meals, through: :created_events, source: :meals

  validates_presence_of   :name, :hashed_password, :email
  validates :password, presence: true
  validates_uniqueness_of :email
  validate :actual_password

include BCrypt

  def all_meals
    total_meals = (shared_meals + event_meals)
    meals.each do |meal|
      total_meals.delete(meal)
    end
    return total_meals
  end

  def actual_password
    if @given_password.length < 8
      self.errors[:password] << "must be greater than 8 characters"
    end
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @given_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(attempt)
    self.password == attempt
  end

end
