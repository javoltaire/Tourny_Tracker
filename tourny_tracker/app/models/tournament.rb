class Tournament < ApplicationRecord
  # Assocaitions
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  belongs_to :elimination_type
  belongs_to :game
  belongs_to :tournament_state
  has_and_belongs_to_many :hosts, class_name: "User"
  has_one :grouping_info, inverse_of: :tournament 
  has_many :groups
  has_many :teams, through: :groups
  has_many :members, through: :teams, source: :users
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
  validate :number_of_groups_valid
  # Callbacks
  before_save :create_groups
  after_initialize :set_defaults
  # Other attributes accepted
  accepts_nested_attributes_for :grouping_info, allow_destroy: false, reject_if: :should_not_create_grouping?

  # Tells if the given user is the creator of this tournament
  def is_user_creator?(user)
    if(user.nil?)
      false
    else
      self.creator == user
    end
  end

  # Tells if the given user is a host for this tournament
  def is_user_host?(user)
    if(user.nil?)
      false
    else
      self.hosts.exists?(user.id) || self.creator == user
    end
  end

  # This returns a list of groups that are not full
  def available_groups
    # Create the array that will hold the list fo groups
    avail_groups = Array.new
    # Now find the onces that are not full
    self.groups.each do |group|
      unless group.is_full?
        avail_groups << group
      end
    end
  end

  # since if groups should not be used creates a single group to hold teams,
  # this method returns that group
  def groupless_group
    self.groups.first
  end

  # Tells if a user is already participating in this tournament
  def is_user_participant?(user)
    self.members.exists?(user.id)
  end

  # Determines if all teams spots are filled
  def is_ready?
    ready = true
    self.groups.each do |group|
      unless group.is_full?
        ready = false 
        break
      end
    end
    ready
  end

  # Starts the tournament
  def start_tournament
    if is_ready?
      if self.use_grouping
        if self.grouping_info.elimination_type.name == "Round Robin"
          self.groups.each do |group|
            gen_round_robin_matches(group.teams)
          end
        elsif self.grouping_info.elimination_type.name == "Single Elimination"

        end
      else
        if self.elimination_type.name == "Round Robin"
          gen_round_robin_matches(groupless_group.teams)
        end
      end
    end
  end

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

    def number_of_groups_valid
      if(self.use_grouping)
        errors.add :base, "Number of groups reached." if self.groups.count >= self.grouping_info.group_count
      else
        errors.add :base, "Number of groups reached." if self.groups.count >= 1
      end
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
        # Otherwise there should not be grouping info
        self.grouping_info = nil
        #Create a single group that will hold all the teams
        team_group_name = GroupName.last
        self.groups << Group.new(group_name: team_group_name)
      end
    end

    # will generate and save matches necessary for round roubin from a list of teams
    def gen_round_robin_matches(teams)
      # Make sure the team object is not nil
      logger.info teams.count
      if teams.any?
        for h in 0..teams.count-1
          for a in h+1..teams.count-1
            Match.create(home_team_id: teams[h].id, away_team_id: teams[a].id, round: :prelims).save!
          end
        end
      end
    end

end
