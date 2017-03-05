# == Schema Information
#
# Table name: evaluations
#
#  id           :integer          not null, primary key
#  evaluated_id :integer
#  evaluator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Evaluation < ApplicationRecord
  belongs_to :evaluator, class_name: "User"
  belongs_to :evaluated, class_name: "ProfileSkill", counter_cache: "evaluations_count"
end
