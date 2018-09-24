class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.string :description
      t.date :date
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
