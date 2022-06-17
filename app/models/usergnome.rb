class Usergnome < ApplicationRecord
  self.table_name = 'users_gnomes'
  validates :user_id, presence: true
  validates :gnome_id, presence: true
end
