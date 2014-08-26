class ConsumingEnrollmentsController < ApplicationController
  before_action :set_consuming_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /consuming_enrollments
  # GET /consuming_enrollments.json
  def index
    admin_only
    @consuming_enrollments = ConsumingEnrollment.all
  end

  # GET /consuming_enrollments/1
  # GET /consuming_enrollments/1.json
  def show
    admin_only
  end

  # GET /consuming_enrollments/new
  def new
    admin_only
    @consuming_enrollment = ConsumingEnrollment.new
  end

  # GET /consuming_enrollments/1/edit
  def edit
    admin_only
  end

  # POST /consuming_enrollments
  # POST /consuming_enrollments.json
  def create
    admin_only
    @consuming_enrollment = ConsumingEnrollment.new(consuming_enrollment_params)

    respond_to do |format|
      if @consuming_enrollment.save
        format.html { redirect_to @consuming_enrollment, notice: 'Consuming enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @consuming_enrollment }
      else
        format.html { render :new }
        format.json { render json: @consuming_enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consuming_enrollments/1
  # PATCH/PUT /consuming_enrollments/1.json
  def update
    admin_only
    respond_to do |format|
      if @consuming_enrollment.update(consuming_enrollment_params)
        format.html { redirect_to @consuming_enrollment, notice: 'Consuming enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @consuming_enrollment }
      else
        format.html { render :edit }
        format.json { render json: @consuming_enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consuming_enrollments/1
  # DELETE /consuming_enrollments/1.json
  def destroy
    admin_only
    @consuming_enrollment.destroy
    respond_to do |format|
      format.html { redirect_to consuming_enrollments_url, notice: 'Consuming enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consuming_enrollment
      @consuming_enrollment = ConsumingEnrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consuming_enrollment_params
      params[:consuming_enrollment]
    end
end
