# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skill < ApplicationRecord
  has_many :profile_skills, dependent: :destroy
  has_many :profiles, through: :profile_skills, source: 'profile'

  # Validation
  # nameが存在する
  validates :name, presence: true, uniqueness: true
  # nameは英数字のみ
  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/ }

end
