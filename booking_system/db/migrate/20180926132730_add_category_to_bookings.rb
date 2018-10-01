class AddCategoryToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :category, :string
  end
end
