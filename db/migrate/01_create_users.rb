class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :volunteer_experience
      t.string :location
      t.string :bio
      t.string :phone
    end
  end
end
