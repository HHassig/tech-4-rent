class AddAttrToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :laptop_id, :integer
    add_column :reviews, :review, :integer
  end
end
