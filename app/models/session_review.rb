class SessionReview < ActiveRecord::Base
  belongs_to :subject
  belongs_to :request
  belongs_to :learner, class_name: "User"
  belongs_to :tutor, class_name: "User"

  def average_score
        if self.request.status != "Completed"
            return "Pending..."
        end

        sum = 0
        sum += self.knows_and_understands + self.explains_clearly + self.asks_me_questions
        sum += self.listens_and_understands + self.checks_my_understanding + self.is_patient
        sum += self.is_friendly + self.alternative_explanations + self.accomodates
        sum += self.uses_aids + self.on_time + self.overall_helpful
        score = sum/12.0
        return score.round(2).to_s
  end
end
