class ConsumingEnrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
end
