# step 2 建立常數，就算不用類別，直接宣告常數也會過
# be(30) = matcher
# 看不懂的都是rspect 送你的方法
# 每個方法都只做他該做的事
class ATM
	def initialize(origin)
		@origin = origin
	end
	def deposit(money)
    if money > 0
      @origin = @origin + money
    else
      @origin
    end
	end
  def withdraw(money)
    # if money > 0
    #   @origin = @origin - money
    #   return money
    # else
    #   return 0
    # end
    # 重做
    if money > 0 and enough?(money)
      return @origin = @origin - money
    else 
      return 0
    end
  end
	# balance 只負責回傳
  # reader
	def balance
		@origin
	end

  # 定義方法給他意義
  private
  def enough?(money)
    money <= @origin
  end
end