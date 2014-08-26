json.array!(@session_reviews) do |session_review|
  json.extract! session_review, :id, :date, :knows_and_understands, :explains_clearly, :asks_me_questions, :listens_and_understands, :checks_my_understanding, :is_patient, :is_friendly, :alternative_explanations, :accomodates, :uses_aids, :on_time, :overall_helpful, :additional_comments
  json.url session_review_url(session_review, format: :json)
end
