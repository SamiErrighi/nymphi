module Api
  module V1
    class PlantsControllerTest < ActionController::TestCase
      test "should get index" do
        get :index

        assert_response :success
      end
    end
  end
end