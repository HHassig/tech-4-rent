# class CreateLaptops < ActiveRecord::Migration[7.0]
#   def change
#     create_table :laptops do |t|
#       t.references :user, null: false, foreign_key: true
#       t.string :title
#       t.float :price

#       t.timestamps
#     end
#   end
# end
