class CreateRice < ActiveRecord::Migration[6.1]
  def change
    create_table :rice do |t|
      t.string :guest
      t.string :payment

      t.timestamps
    end
  end
end
