class GroupName < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 1}
end
