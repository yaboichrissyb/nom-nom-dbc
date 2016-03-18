class Event < ActiveRecord::Base
  belongs_to  :creator, class_name: "User"
  belongs_to  :week
  has_many    :comments
  has_many    :meals
  has_many :participants, through: :meals, source: :cook

  validates_presence_of :name, :start_date, :end_date, :max_people
  validates :max_people, numericality: { only_integer: true }


  def is_in_the_future?
    result = start_date <=> Date::today
    return true if result == 1
  end

  def start_day
    return Date._parse(start_date.to_s)[:mday]
  end

  def start_month
    date_hash = Date._parse(start_date.to_s)
    month = date_hash[:mon]
    case month
    when 1
      return "Jan"
    when 2
      return "Feb"
    when 3
      return "Mar"
    when 4
      return "Apr"
    when 5
      return "May"
    when 6
      return "Jun"
    when 7
      return "Jul"
    when 8
      return "Aug"
    when 9
      return "Sep"
    when 10
      return "Oct"
    when 11
      return "Nov"
    when 12
      return "Dec"
    end
  end

def end_day
    return Date._parse(end_date.to_s)[:mday]
  end

  def is_full?
    return true if self.participants.length == max_people
  end

  def end_month
    date_hash = Date._parse(end_date.to_s)
    month = date_hash[:mon]
    case month
    when 1
      return "Jan"
    when 2
      return "Feb"
    when 3
      return "Mar"
    when 4
      return "Apr"
    when 5
      return "May"
    when 6
      return "Jun"
    when 7
      return "Jul"
    when 8
      return "Aug"
    when 9
      return "Sep"
    when 10
      return "Oct"
    when 11
      return "Nov"
    when 12
      return "Dec"
    end
  end
 end
