class ChatttyCreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.string :body
      t.string :at_users
      t.string :topics
      t.string :people
      
      t.timestamps
    end
    
    add_index :activities, :at_users
    add_index :activities, :topics
    add_index :activities, :people
    
  end

  def self.down
    drop_table :activities
  end
end
