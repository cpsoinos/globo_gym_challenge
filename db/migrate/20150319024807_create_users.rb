class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, uniqueness: true
      t.string :address, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :credit_card, null: false
    end
  end
end
