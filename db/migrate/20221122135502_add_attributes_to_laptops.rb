class AddAttributesToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :brand, :string
    add_column :laptops, :model, :string
    add_column :laptops, :screen_size, :float
    add_column :laptops, :hard_drive, :integer
    add_column :laptops, :ram, :integer
    add_column :laptops, :year_built, :integer
  end
end
