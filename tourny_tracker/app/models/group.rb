class Group < ApplicationRecord
  belongs_to :group_name
  belongs_to :tournament
  has_many :teams
  validates :group_name_id, uniqueness: {scope: :tournament_id}

  # this will return the actual name of the group
  def name_of_group
    group_name.name
  end
end
