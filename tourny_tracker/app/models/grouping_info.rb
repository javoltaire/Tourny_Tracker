class GroupingInfo < ApplicationRecord
  # Associations
  belongs_to :elimination_type
  belongs_to :tournament, inverse_of: :grouping_info
  # Validation
  validates :elimination_type, presence: true
  validates :group_count, presence: true, numericality: { even: true, greater_than: 1 }
  validates :teams_per_group, presence: true, numericality: { even: true, greater_than: 1 }
  validates :playoffs_advanced,  presence: true, numericality: { even: true, greater_than: 1 }
  validates :tournament, presence: true, uniqueness: true
end
