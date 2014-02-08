class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.datetime :date
      t.integer :number_of_guests
      t.string :restaurant_id
      t.string :guest_id

      t.timestamps
    end
  end
end
