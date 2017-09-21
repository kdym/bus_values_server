class AddCascadeDeleteToDaysVehicles < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :days_vehicles, :vehicles
    remove_foreign_key :days_vehicles, :days

    add_foreign_key :days_vehicles, :vehicles, on_delete: :cascade
    add_foreign_key :days_vehicles, :days, on_delete: :cascade
  end
end
