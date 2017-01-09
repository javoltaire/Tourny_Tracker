class Team < ApplicationRecord
  # Associations
  belongs_to :group
  has_one :tournament, through: :group
  has_many :teammates
  has_many :users, through: :teammates
  # validations
  validates :name, presence: true, uniqueness: true , length: { maximum: 15}
  validates :group, presence: true
  validates :points, numericality: { greater_than: -1 }
  validate :team_not_full
  # Callback Methods
  after_initialize :set_defaults

  # Tells if this team is full or not
  def team_full?
    self.teammates.count >= self.tournament.team_size
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
end
