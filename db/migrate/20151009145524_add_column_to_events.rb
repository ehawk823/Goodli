class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :from_change, :boolean
  end
end
