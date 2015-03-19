class AddLocationsIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :locations_id, :integer, null: false
  end
  def down
    remove_column :users, :locations_id
  end
end
