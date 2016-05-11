class CreatePageVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :page_versions do |t|
      t.integer :page_id, null: false
      t.integer :version_number, null: false
      t.string :title
      t.string :path
      t.text :body
      t.jsonb :doc, null: false, default: '{}'
      t.string :status, default: 'draft'
      t.timestamp :publish_at
      t.timestamp :unpublish_at

      t.timestamps
    end

    execute MigrateUtil.foreign_key(:page_versions, :page_id, :pages)
  end
end
