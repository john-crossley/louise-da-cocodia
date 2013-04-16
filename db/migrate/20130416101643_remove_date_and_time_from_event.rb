class RemoveDateAndTimeFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :date_and_time
  end

  def down
    add_column :events, :date_and_time, :datetime
  end
end
