class TutorApplicationsController < ApplicationController
  before_action :set_tutor_application, only: [:show, :edit, :update, :destroy]

  # GET /tutor_applications
  # GET /tutor_applications.json
  def index
    @tutor_applications = TutorApplication.all
  end

  # GET /tutor_applications/1
  # GET /tutor_applications/1.json
  def show
  end

  # GET /tutor_applications/new
  def new
    @tutor_application = TutorApplication.new
  end

  # GET /tutor_applications/1/edit
  def edit
  end

  # POST /tutor_applications
  # POST /tutor_applications.json
  def create
    @tutor_application = TutorApplication.new(tutor_application_params)

    respond_to do |format|
      if @tutor_application.save
        format.html { redirect_to @tutor_application, notice: 'Tutor application was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_application }
      else
        format.html { render :new }
        format.json { render json: @tutor_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_applications/1
  # PATCH/PUT /tutor_applications/1.json
  def update
    respond_to do |format|
      if @tutor_application.update(tutor_application_params)
        format.html { redirect_to @tutor_application, notice: 'Tutor application was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_application }
      else
        format.html { render :edit }
        format.json { render json: @tutor_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_applications/1
  # DELETE /tutor_applications/1.json
  def destroy
    @tutor_application.destroy
    respond_to do |format|
      format.html { redirect_to tutor_applications_url, notice: 'Tutor application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_application
      @tutor_application = TutorApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_application_params
      params.require(:tutor_application).permit(:full_name, :grade, :email, :times_available, :subjects, :letters_of_recommendation, :transcript)
    end
end
