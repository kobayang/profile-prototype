require 'test_helper'

class SkillTest < ActiveSupport::TestCase

  test 'スキルが存在する' do
    rails = Skill.new(name: "rails")
    assert_not_nil rails
  end
end
