class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :query
      t.integer :user_id

      t.timestamps
    end
  end
end
