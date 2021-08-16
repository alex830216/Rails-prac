# ActionController::Base 不可控制，不能修改
# ApplicationController 可控制，讓他去做修改，把共用的放這
# 要讓他做繼承
# 寫在這邊讓所有controller 都可以自動用這邊的方法
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # view helper 跟 controller 都會用到 helper_method 裡面的方法
  # 用 helper_method 把 controller 功能匯出到 view helper，寫一次就好
  # 或是寫在 view helper 再外掛模組進來也可以
  helper_method :user_signed_in?, :current_user

	private

  # 有 session
  def user_signed_in?
    session[:thankyou9527] != nil
  end

  # 如果有用戶的 session 就可以登入
  def current_user
    if user_signed_in?
      User.find(session[:thankyou9527])
    else
      nil
    end
  end

  # 沒有 session 就要重登
	def check_login!
		if not user_signed_in?
			redirect_to "/users/sign_in"
		end
	end

	def record_not_found
		render file: "public/404.html", status: :not_found
	end
end
