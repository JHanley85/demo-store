class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :count
      t.integer :user_id

      t.timestamps
    end
  end
end
