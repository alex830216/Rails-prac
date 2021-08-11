class NotesController < ApplicationController
  # GET 顯示所有資料
  def index
    # @notes = Note.all
    # 排序交給資料庫做 :desc做反向排列
    # 不要做 Note.all.sort.reverse
    # 可寫 all 可不寫，當你沒有要做其他事就寫 all
    @notes = Note.order(id: :desc)
  end

  # GET 到新頁面建立資料
  def new
    @note = Note.new
  end
  
  # POST 寫入資料庫
  def create
      # title = params[:title]
      # content = params[:content]

      # 用 note 去包就不用像上面一樣手動控制一個一個寫入，但要經過清洗
      # 清洗資料 Strong Parameter:防止別人亂寫東西進來，可過濾掉不要的欄位，
      # require輸入資料 permit欄位
      clean_note = params.require(:note).permit(:title, :content)

      # title: 是用來對應到資料表名稱
      # note 只是一個變數用來代替後面那串
      @note = Note.new(clean_note)

      # 如果存檔成功就把網址轉到/notes
      if @note.save
        redirect_to "/notes" 
      else
        # 借views/notes/new.html.erb來畫出來給你看，不是重新讀取 new
        # render 過程發現 @note 不是原本空空的 @note ，而是有帶了(clean_note)參數，
        他會連同參數裡面的東西一起拿過來
        # form_for 會再幫你塞回原本欄位，保留下來
        render :new
      end
  end

  # GET 顯示單一資料
  def show
    # 有要傳到其他方法或 view 就用實體變數
    # find 找不到會噴錯 ActiveRecord::
    # find_by 只會噴 nil
    # 太複雜才會用SQL語法操作，避免 SQL injection
    @note = Note.find(params[:id])
  end
end