class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
