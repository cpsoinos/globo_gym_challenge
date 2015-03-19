class CreateMembershipsToJoinUsersLocations < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :user_id, null: false, uniqueness: true
      t.string :location_id, null: false, uniqueness: true
    end
  end
end
