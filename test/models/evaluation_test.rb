require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:email => "me@name.com", :password => 'password', :password_confirmation => 'password')
    @profile = Profile.new
    @profile.user = @user

    @rails = Skill.new(name: "rails")
    @git = Skill.new(name: "git")
  end

  test 'ユーザーはスキルを評価することができる' do
    other = User.new(:email => "other@name.com", :password => 'password', :password_confirmation => 'password')

    @profile.skills << @rails
    @profile.skills << @git

    my_first_skill = @profile.profile_skills.first
    my_first_skill.evaluators << other

    assert_equal 1, my_first_skill.evaluators.size
  end

  test '同じ人が同じスキルを評価することはできない' do
    other = User.create(:email => "other@name.com", :password => 'password', :password_confirmation => 'password')
    profile = other.profile = Profile.create(name: "Other")
    skill = Skill.create(name: "skill")

    profile.skills << skill

    my_skill = profile.profile_skills.first
    my_skill.evaluators << other

    # 複数回同じスキル評価をするとRecordNotUniqueが発生する
    assert_raise ActiveRecord::RecordNotUnique do
      my_skill.evaluators << other
    end
  end
end
