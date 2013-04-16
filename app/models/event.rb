class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_time, :description, :location, :title

  validates :title, presence: true, length: { in: 5..128 }
  validates :location, presence: true
end