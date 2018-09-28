class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :room_id
      t.string :description
      t.date :date
      t.time :start
      t.time :end
      t.datetime :created_at
      t.datetime :updated_at
      t.string :category
      t.boolean :pending

      t.timestamps
    end
  end
end
