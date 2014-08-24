json.array!(@consuming_enrollments) do |consuming_enrollment|
  json.extract! consuming_enrollment, :id
  json.url consuming_enrollment_url(consuming_enrollment, format: :json)
end
