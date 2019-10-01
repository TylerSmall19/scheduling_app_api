class Team < ApplicationRecord
  validates :homeLocation, presence: true
  validates :teamName, presence: true
  validates :captainId, presence: true
end