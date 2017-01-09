class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Associations
  has_and_belongs_to_many :hosted_tournaments, class_name: "Tournament"
  has_many :created_tournaments, class_name: "Tournament", foreign_key: "created_by"
  has_many :teammates
  has_many :teams, through: :teammates


  # Helper that will return the full name of the User
  def full_name
    "#{first_name} #{last_name}"
  end
end
