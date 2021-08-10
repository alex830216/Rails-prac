# 命名慣例，+_spec
# RS
# RSpec 送你的：describe、it
# 用最小力氣完成任務
# 紅燈、綠燈
# context = describe
# context 在跑測試時會告訴我們是哪段測試出錯，
# 是哪個 context 出錯
# Refactor 重構:外在行為不改，改內部結構或物件或物件名稱
require "./atm"

# step 1
RSpec.describe ATM do
	context "領錢功能" do
	  it "可以領錢" do
		  # Arrange
      atm = ATM.new(100)
			# Act
			money = atm.withdraw(-50)
			# Assert
			# 正常用常理測試 = 50 ，邊界測試會 = 0
			expect(atm.balance).to be 100
			# 不寫也沒差，不在規格內
			expect(money).to be 0
		end
		it "不能領 0 元或是小於 0 元的金額" do
		  # Arrange
      atm = ATM.new(100)
			# Act
			money = atm.withdraw(50)
			# Assert
			# 正常用常理測試 = 50 ，邊界測試會 = 0
			expect(atm.balance).to be 50
			expect(money).to be 50
		end	
		it "不能領超過本身餘額" do
		  # Arrange
      atm = ATM.new(100)
			# Act
			money = atm.withdraw(150)
			# Assert
			# 正常用常理測試 = 50 ，邊界測試會 = 0
			expect(atm.balance).to be 100
			expect(money).to be 0
		end	
	end 
  context "存錢功能" do
    # it = test
    it "可以存錢" do
			# Arrange
      atm = ATM.new(10)
			# Act
			atm.deposit(20)
			# Assert
			expect(atm.balance).to be 30
    end
		it "不可以存 0 元或是小於 0 元的金額（越存錢越少！）" do
			# Arrange
      atm = ATM.new(10)
			# Act
			atm.deposit(-10)
			# Assert
			expect(atm.balance).to be 10
    end
  end    
end

# 執行 rspec name