# ActionController::Base 不可控制，不能修改
# ApplicationController 可控制，讓他去做修改，把共用的放這
# 要讓他做繼承
class ApplicationController < ActionController::Base

  # 讓所有controller 都可以自動用這個方法
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render file: "public/404.html", status: 404
  end
end
