class DropAirlinePassengers < ActiveRecord::Migration[5.2]
  def change
    drop_table :airline_passengers
  end
end
