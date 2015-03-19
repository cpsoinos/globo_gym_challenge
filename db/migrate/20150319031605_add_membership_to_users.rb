class AddMembershipToUsers < ActiveRecord::Migration
  def up
    add_column :users, :membership, :string
  end
  def down
    remove_column :users, :membership
  end
end
