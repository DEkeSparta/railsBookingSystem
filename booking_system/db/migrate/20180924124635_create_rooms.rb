class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.string :details

      t.timestamps
    end
  end
end
