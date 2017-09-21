class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.decimal :valor, precision: 10, scale: 2
      t.string :categoria
      t.integer :horas
      t.references :vehicle, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
