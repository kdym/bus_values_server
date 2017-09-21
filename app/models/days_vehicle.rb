class DaysVehicle < ApplicationRecord
  belongs_to :vehicle
  belongs_to :day
end