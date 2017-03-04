# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string
#  introduction :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user

  has_many :profile_skills, dependent: :destroy
  has_many :skills, through: :profile_skills, source: 'skill'
end
