class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      # ユーザーの保存が失敗した場合にログにエラーメッセージを出力
      logger.error "User registration failed: #{resource.errors.full_messages}"
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

    protected
  
    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
  
    # ==========ここから追加する==========
    def after_update_path_for(resource)
      user_path(resource)
    end
  
  end
  