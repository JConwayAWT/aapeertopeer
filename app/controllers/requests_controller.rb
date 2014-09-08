class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :respond]
  before_action :authenticate_user!
  
  # GET /requests
  # GET /requests.json
  def index
    @requests_out = Request.where(learner_id: current_user.id)
    @requests_in = Request.where(tutor_id: current_user.id)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    owner_admin_only
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    owner_admin_only
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    owner_admin_only
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    owner_admin_only
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_request
    @tutor = User.find(params[:tutor_id].to_i)
    @subject = Subject.find(params[:subject_id].to_i) 
  end

  def send_request
    r = Request.new(time: params[:time], status: "Requested", additional_information: params[:info],
      subject_id: params[:subject_id].to_i, learner_id: current_user.id.to_i, 
      tutor_id: params[:tutor_id].to_i, duration: params[:duration].to_d)
    r.save!

    sr = SessionReview.new
    sr.tutor_id = params[:tutor_id].to_i
    sr.learner_id = current_user.id.to_i
    sr.request_id = r.id
    sr.subject_id = params[:subject_id].to_i
    sr.save!

    flash[:notice] = "Your request has been sent.  You can check your Requests tab for updates at any time."
    redirect_to user_path(current_user)
  end

  def respond
    owner_admin_only
    @status_options = [["Accepted","Accepted"],["Rejected","Rejected"]]
  end

  def update_response #from the tutor
    @request = Request.find(params[:request_id].to_i)
    owner_admin_only
    @request.status = params[:status]
    @request.rejection_message = params[:message]
    @request.save!

    redirect_to requests_path
  end

  def view_all
    admin_only
    @requests = Request.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:time, :status)
    end

    def owner_admin_only
      unless @request.tutor == current_user or @request.learner == current_user or current_user.is_admin == true
        flash[:alert] = "You do not have permission to take the requested action"
        redirect_to user_path(current_user)
      end
    end
end
