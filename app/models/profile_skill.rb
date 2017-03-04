class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  has_many :evaluations, foreign_key: "evaluated_id"
  has_many :evaluators, through: :evaluations, source: :evaluator
end
