class CommentsController < ApplicationController
	# 抓資料，清洗資料

	
		# model 有寫belongto 這邊要兩個欄位才能正ㄔㄤˊ送出
		# merge 只會回傳我添加的東西(必須是 hash)，不會改變我原始物件的內容
	

	
		before_action :check_login!
		before_action :find_user_note
	
		def create
			@note.comments.new(comment_params)
			
			# @note.user = current_user

			# if @note.save
			# 	# 可省 note_path
			# 	# redirect_to note_path(@note)
			# 	redirect_to @note
			# else
			# 	redirect_to "/"
			# end
		end
	
		private
		def comment_params
			params.require(:comment)
						.permit(:content)
						# 語法糖衣 原本:應該寫在前面
						.merge(user_id: current_user.id)
		end
	
		# 把current user 改掉，讓每個人都可以看
		def find_user_note
			@note = Note.find(params[:note_id])
		end
	
end
