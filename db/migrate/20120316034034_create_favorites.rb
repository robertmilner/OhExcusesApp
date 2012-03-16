class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favorable, :polymorphic => true
      t.references :user

      t.timestamps
    end
    add_index :favorites, :favorable_id
    add_index :favorites, :user_id
  end
end
