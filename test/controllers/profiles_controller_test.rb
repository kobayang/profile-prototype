require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  test "Profile画面が存在する" do
    user = User.create(:email => "profile_controller@name.com", :password => 'password', :password_confirmation => 'password')
    get user_profile_path(user)
    assert_template :show
  end

  test "ログインユーザーはProfileEditページを見ることができる" do
    Warden.test_mode!
    user = User.create(:email => "profile_controller_edit@name.com", :password => 'password', :password_confirmation => 'password')
    login_as(user, :scope => :user)

    get edit_user_profile_path(user)
    assert_template :edit
  end

  test "ログインしていないユーザーはProfileEditページを見ることができない" do
    Warden.test_mode!
    user = User.create(:email => "profile_controller_edit@name.com", :password => 'password', :password_confirmation => 'password')
    # login_as(user, :scope => :user)

    get edit_user_profile_path(user)
    assert_redirected_to root_path
  end

  test "ユーザーはプロフィールを作成することができる" do
    Warden.test_mode!
    user = User.create(:email => "profile_controller_edit@create.com", :password => 'password', :password_confirmation => 'password')
    login_as(user, :scope => :user)

    patch user_profile_path(user), params: {
      profile: {
        name: "test_user"
      }
    }
    assert_redirected_to user_profile_path(user)
    assert_equal "test_user", user.profile.name
  end

  test "ユーザーはプロフィールを更新することができる" do
    Warden.test_mode!
    user = User.create(:email => "profile_controller_edit@update.com", :password => 'password', :password_confirmation => 'password')
    user.profile = Profile.create(name: "hogehoge_user")
    login_as(user, :scope => :user)

    patch user_profile_path(user), params: {
      profile: {
        name: "test_user"
      }
    }
    assert_redirected_to user_profile_path(user)
    assert_equal "test_user", user.profile.name
  end
end
