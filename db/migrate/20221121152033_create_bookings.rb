class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :laptop, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
