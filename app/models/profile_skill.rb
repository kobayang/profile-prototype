# == Schema Information
#
# Table name: profile_skills
#
#  id         :integer          not null, primary key
#  profile_id :integer
#  skill_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  has_many :evaluations, foreign_key: "evaluated_id", dependent: :delete_all
  has_many :evaluators, through: :evaluations, source: :evaluator
end
