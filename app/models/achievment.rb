class Achievment < ApplicationRecord
  validates :achievement_id, presence: true
  validates :achievement_date, presence: true
end
