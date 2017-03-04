class Evaluation < ApplicationRecord
  belongs_to :evaluator, class_name: "User"
  belongs_to :evaluated, class_name: "ProfileSkill"
end
