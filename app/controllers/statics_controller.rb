class StaticsController < ApplicationController
  before_action :set_static, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:find_tutors, :list_tutors, :update_admin]


  # GET /statics
  # GET /statics.json
  def index
    admin_only
    @statics = Static.all
  end

  # GET /statics/1
  # GET /statics/1.json
  def show
    admin_only
  end

  # GET /statics/new
  def new
    admin_only
    @static = Static.new
  end

  # GET /statics/1/edit
  def edit
    admin_only
  end

  # POST /statics
  # POST /statics.json
  def create
    admin_only
    @static = Static.new(static_params)

    respond_to do |format|
      if @static.save
        format.html { redirect_to @static, notice: 'Static was successfully created.' }
        format.json { render :show, status: :created, location: @static }
      else
        format.html { render :new }
        format.json { render json: @static.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statics/1
  # PATCH/PUT /statics/1.json
  def update
    admin_only
    respond_to do |format|
      if @static.update(static_params)
        format.html { redirect_to @static, notice: 'Static was successfully updated.' }
        format.json { render :show, status: :ok, location: @static }
      else
        format.html { render :edit }
        format.json { render json: @static.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statics/1
  # DELETE /statics/1.json
  def destroy
    admin_only
    @static.destroy
    respond_to do |format|
      format.html { redirect_to statics_url, notice: 'Static was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_tutors
    subjects = current_user.subjects_learning.order(:name)
    @names_and_ids = []
    subjects.each do |s|
      @names_and_ids << [s.name, s.id]
    end
  end

  def list_tutors
    @pe = ProvidingEnrollment.where(subject_id: params[:subject].to_i)
    @subject= Subject.find(params[:subject].to_i)
  end

  def update_admin
    if params[:password] == "temporary_password"
      if signed_in?
        current_user.is_admin = true
        current_user.save!

        flash[:notice] = "You now have administrator privileges."
        redirect_to user_path(current_user) and return
      end
    else
      flash[:alert] = "We were unable to grant administrator privileges.  Please ensure that you have entered the correct password and that you are signed in."
      redirect_to user_path(current_user) and return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static
      @static = Static.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def static_params
      params[:static]
    end
end
