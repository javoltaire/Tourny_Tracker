class Group < ApplicationRecord
  # Associations
  belongs_to :group_name
  belongs_to :tournament
  has_many :teams
  # Validations
  validates :group_name_id, uniqueness: {scope: :tournament_id}
  before_save :is_not_full?

  # this will return the actual name of the group
  def name_of_group
    group_name.name
  end

  # Tells whether this group is already filled
  def is_full?
    if(self.tournament.use_grouping)
      self.teams.count == self.tournament.grouping_info.teams_per_group
    else
      self.teams.count == self.tournament.team_count
    end
  end

  private
    # ======================== Callback Methods =======================
    # This will make sure that the group doesn't contain more teams teams than the maximum from parent tournament
    def is_not_full?
      errors.add :base, "This group is full, choose a different one" if is_full?
    end

end
