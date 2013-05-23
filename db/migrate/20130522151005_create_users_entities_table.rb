class CreateUsersEntitiesTable < ActiveRecord::Migration
  def change
    create_table :users_entities do |t|
      t.integer :user_id
      t.integer :entity_id
      
      t.timestamps
    end
  end
end
