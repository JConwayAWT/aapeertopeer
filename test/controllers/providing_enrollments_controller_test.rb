require 'test_helper'

class ProvidingEnrollmentsControllerTest < ActionController::TestCase
  setup do
    @providing_enrollment = providing_enrollments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:providing_enrollments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create providing_enrollment" do
    assert_difference('ProvidingEnrollment.count') do
      post :create, providing_enrollment: {  }
    end

    assert_redirected_to providing_enrollment_path(assigns(:providing_enrollment))
  end

  test "should show providing_enrollment" do
    get :show, id: @providing_enrollment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @providing_enrollment
    assert_response :success
  end

  test "should update providing_enrollment" do
    patch :update, id: @providing_enrollment, providing_enrollment: {  }
    assert_redirected_to providing_enrollment_path(assigns(:providing_enrollment))
  end

  test "should destroy providing_enrollment" do
    assert_difference('ProvidingEnrollment.count', -1) do
      delete :destroy, id: @providing_enrollment
    end

    assert_redirected_to providing_enrollments_path
  end
end
