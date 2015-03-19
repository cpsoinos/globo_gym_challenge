class ChangeUserCreditCardDataTypeToString < ActiveRecord::Migration
  def up
    remove_column :users, :credit_card
    add_column :users, :credit_card, :string
  end
  def down
    remove_column :users, :credit_card
    add_column :users, :credit_card, :integer
  end
end
