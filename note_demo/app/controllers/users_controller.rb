class UsersController < ApplicationController
    def sign_up
        @user = User.new
    end
    def sign_in
        @user = User.new
    end
    def create
        @user = User.new(user_params)

        # 不要存明碼到資料庫
        # CRUD callback 要知道
        if @user.save
            redirect_to "/"
        else
            render :sign_up
        end
    end

    def profile
    end

    private
    def user_params
      params.require(:user).permit(:account, :password, :email)
    end 

    
    
end
