require 'test_helper'

class EvaluatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get evaluators_create_url
    assert_response :success
  end

end
