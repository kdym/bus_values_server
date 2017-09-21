class CreateDaysVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :days_vehicles do |t|
      t.references :vehicle, foreign_key: true
      t.references :day, foreign_key: true
    end
  end
end
