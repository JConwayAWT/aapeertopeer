class Request < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
  belongs_to :tutor, class_name: "User"
  belongs_to :subject
  validates :subject_id, presence: true
  has_one :session_review, dependent: :destroy

  #POSSIBLE STATUSES: REQUESTED, ACCEPTED, REJECTED, NEEDS SURVEY, COMPLETED

  def get_survey
    SessionReview.find_by_request_id(self.id)
  end
end
