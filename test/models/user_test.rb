require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
  end

  test 'ユーザーが存在すること' do
    assert_not_nil User.new
  end

  test 'ユーザーが有効であること' do
    assert @user.valid?
  end

  test 'ユーザーはプロフィールを持つこと' do
    @user.profile = Profile.new
    assert_not_nil @user.profile
  end

end
