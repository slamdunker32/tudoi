class UsersController < ApplicationController

    # ==========ここから追加する==========
    def show
        @user = User.find_by(id: params[:id])
    end
    # ==========ここまで追加する==========

end
