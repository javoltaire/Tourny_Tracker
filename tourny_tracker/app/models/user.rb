class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :hosted_tournaments, class_name: "Tournament"
  has_many :created_tournaments, class_name: "Tournament", foreign_key: "created_by"

  # Helper that will return the full name of the User
  def full_name
    "#{first_name} #{last_name}"
  end

  # Helper that will return a list of hosted tournaments and created tournaments
  # def tournaments
  #   self.hosted_tournaments + self.created_tournaments
  # end
end
