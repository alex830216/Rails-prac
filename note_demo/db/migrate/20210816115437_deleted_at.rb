class DeletedAt < ActiveRecord::Migration[6.1]
  # 新增欄位: 資料表名稱,欄位名稱,型態
  # 新增索引: 加快查詢
  def change
    add_column :notes, :deleted_at, :datetime
    add_index :notes, :deleted_at
  end
end
