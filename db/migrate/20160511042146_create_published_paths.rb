class CreatePublishedPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :published_paths do |t|
      t.string :path, null: false
      t.integer :site_id, null: false
      t.integer :item_id, null: false
      t.string :item_type, null: false

      t.timestamps
    end

    add_index :published_paths, [:path, :site_id], unique: true
  end
end
