class Event < ActiveRecord::Base
  belongs_to  :creator, class_name: "User"
  belongs_to  :week
  has_many    :comments
  has_many    :meals
 end
