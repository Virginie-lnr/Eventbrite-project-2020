class Attendance < ApplicationRecord

  # after_create :

  belongs_to :user
  belongs_to :event
end
