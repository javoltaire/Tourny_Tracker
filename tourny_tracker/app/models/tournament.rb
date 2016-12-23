class Tournament < ApplicationRecord
	has_and_belongs_to_many :users
  after_initialize :set_default_values, unless: :persisted?
	validates :name, presence: true
	validates :team_count, presence: true, numericality: { even: true }
	validates :group_count, numericality: { even: true }
	validates :max_teammates, presence: true
  validates :status, presence: true
	# validates :description, presence: true
  validate :has_users?


	private
		def set_default_values
      self.group_count ||= 0
      self.max_teammates ||= 0
      self.status ||= "Prelims"
		end

    def has_users?
      errors.add :base, "Tournaments must have at least on host." if self.users.blank?
    end
end
