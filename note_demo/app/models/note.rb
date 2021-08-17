class Note < ApplicationRecord
    
    # 驗證交給model
    # 有東西才給過
    # validates = 類別方法 2 個參數，第二個是 hash
    validates :title, presence: true
    validates :content, presence: true

    # 定義類別方法
    # def self.available
    #     where(deleted_at: nil)
    # end
    # default_scope 所有的搜尋都會加上後面的條件
    # 可以用 unscope 把他去掉
    # 商業邏輯，以後如果要改需求改這邊就好
    # 把刪除時間加進去讓他看起來是被刪掉的
    # 用 where 過濾，沒點刪除的都是 nil
    # default_scope { where(deleted_at: nil) }

    # 一般的 scope 還是要在類別後面加這個方法名稱，default不用 => 不用寫 available
    # scope :available

    # https://github.com/rubysherpas/paranoia
    # 直接用 acts_as_paranoid 內建套件取代 default_scope { where(deleted_at: nil) }
    # 使用前先在 Gemfile 寫入 gem "paranoia", "~> 2.2"
    # 接著輸入 bundle install，如果沒反應就重開 server
    acts_as_paranoid

    belongs_to :user
    has_many :comments
    has_many :bookmarks
    has_many :users
    # 虛線，透過bookmarks連接
end
