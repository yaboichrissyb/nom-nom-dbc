class Comment < ActiveRecord::Base
  belongs_to  :commenter, class_name: "User"
  belongs_to  :event
  validates_presence_of :body
end
