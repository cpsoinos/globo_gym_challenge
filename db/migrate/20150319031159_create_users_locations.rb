class CreateUsersLocations < ActiveRecord::Migration
  def change
    create_table :users_locations do |t|
      t.integer :user_id, null: false, uniqueness: true
      t.integer :location_id, null: false, uniqueness: true
    end
  end
end
