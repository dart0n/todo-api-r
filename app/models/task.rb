class Task < ApplicationRecord
  TIME_DEADLINE_NOTIFICATION = 5.minutes

  belongs_to :user
  belongs_to :project
end
