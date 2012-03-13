class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.string :text
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
