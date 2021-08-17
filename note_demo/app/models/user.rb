# 使用 Digest 方法要先 require 進來
require 'digest'

class User < ApplicationRecord
    # 可以用 attr accessor 騙他，實際上沒有這個欄位（不建議）
    # attr_accessor: :password_confirmation
    # 不要在資料庫存明碼
    # confirmation = 確認兩個欄位值是一樣的, uniqueness = 唯一值，
    # 兩個都是驗證器
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :account, presence: true, uniqueness: true

    # 各種 callback https://guides.rubyonrails.org/active_record_callbacks.html
    # 放before_create 因爲怕會跟其他的 callback 重複，新增跟修改都會觸發
    # before after 自己要看，知道他們在做啥
    # 使用者被建立前先做加密
    before_create :encrypt_password

    # 有四種方法
    # notes
    # noets= 
    # notes.new
    # notes.create
    has_many :notes

    # 做出相對應的四個方法，可隨便取名
    has_many :bookmarks
    # 預設會去找 favorite_note 這個 model
    # 寫複數預設會去找 favorite_notes 這個 table
    # 所以要幫他指定去找 note 這個 model
    has_many :favorite_notes,
              through: :bookmarks,
              source: :note
              

    # 手刻會員系統，面試可能會考

    # 加密方法：
    # MD5 已被破解
    # SHA 比較安全

    # 密碼只能被加密一次，兩次以上會看不懂
    require "digest"
    def encrypt_password
        # Digest::MD5.hexdigest(pw)
        # salting:在密碼裡面加東西，讓他比較複雜
        salted_pw = "xyz#{self.password}827128#{self.password}82-12j23h"
        self.password = Digest::SHA1.hexdigest(salted_pw)
    end
end
