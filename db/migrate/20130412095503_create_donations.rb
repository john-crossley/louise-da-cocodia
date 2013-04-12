class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.integer :amount
      t.string :email
      t.boolean :anonymous, default: false

      t.timestamps
    end
  end
end
