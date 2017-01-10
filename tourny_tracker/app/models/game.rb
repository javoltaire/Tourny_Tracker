class Game < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }, uniqueness: true
end
