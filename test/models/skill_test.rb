# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SkillTest < ActiveSupport::TestCase

  test 'スキルが存在する' do
    rails = Skill.new(name: "rails")
    assert_not_nil rails
  end

  test 'スキルを削除したとき同時にスキルが持つスキルも削除される' do
    profile = profiles(:my_profile)

    skill = Skill.create(name: "gohan")
    skill.profiles << profile
    skill.destroy

    assert_nil ProfileSkill.find_by(skill_id: skill.id)
  end
end
