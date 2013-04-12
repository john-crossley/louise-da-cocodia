class Donation < ActiveRecord::Base
  attr_accessible :amount, :anonymous, :email, :name, :message
  validates :anonymous, inclusion: { in: [true, false] }
  validates :message, length: { in: 0..400 }
end