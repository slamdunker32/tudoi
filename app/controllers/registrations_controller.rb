class RegistrationsController < Devise::RegistrationsController

    protected
  
    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
  
    # ==========ここから追加する==========
    def after_update_path_for(resource)
      user_path(resource)
    end
    # ==========ここまで追加する==========
  
  end
  