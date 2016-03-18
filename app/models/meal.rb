class Meal < ActiveRecord::Base
  belongs_to :cook, class_name: "User"
  belongs_to :event
  validates_presence_of :name
end
