class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
    end
    # Couldn't you use t.references instead of integer to enable indexing AND foreign key contraints
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
    # Is the third add_index repeating what the previous two had done?
  end
end
