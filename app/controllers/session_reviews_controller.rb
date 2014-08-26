class SessionReviewsController < ApplicationController
  before_action :set_session_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /session_reviews
  # GET /session_reviews.json
  def index
    admin_only
    @session_reviews = SessionReview.all
  end

  # GET /session_reviews/1
  # GET /session_reviews/1.json
  def show
    owner_admin_only
  end

  # GET /session_reviews/new
  def new
    @session_review = SessionReview.new
  end

  # GET /session_reviews/1/edit
  def edit
    admin_only
  end

  # POST /session_reviews
  # POST /session_reviews.json
  def create
    @session_review = SessionReview.new(session_review_params)

    respond_to do |format|
      if @session_review.save
        format.html { redirect_to @session_review, notice: 'Session review was successfully created.' }
        format.json { render :show, status: :created, location: @session_review }
      else
        format.html { render :new }
        format.json { render json: @session_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_reviews/1
  # PATCH/PUT /session_reviews/1.json
  def update
    learner_only
    respond_to do |format|
      if @session_review.update(session_review_params)
        @session_review.date = Date.today
        @session_review.save!
        format.html { redirect_to @session_review, notice: 'Session review was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_review }
      else
        format.html { render :edit }
        format.json { render json: @session_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_reviews/1
  # DELETE /session_reviews/1.json
  def destroy
    admin_only
    @session_review.destroy
    respond_to do |format|
      format.html { redirect_to session_reviews_url, notice: 'Session review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_review
      @session_review = SessionReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_review_params
      params.require(:session_review).permit(:date, :knows_and_understands, :explains_clearly, :asks_me_questions, :listens_and_understands, :checks_my_understanding, :is_patient, :is_friendly, :alternative_explanations, :accomodates, :uses_aids, :on_time, :overall_helpful, :additional_comments)
    end

    def owner_admin_only
      unless @session_review.tutor == current_user or @session_review.learner == current_user or current_user.is_admin == true
        flash[:alert] = "You do not have permission to take the requested action"
        redirect_to user_path(current_user)
      end
    end

    def learner_only
      unless @session_review.learner == current_user or current_user.is_admin == true
        flash[:alert] = "You do not have permission to take the requested action"
        redirect_to user_path(current_user)
      end
    end
end
