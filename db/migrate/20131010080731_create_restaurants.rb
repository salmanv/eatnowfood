class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :open_time
      t.integer :close_time

      t.timestamps
    end
  end
end
