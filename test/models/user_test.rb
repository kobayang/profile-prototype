require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
  end

  test 'Fixtureのユーザーが取れていることの確認' do
    assert_not_nil users(:me)
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

  test 'ユーザーが削除されたときプロフィールも削除される' do
    user = User.new(email: "p3@test.com", password: "password", password_confirmation: "password")
    assert user.save

    user.profile = Profile.create(name: "p3test")
    user.destroy

    assert_nil Profile.find_by(name: "p3test")
  end

end
