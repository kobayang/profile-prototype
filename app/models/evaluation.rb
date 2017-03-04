class Evaluation < ApplicationRecord
  belongs_to :evaluator, class_name: "Profile", foreign_key: :evaluator_id
  belongs_to :evaluated, class_name: "ProfileSkill", foreign_key: :evaluated_id
end
