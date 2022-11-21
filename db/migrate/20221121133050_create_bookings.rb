class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :duration
      t.references :laptop, null: false, foreign_key: true
      t.references :renter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
