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
end
