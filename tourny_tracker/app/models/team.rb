class Team < ApplicationRecord
  belongs_to :group
  validates :name, presence: true, uniqueness: true, length: { maximum: 15}
  validates :group, presence: true
  validates :points, presence: true, numericality: { greater_than: -1 }
end
