class TournamentState < ApplicationRecord
  validates :state, presence: true, length: { minimum: 1 }, uniqueness: true
end
