class AddMessageColumnToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :message, :text
  end
end
