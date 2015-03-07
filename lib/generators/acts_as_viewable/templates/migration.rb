class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :viewer, polymorphic: true
      t.references :viewable, polymorphic: true, null: false
      t.integer :times_viewed, default: 1
      t.datetime :past_time_viewed
      t.timestamps
    end

    add_index :views, [:viewer_id, :viewer_type]
    add_index :views, [:viewable_id, :viewable_type]
    add_index :views, [:viewer_id, :viewer_type,:viewable_id, :viewable_type], unique: true, name: :unique_index_view
  end
end
