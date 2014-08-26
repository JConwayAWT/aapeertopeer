json.array!(@tutor_applications) do |tutor_application|
  json.extract! tutor_application, :id, :full_name, :grade, :email, :times_available
  json.url tutor_application_url(tutor_application, format: :json)
end
