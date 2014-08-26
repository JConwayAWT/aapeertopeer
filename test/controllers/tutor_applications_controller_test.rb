require 'test_helper'

class TutorApplicationsControllerTest < ActionController::TestCase
  setup do
    @tutor_application = tutor_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutor_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutor_application" do
    assert_difference('TutorApplication.count') do
      post :create, tutor_application: { email: @tutor_application.email, full_name: @tutor_application.full_name, grade: @tutor_application.grade, times_available: @tutor_application.times_available }
    end

    assert_redirected_to tutor_application_path(assigns(:tutor_application))
  end

  test "should show tutor_application" do
    get :show, id: @tutor_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutor_application
    assert_response :success
  end

  test "should update tutor_application" do
    patch :update, id: @tutor_application, tutor_application: { email: @tutor_application.email, full_name: @tutor_application.full_name, grade: @tutor_application.grade, times_available: @tutor_application.times_available }
    assert_redirected_to tutor_application_path(assigns(:tutor_application))
  end

  test "should destroy tutor_application" do
    assert_difference('TutorApplication.count', -1) do
      delete :destroy, id: @tutor_application
    end

    assert_redirected_to tutor_applications_path
  end
end
