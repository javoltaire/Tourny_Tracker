class Tournament < ApplicationRecord
  # Assocaitions
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  belongs_to :elimination_type
  belongs_to :game
  belongs_to :tournament_state
  has_and_belongs_to_many :hosts, class_name: "User"
  has_one :grouping_info, inverse_of: :tournament 
  has_many :groups
  # Validations
  validates :name, presence: true, uniqueness: true, length: {maximum: 20}, allow_blank: false
	validates :team_count, presence: true, numericality: { even: true }
  validates :elimination_type, presence: true
	validates :team_size, presence: true
  validates :game, presence: true
  validates :tournament_state, presence: true
  validates :creator, presence: true
  validates_inclusion_of :use_grouping, :in => [true, false]
  validate :has_grouping_info?
  # Callbacks
  before_save :create_groups
  after_initialize :set_defaults
  # Other attributes accepted
  accepts_nested_attributes_for :grouping_info, allow_destroy: false, reject_if: :should_not_create_grouping?

  private
    # ================ Validation Methods ==========
    # Make sure there is a grouping info object if use_grouping is true
    def has_grouping_info?
      if self.use_grouping && self.grouping_info.nil?
        errors.add :base, "There needs to be grouping info for this tournament"
      elsif !self.use_grouping && !self.grouping_info.nil?
        errors.add :base, "No need to for grouping info for this tournament"
      end
    end

    def should_not_create_grouping?
      !self.use_grouping
    end

    # ================ Call back Methods ==========
    def set_defaults
      self.use_grouping = false if self.use_grouping.nil?
      self.tournament_state ||= TournamentState.first
    end

    def create_groups
      if self.use_grouping
        self.team_count = self.grouping_info.group_count * self.grouping_info.teams_per_group
        # First get a list of group names for the number of groups in this tournament
        group_names = GroupName.order('name').limit(self.grouping_info.group_count)
        # Now iteraet over that lits to create the acutal groups
        group_names.each do |g|
          self.groups << Group.new(group_name: g)
        end
      else
        self.grouping_info = nil
      end
    end
end
