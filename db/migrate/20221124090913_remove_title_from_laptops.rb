class RemoveTitleFromLaptops < ActiveRecord::Migration[7.0]
  def change
    remove_column :laptops, :title, :string
  end
end
