class UsersController < ApplicationController
    def sign_up
        @user = User.new
    end
    def sign_in
        @user = User.new
    end
    # sign_up 送出後會送到 create
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
		params.require(:user).permit(:email,
			                         :password,
									 :password_confirmation,
									 :account)
	end
end
