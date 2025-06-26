class CreateConversions < ActiveRecord::Migration[8.0]
  def change
    create_table :conversions do |t|
      t.string :from, null: false
      t.string :to, null: false
      t.decimal :amount, null: false
      t.decimal :result, null: false

      t.timestamps
    end
  end
end
