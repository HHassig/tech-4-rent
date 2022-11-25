class AddAverageRatingToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :average_rating, :float
  end
end
