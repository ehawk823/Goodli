class AddGiveableKarmaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :giveable_karma, :integer
  end
end
