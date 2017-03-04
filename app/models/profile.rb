class Profile < ApplicationRecord
  belongs_to :user

  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills, source: 'skill'
end
