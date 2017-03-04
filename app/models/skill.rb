class Skill < ApplicationRecord
  has_many :profiles, through: :profile_skills
end
