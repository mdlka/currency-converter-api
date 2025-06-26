class CreateConversions < ActiveRecord::Migration[8.0]
  def change
    create_table :conversions do |t|
      t.string :from
      t.string :to
      t.decimal :amount
      t.decimal :result

      t.timestamps
    end
  end
end
