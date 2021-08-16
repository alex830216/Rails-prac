class User < ApplicationRecord
    # 可以用 attr accessor 騙他，實際上沒有這個欄位（不建議）
    # 不要在資料庫存明碼
    # attr_accessor: :password_confirmation

    # confirmation = 確認兩個欄位值是一樣的, uniqueness = 唯一值，
    # 兩個都是驗證器
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :account, presence: true, uniqueness: true

    before_create :encrypt_password

    # 手刻會員系統，面試可能會考

    # 加密方法：
    # MD5 已被破解
    # SHA 比較安全

    # 密碼只能被加密一次，兩次以上會看不懂
    # 放before_create 因爲怕重複 看官網方法
    require "digest"
    def encrypt_password
        # Digest::MD5.hexdigest(pw)
        # salting:在密碼裡面加東西，讓他比較複雜
        salted_pw = "eiojre#{self.password}rewropwr"
        self.password = Digest::SHA1.hexdigest(salted_pw)
    end
end
