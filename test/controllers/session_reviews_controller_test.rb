require 'test_helper'

class SessionReviewsControllerTest < ActionController::TestCase
  setup do
    @session_review = session_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_review" do
    assert_difference('SessionReview.count') do
      post :create, session_review: { accomodates: @session_review.accomodates, additional_comments: @session_review.additional_comments, alternative_explanations: @session_review.alternative_explanations, asks_me_questions: @session_review.asks_me_questions, checks_my_understanding: @session_review.checks_my_understanding, date: @session_review.date, explains_clearly: @session_review.explains_clearly, is_friendly: @session_review.is_friendly, is_patient: @session_review.is_patient, knows_and_understands: @session_review.knows_and_understands, listens_and_understands: @session_review.listens_and_understands, on_time: @session_review.on_time, overall_helpful: @session_review.overall_helpful, uses_aids: @session_review.uses_aids }
    end

    assert_redirected_to session_review_path(assigns(:session_review))
  end

  test "should show session_review" do
    get :show, id: @session_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_review
    assert_response :success
  end

  test "should update session_review" do
    patch :update, id: @session_review, session_review: { accomodates: @session_review.accomodates, additional_comments: @session_review.additional_comments, alternative_explanations: @session_review.alternative_explanations, asks_me_questions: @session_review.asks_me_questions, checks_my_understanding: @session_review.checks_my_understanding, date: @session_review.date, explains_clearly: @session_review.explains_clearly, is_friendly: @session_review.is_friendly, is_patient: @session_review.is_patient, knows_and_understands: @session_review.knows_and_understands, listens_and_understands: @session_review.listens_and_understands, on_time: @session_review.on_time, overall_helpful: @session_review.overall_helpful, uses_aids: @session_review.uses_aids }
    assert_redirected_to session_review_path(assigns(:session_review))
  end

  test "should destroy session_review" do
    assert_difference('SessionReview.count', -1) do
      delete :destroy, id: @session_review
    end

    assert_redirected_to session_reviews_path
  end
end
