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

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:email => "profile@name.com", :password => 'password', :password_confirmation => 'password')
  end

  test 'プロフィールはユーザーの参照がないと保存できない' do
    profile = Profile.new
    assert_not profile.valid?
  end

  test 'プロフィールはユーザーの参照があると保存できる' do
    profile = Profile.new
    profile.user = @user
    assert profile.valid?
  end

  test 'プロフィールを削除したとき同時にプロフィールが持つスキルも削除される' do
    user = User.create(email: "p3@test.com", password: "password", password_confirmation: "password")
    profile = user.profile = Profile.create(name: "ps2test")

    ohagi = Skill.create(name: "ohagi")
    mochi = Skill.create(name: "mochi")

    profile.skills << [ohagi, mochi]

    user.destroy
    # => profileもdestoyされるため、ProfileSkillも削除される

    assert_nil ProfileSkill.find_by(profile_id: profile.id)
  end

end
