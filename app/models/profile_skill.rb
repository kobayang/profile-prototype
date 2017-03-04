class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  has_many :profile, through: :evaluation
end
