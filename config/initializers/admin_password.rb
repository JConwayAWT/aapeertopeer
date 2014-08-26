unless Rails.env.production?
  ENV['CREATE_ADMIN_PASSWORD'] = "password"
end