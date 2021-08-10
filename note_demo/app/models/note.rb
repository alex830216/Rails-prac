class Note < ApplicationRecord
    # 驗證交給model
    # 有東西才給過
    # validates = 類別方法 2 個參數，第二個是 hash
    validates :title, presence: true
    validates :content, presence: true
end
