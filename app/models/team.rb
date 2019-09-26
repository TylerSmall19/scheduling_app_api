class Team < ApplicationRecord
  attr_accessor :teamName, :homeLocation, :captainID
  validates :teamName, presence: true
  validates :captainId, presence: true
end