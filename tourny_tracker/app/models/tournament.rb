class Tournament < ApplicationRecord
	has_and_belongs_to_many :users
  belongs_to :game_type
  after_initialize :set_default_values, unless: :persisted?
	validates :name, presence: true, uniqueness: true
	validates :team_count, presence: true, numericality: { even: true }
	validates :group_count, numericality: { even: true }
	validates :max_teammates, presence: true
  validates :game_type, presence: true
  validates :status, presence: true
  validate :has_users?
  validate :has_valid_group_count?


	private
		def set_default_values
      self.group_count ||= 0
      self.max_teammates ||= 0
      self.status ||= "Prelims"
		end

    def has_users?
      errors.add :base, "Tournaments must have at least on host." if self.users.blank?
    end

    def has_valid_group_count?
      unless group_count.nil? || team_count.nil?
        if(group_count > team_count)
          errors.add :base, "The number of groups must be less than the number of teams."
        end
      end

      unless group_count.nil? || group_count == 0
        if(team_count % group_count != 0)
          errors.add :base, "The number of teams must be divisible by the number of groups."
        end
      end
    end
end
