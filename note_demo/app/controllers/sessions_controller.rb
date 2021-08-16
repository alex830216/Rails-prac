class SessionsController < ApplicationController
    def create
      # 先加密再驗證才會正確
 
      # 發 session(cookie): 一種認證機制
      # 登入 = 拿到 session 而且可以做裡面的事
      # 登入成功會發令牌(cookie)給你，瀏覽器會留一個session做比對，看是否正確
      # 會有時間性，如果過期要再重新登入
      # 或是對方server重新啟動也要重新登入

      # session名字隨意
      # HTTP本身是沒有狀態的，在這邊做任何事情，接著跳到其他頁面再回來不會保留
      # 透過 params 或是 cookie 知道前一頁的資料
      # 可以把前一頁的資料存在 cookie 留到下一頁用
      # localstorage = 大型 cookie
      # 看你有cookie就讓你登入
      # 沒有就不讓你登入

      # 去 def new 那邊做事(檢查你有沒有號碼牌)
      # 有 session 才能做事
    end

    def destroy
      # 登出 = 把sessions刪掉
      ... = nil
    end

    private
end
