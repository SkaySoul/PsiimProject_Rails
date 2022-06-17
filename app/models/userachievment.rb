class Userachievment < ApplicationRecord
  self.table_name = 'users_achievments'
  validates :user_id, presence: true
  validates :achievement_id, presence: true
  validates :achievement_date, presence: true
end
