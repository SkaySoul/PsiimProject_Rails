class Gnome < ApplicationRecord
  validates :gnome_name, presence: true
  validates :localization, presence: true
  validates :description, presence: true
end
