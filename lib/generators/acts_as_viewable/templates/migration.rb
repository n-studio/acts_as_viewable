class CreateViews < ActiveRecord::Migration
  def change
    create_table :views, :force => true do |t|
      t.references :viewer, :polymorphic => true
      t.references :viewable, :polymorphic => true
      t.timestamps
    end

    add_index :views, [:viewer_id, :viewer_type]
    add_index :views, [:viewable_id, :viewable_type]
  end

end