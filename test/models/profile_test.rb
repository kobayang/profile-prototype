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

end
