class SessionReview < ActiveRecord::Base
  belongs_to :subject
  belongs_to :request
  belongs_to :learner, class_name: "User"
  belongs_to :tutor, class_name: "User"
end
