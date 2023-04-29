class ApplicationController < ActionController::Base

    # ==========ここから追加する==========
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    def hello
      render html: "hello,Fly.io!"
    end

    protected
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end
    # ==========ここまで追加する==========
  
  end
  