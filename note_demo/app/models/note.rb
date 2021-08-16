class Note < ApplicationRecord
    # 驗證交給model
    # 有東西才給過
    # validates = 類別方法 2 個參數，第二個是 hash
    validates :title, presence: true
    validates :content, presence: true

    # 商業邏輯，以後如果要改需求改這邊就好
    def self.available
        where(deleted_at: nil)
    end

    # default_scope 所有的搜尋都會加上後面的條件
    # 可以用 unscope 把他去掉
    default_scope { where(deleted_at: nil) }

    # 一般的 scope 還是要在類別後面加這格方法，default不用
    # scope :available
end
