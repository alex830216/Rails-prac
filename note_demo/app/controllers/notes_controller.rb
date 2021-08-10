class NotesController < ApplicationController
  def index
  end
  def new
    # 用 Note.new 做出一個新的 model ，生一個 @note 實體出來，用 @note 才能把值帶到別的檔案
    # model 用來放資料庫相關資料，Note 是從 model 來的，裡面有一個 class 叫做 model
    # controller 用來產生物件及資料運算，所以@note = Note.new 會放這邊
    @note = Note.new
  end
  def create
      # 安插 debugger + 輸入 params 可以印出包含用戶所有傳進來的參數的 hash
      # 要印出 hash 可以用 [ ] 裡面放符號或字串都行，為何字串也行是因為 Rails使用到 HashWithIndifferentAccess 這個類別做出來的
      # 而我想找出用戶傳進來的內容所以才這樣寫
      title = params[:title]
      content = params[:content]

      # why title: content: 有甚麼用處???
      # 是用來對應到資料表名稱?
      # note 只是一個變數用來代替後面那串
      note = Note.new(title: title, content: content)

      # 如果存檔成功就把網址轉到/notes
      if note.save
        redirect_to "/notes"
      else
      end
  end
end