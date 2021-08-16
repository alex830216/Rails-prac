require 'digest'

class SessionsController < ApplicationController
    def create
      # 先加密再驗證才會正確
 
      # 發 session(cookie): 一種認證機制
      # 拿到 cookie 不等於登入
      # 登入 = 拿到 session 而且可以做裡面的事
      # 登入成功會發令牌(cookie)給你，瀏覽器會留一個 session 做比對，看是否正確
      # 會有時間性，如果過期要再重新登入
      # 或是對方 server 重新啟動也要重新登入

      # HTTP本身是沒有狀態的，在這邊做任何事情，接著跳到其他頁面再回來不會保留
      # 透過 params 或是 cookie 知道前一頁的資料
      # 可以把前一頁的資料存在 cookie 留到下一頁用
      # localstorage = 大型 cookie
      # 看你有 cookie 就讓你登入
      # 沒有就不讓你登入

      # 驗證 email & password
      # 對照 user.rb 的
      pw = user_params[:password]
      salted_pw = "xyz#{pw}827128#{pw}82-12j23h"
      hashed_password = Digest::SHA1.hexdigest(salted_pw)

      user = User.find_by(email: user_params[:email],
                          password: hashed_password)

      if user
        # session 取名隨意
        # 用 session 方法把 user.id 送進來 thankyou9527
        session[:thankyou9527] = user.id
        redirect_to "/"
      else
        redirect_to "/users/sign_in"
      end
    end

    
    # 登出 = 把sessions刪掉
    def destroy
      session[:thankyou9527] = nil
      redirect_to "/"
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
