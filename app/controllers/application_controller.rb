class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :update_active_time

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, 
      :first_name, :last_name, :skype_id, :times_available, :additional_information)}
  end

  def after_sign_in_path_for(user)
    user_path(user)
  end

  def admin_only
    unless current_user.is_admin == true
      flash[:alert] = "You do not have permissions allowing you to complete your requested action."
      redirect_to user_path(current_user)
    end
  end

  def update_active_time
    if signed_in?
      current_user.last_active_time = Time.now
      current_user.save!
    end
  end

end
