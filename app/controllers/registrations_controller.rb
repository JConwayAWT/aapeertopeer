class RegistrationsController < Devise::RegistrationsController

    def create

      if (params[:user][:email].downcase.ends_with?("@archmereacademy.com") == false)
        unless params[:user][:email] == "conwayje@gmail.com" or params[:user][:email] == "jeff@arcweb.co"
          flash[:alert] = "You must sign up with your @archmereacademy.com email address."
          redirect_to new_user_registration_path and return
        end
      end

      if (params[:user][:first_name].blank? or params[:user][:last_name].blank?)
        flash[:alert] = "You must include a first name and last name"
        redirect_to new_user_registration_path and return
      end

      if (params[:user][:skype_id].blank?)
        flash[:alert] = "You must provide a Skype ID"
        redirect_to new_user_registration_path and return
      end

      build_resource(sign_up_params)

      resource.is_student = true

      resource_saved = resource.save
      yield resource if block_given?
      if resource_saved
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        @validatable = devise_mapping.validatable?
        if @validatable
          @minimum_password_length = resource_class.password_length.min
        end
        respond_with resource
      end
    end

end