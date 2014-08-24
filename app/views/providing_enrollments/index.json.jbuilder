json.array!(@providing_enrollments) do |providing_enrollment|
  json.extract! providing_enrollment, :id
  json.url providing_enrollment_url(providing_enrollment, format: :json)
end
