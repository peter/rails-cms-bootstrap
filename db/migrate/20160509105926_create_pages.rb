class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :path, null: false
      t.integer :layout_id, null: false
      t.text :body
      t.integer :site_id, null: false
      t.integer :version_number, null: false
      t.jsonb :doc, null: false, default: '{}'
      t.string :status, default: 'draft'
      t.timestamp :publish_at
      t.timestamp :unpublish_at

      t.timestamps
    end

    add_index :pages, [:path, :site_id], unique: true
    execute MigrateUtil.foreign_key(:pages, :site_id, :sites)
  end
end
