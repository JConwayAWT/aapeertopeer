require 'test_helper'

class ConsumingEnrollmentsControllerTest < ActionController::TestCase
  setup do
    @consuming_enrollment = consuming_enrollments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consuming_enrollments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consuming_enrollment" do
    assert_difference('ConsumingEnrollment.count') do
      post :create, consuming_enrollment: {  }
    end

    assert_redirected_to consuming_enrollment_path(assigns(:consuming_enrollment))
  end

  test "should show consuming_enrollment" do
    get :show, id: @consuming_enrollment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consuming_enrollment
    assert_response :success
  end

  test "should update consuming_enrollment" do
    patch :update, id: @consuming_enrollment, consuming_enrollment: {  }
    assert_redirected_to consuming_enrollment_path(assigns(:consuming_enrollment))
  end

  test "should destroy consuming_enrollment" do
    assert_difference('ConsumingEnrollment.count', -1) do
      delete :destroy, id: @consuming_enrollment
    end

    assert_redirected_to consuming_enrollments_path
  end
end
