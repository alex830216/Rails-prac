# 繼承
class PagesController < ApplicationController

    # 沒有main就生一個main方法給他
    def main
    # 生一個人給他，可用 render 或 自己創一個檔案
    # render html: "hi"
    # app/views/pages/main.html.erb
      
      # 建立實體變數讓他在main.html.erb可以印出來
      @xxx = 123
    end
end