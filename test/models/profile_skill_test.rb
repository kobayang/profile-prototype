require 'test_helper'

class ProfileSkillTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:email => "skill@name.com", :password => 'password', :password_confirmation => 'password')
    @profile = Profile.new
    @profile.user = @user
  end

  test 'スキルをプロフィールに追加することができる' do
    rails = Skill.create(name: "rails")
    git = Skill.create(name: "git")

    rails.profiles << @profile
    assert_equal 1, @profile.skills.size

    @profile.skills << git
    assert_equal 2, @profile.skills.size
  end

  test 'プロフィールスキルを削除した時、その評価も削除される' do
    profile = profiles(:my_profile)
    skill = skills(:rails)
    other = users(:test_user)

    profile.skills << skill
    my_skill = profile.profile_skills.first

    my_skill.evaluators << other
    my_skill.destroy

    assert_nil Evaluation.find_by(evaluated_id: my_skill.id)
  end

end
