class CreateViews < ActiveRecord::Migration
  def change
    create_table :views, :force => true do |t|
      t.references :viewer, :polymorphic => true
      t.references :viewable, :polymorphic => true
      t.integer :times_viewed, :default => 1
      t.datetime :past_time_viewed, :default => Time.now
      t.timestamps
    end

    add_index :views, [:viewer_id, :viewer_type]
    add_index :views, [:viewable_id, :viewable_type]
  end

end