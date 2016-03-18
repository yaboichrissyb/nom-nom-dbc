class Event < ActiveRecord::Base
  belongs_to  :creator, class_name: "User"
  belongs_to  :week
  has_many    :comments
  has_many    :meals
  validates_presence_of :name, :start_date, :end_date, :max_people
  validates :max_people, numericality: { only_integer: true }


  def is_in_the_future?
    result = start_date <=> Date::today
    return true if result == 1
  end

 end
