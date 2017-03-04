require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'ユーザーが存在すること' do
    user = users(:me)
    assert_not_nil(user)
  end

end
