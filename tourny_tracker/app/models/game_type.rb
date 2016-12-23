class GameType < ApplicationRecord
  has_many :tournaments
  validates :game_type, presence: true
end
