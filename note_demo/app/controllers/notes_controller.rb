class NotesController < ApplicationController
  # 在做每件事前先做後面的東西 = before_filter
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  # 要登入才能做新增修改刪除等動作
  before_action :check_login!, except: [:index, :show]
  # 細分controller 讓每個 controller 做他們自己該做的事就好

  # GET 顯示所有資料
  def index
    # @notes = Note.all
    # 排序交給資料庫做 :desc做反向排列
    # 不要做 Note.all.sort.reverse
    # 可寫 all 可不寫，當你沒有要做其他事就寫 all

    # 把刪除時間加進去讓他看起來是被刪掉的
    # 用 where 過濾，沒點刪除的都是 nil
    # @notes = Note.where(deleted_at: nil).order(id: :desc)
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

      # title: 是用來對應到資料表名稱
      # note 只是一個變數用來代替後面那串
      @note = Note.new(note_params)

      # 如果存檔成功就把網址轉到/notes
      if @note.save
        redirect_to "/notes" 
      else
        # 借views/notes/new.html.erb來畫出來給你看，不是重新讀取 new
        # render 過程發現 @note 不是原本空空的 @note ，而是有帶了(clean_note)參數，
        # 他會連同參數裡面的東西一起拿過來
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
    # @note = Note.find(params[:id])
  end
  # edit => update
  # new => create
  def edit
    # @note = Note.find(params[:id])
  end
  def update
    # @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to "/notes" 
    else
      render :edit
    end
  end
  def destroy
    # @note = Note.find(params[:id])
    # 控制能不能顯示，不要真的刪掉
    # 讓他從原本的刪除變成更新資料 destroy 改 update
    # 更新刪除的時間，預設都是 null 點了之後會變成 true
    @note.update(deleted_at: Time.now)
    redirect_to "/notes"
  end

  private
  # :note 從params來的，當初慣例設計就是單數
  def note_params
    params.require(:note).permit(:title, :content)
  end
  def find_note
    # begin
      @note = Note.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
      # render html: "找不到"
      # render file: "public/404.html", status: 404
    # end
  end

  
end