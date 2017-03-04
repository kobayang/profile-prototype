# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
