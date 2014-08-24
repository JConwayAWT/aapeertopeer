class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @select_options = []
    User.all.each do |user|
      @select_options << [user.display_name, user.id]
    end
  end

  # GET /subjects/1/edit
  def edit

    @select_options = []
    User.all.each do |user|
      @select_options << [user.display_name, user.id]
    end

  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    new_tutor_ids = []
    unless params[:subject][:people_teaching_attributes].blank?
      params[:subject][:people_teaching_attributes].each do |attribute|
        id = attribute[1][:incoming_tutor_id]
        new_tutor_ids << id unless attribute[1][:_destroy] == "1"
      end
    end

    debugger
    puts 'db'

    respond_to do |format|
      if @subject.save

        unless new_tutor_ids == []
          new_tutor_ids.each do |id|
            e = ProvidingEnrollment.new
            e.user_id = id
            e.subject_id = @subject.id
            e.save!
          end
        end

        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update

    new_tutor_ids_plus_deletion = []
    unless params[:subject][:people_teaching_attributes].blank?
      params[:subject][:people_teaching_attributes].each do |attribute|
        if attribute[1][:incoming_tutor_id].nil?
          id = attribute[1][:id]
        else
          id = attribute[1][:incoming_tutor_id]
        end
        destroy = attribute[1][:_destroy]
        new_tutor_ids_plus_deletion << [id, destroy]
      end
    end

    respond_to do |format|
      if @subject.update(subject_params)

        unless new_tutor_ids_plus_deletion == []
          new_tutor_ids_plus_deletion.each do |pair|
            if pair[1] == "1" #that means we should delete this one...
              e = ProvidingEnrollment.find_by_user_id_and_subject_id(pair[0], @subject.id)
              begin
                e.destroy!
              rescue
                puts 'Looks like that user was added and removed in one go...'
              end
            else #that means we should make a new one if it doesn't already exist...
              if ProvidingEnrollment.find_by_user_id_and_subject_id(pair[0], @subject.id).nil?
                e = ProvidingEnrollment.new
                e.user_id = pair[0]
                e.subject_id = @subject.id
                e.save!
              end
            end
          end
        end

        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
