class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false, uniqueness: true
      t.string :address, null: false, uniqueness: true
    end
  end
end
