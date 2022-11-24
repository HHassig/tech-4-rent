class AddAddressToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :address, :string
  end
end
