class CreateAddDeletes < ActiveRecord::Migration[6.1]
  # 終端機怎麼對現有model新增欄位的？
  def change
    add_column :notes, :delete_at, :datetime
  end
end
