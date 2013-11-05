class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
