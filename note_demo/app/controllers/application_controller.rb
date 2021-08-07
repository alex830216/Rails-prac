# ActionController::Base 不可控制，不能修改
# ApplicationController 可控制，讓他去做修改，把共用的放這
# 要讓他做繼承
class ApplicationController < ActionController::Base
end
