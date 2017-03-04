class Profile < ApplicationRecord
  belongs_to :user

  has_many :skills, through: :profile_skills
end
