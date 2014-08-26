class Request < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
  belongs_to :tutor, class_name: "User"
  belongs_to :subject

  #POSSIBLE STATUSES: REQUESTED, ACCEPTED, REJECTED, NEEDS SURVEY, COMPLETED

  def get_survey
    SessionReview.find_by_request_id(self.id)
  end
end
