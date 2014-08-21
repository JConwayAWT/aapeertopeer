json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :is_admin, :is_tutor, :is_student, :skype_id, :times_available, :additional_information
  json.url user_url(user, format: :json)
end
