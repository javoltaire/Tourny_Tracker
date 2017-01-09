class Teammate < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :team
  belongs_to :tournament
  #Validations
  validates :user_id, uniqueness: {scope: :tournament_id}
  # validate :user_not_already_participant

  # private
  #   def user_not_already_participant
  #     errors.add :base, "User is already a participant" if self.team.tournament.is_user_participant?(self.user)
  #   end
end
