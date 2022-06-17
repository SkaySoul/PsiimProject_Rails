class User < ApplicationRecord
  validates :username, presence: true
  validates :login, presence: true
  validates :password, presence: true
end
