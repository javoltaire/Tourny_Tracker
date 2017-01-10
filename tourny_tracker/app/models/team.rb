class Team < ApplicationRecord
  # Associations
  belongs_to :group
  has_one :tournament, through: :group
  has_many :teammates
  has_many :users, through: :teammates
  has_many :home_matches, class_name: "Match", foreign_key: :home_team_id
  has_many :away_matches, class_name: "Match", foreign_key: :away_team_id
  # validations
  validates :name, presence: true, uniqueness: true , length: { maximum: 15}
  validates :group, presence: true
  validates :points, numericality: { greater_than: -1 }
  validate :team_not_full
  # Callback Methods
  after_initialize :set_defaults
  after_save :try_starting_tournament

  # Tells if this team is full or not
  def team_full?
    self.teammates.count >= self.tournament.team_size
  end

  def matches
    (home_matches.all + away_matches.all).uniq
  end

  private
    # ============================== Validations =============================
    # Tells if the team is not full (Used for validation)
    def team_not_full
      if team_full?
        errors.add :base, "This team is full please pick a different one"
      end
    end
    # ============================== Callbacks ================================
    # Defaults the number of points to 0
    def set_defaults
      self.points = 0
    end

    def try_starting_tournament
      if self.tournament.is_ready?
        self.tournament.start_tournament
      end
    end
end
