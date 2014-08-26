class ProvidingEnrollmentsController < ApplicationController
  before_action :set_providing_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /providing_enrollments
  # GET /providing_enrollments.json
  def index
    @providing_enrollments = ProvidingEnrollment.all
  end

  # GET /providing_enrollments/1
  # GET /providing_enrollments/1.json
  def show
  end

  # GET /providing_enrollments/new
  def new
    @providing_enrollment = ProvidingEnrollment.new
  end

  # GET /providing_enrollments/1/edit
  def edit
  end

  # POST /providing_enrollments
  # POST /providing_enrollments.json
  def create
    @providing_enrollment = ProvidingEnrollment.new(providing_enrollment_params)

    respond_to do |format|
      if @providing_enrollment.save
        format.html { redirect_to @providing_enrollment, notice: 'Providing enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @providing_enrollment }
      else
        format.html { render :new }
        format.json { render json: @providing_enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providing_enrollments/1
  # PATCH/PUT /providing_enrollments/1.json
  def update
    respond_to do |format|
      if @providing_enrollment.update(providing_enrollment_params)
        format.html { redirect_to @providing_enrollment, notice: 'Providing enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @providing_enrollment }
      else
        format.html { render :edit }
        format.json { render json: @providing_enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providing_enrollments/1
  # DELETE /providing_enrollments/1.json
  def destroy
    @providing_enrollment.destroy
    respond_to do |format|
      format.html { redirect_to providing_enrollments_url, notice: 'Providing enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_providing_enrollment
      @providing_enrollment = ProvidingEnrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def providing_enrollment_params
      params[:providing_enrollment]
    end
end
