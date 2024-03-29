class ApplicationController < ActionController::Base

    # ==========ここから追加する==========
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
      end
    # ==========ここまで追加する==========
  
  end
  