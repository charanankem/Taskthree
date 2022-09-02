class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :mobile_number])
    end
    def after_sign_in_path_for(resource)
      if current_user
        homepage_path
      else
        render root_path
      end
    end

end
