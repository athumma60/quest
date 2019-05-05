require 'test_helper'

class QuizControllerTest < ActionController::TestCase
  test "should get quiz1" do
    get :quiz1
    assert_response :success
  end

end
